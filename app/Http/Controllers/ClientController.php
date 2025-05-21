<?php

namespace App\Http\Controllers;

use App\Models\Notification;
use App\Models\Property;
use App\Models\Subscription;
use App\Models\Client;
use App\Models\ClientDocument;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Models\Role;

class ClientController extends Controller
{

    public function index()
    {
        if (\Auth::user()->can('manage tenant')) {
            $tenants = Client::where('parent_id', parentId())->get();
            return view('tenant.index', compact('tenants'));
        } else {
            return redirect()->back()->with('error', __('Permission Denied!'));
        }
    }


    public function create()
    {
        if (\Auth::user()->can('create tenant')) {
            $property = Property::where('parent_id', parentId())->get()->pluck('name', 'id');
            $property->prepend(__('Select Property'), 0);
            return view('tenant.create', compact('property'));
        } else {
            return redirect()->back()->with('error', __('Permission Denied!'));
        }
    }


    public function store(Request $request)
    {
        if (\Auth::user()->can('create tenant')) {
            $validator = \Validator::make(
                $request->all(),
                [
                    'first_name' => 'required',
                    'last_name' => 'required',
                    'email' => 'required|email|unique:users',
                    'password' => 'required',
                    'phone_number' => 'required',
                    'family_member' => 'required',
                    'country' => 'required',
                    'state' => 'required',
                    'city' => 'required',
                    'zip_code' => 'required',
                    'address' => 'required',
                    'property' => 'required',
                    'unit' => 'required',
                    'booking_start_date' => 'required',
                    'booking_end_date' => 'required',
                ]
            );
            if ($validator->fails()) {
                $messages = $validator->getMessageBag();
                return response()->json([
                    'status' => 'error',
                    'msg' => $messages->first(),
                ]);
            }
            $ids = parentId();
            $authUser = \App\Models\User::find($ids);
            $totalTenant = $authUser->totalTenant();
            $subscription = Subscription::find($authUser->subscription);
            if ($totalTenant >= $subscription->tenant_limit && $subscription->tenant_limit != 0) {
                return response()->json([
                    'status' => 'error',
                    'msg' => __('Your client limit is over, please upgrade your subscription.'),
                    'id' => 0,
                ]);
            }

            $userRole = Role::where('parent_id', parentId())->where('name', 'tenant')->first();
            $setting = settings();

            $user = new User();
            $user->first_name = $request->first_name;
            $user->last_name = $request->last_name;
            $user->email = $request->email;
            $user->password = \Hash::make($request->password);
            $user->phone_number = $request->phone_number;
            $user->type = $userRole->name;
            $user->profile = 'avatar.png';
            $user->lang = 'english';
            $user->parent_id = parentId();
            $user->save();
            $user->assignRole($userRole);

            if ($request->profile != 'undefined') {
                $clientFilenameWithExt = $request->file('profile')->getClientOriginalName();
                $clientFilename = pathinfo($clientFilenameWithExt, PATHINFO_FILENAME);
                $clientExtension = $request->file('profile')->getClientOriginalExtension();
                $clientFileName = $clientFilename . '_' . time() . '.' . $clientExtension;
                $dir = storage_path('upload/profile');
                if (!file_exists($dir)) {
                    mkdir($dir, 0777, true);
                }
                $request->file('profile')->storeAs('upload/profile/', $clientFileName);
                $user->profile = $clientFileName;
                $user->save();
            }

            $client = new Client();
            $client->user_id = $user->id;
            $client->family_member = $request->family_member;
            $client->country = $request->country;
            $client->state = $request->state;
            $client->city = $request->city;
            $client->zip_code = $request->zip_code;
            $client->address = $request->address;
            $client->property = $request->property;
            $client->unit = $request->unit;
            $client->booking_start_date = $request->booking_start_date;
            $client->booking_end_date = $request->booking_end_date;
            $client->parent_id = parentId();
            $client->save();


            if (!empty($request->client_images)) {
                foreach ($request->client_images as $file) {
                    $clientFilenameWithExt = $file->getClientOriginalName();
                    $clientFilename = pathinfo($clientFilenameWithExt, PATHINFO_FILENAME);
                    $clientExtension = $file->getClientOriginalExtension();
                    $clientFileName = $clientFilename . '_' . time() . '.' . $clientExtension;
                    $dir = storage_path('upload/client');
                    if (!file_exists($dir)) {
                        mkdir($dir, 0777, true);
                    }
                    $file->storeAs('upload/client/', $clientFileName);

                    $clientImage = new ClientDocument();
                    $clientImage->property_id = $request->property;
                    $clientImage->client_id = $client->id;
                    $clientImage->document = $clientFileName;
                    $clientImage->parent_id = parentId();
                    $clientImage->save();
                }
            }

            $module = 'client_create';
            $notification = Notification::where('parent_id', parentId())->where('module', $module)->first();
            $notification->password=$request->password;
            $errorMessage='';
            if (!empty($notification) && $notification->enabled_email == 1) {
                $notification_responce = MessageReplace($notification, $user->id);
                $datas['subject'] = $notification_responce['subject'];
                $datas['message'] = $notification_responce['message'];
                $datas['module'] = $module;
                $datas['logo'] =  $setting['company_logo'];
                $to = $user->email;
                $response = commonEmailSend($to, $datas);
                    if ($response['status'] == 'error') {
                        $errorMessage=$response['message'];
                    }
            }


            return response()->json([
                'status' => 'success',
                'msg' => __('Client successfully created.'). '</br>' . $errorMessage,

            ]);
        } else {
            return redirect()->back()->with('error', __('Permission Denied!'));
        }
    }


    public function show(Client $client)
    {
        if (\Auth::user()->can('show client')) {
            return view('client.show', compact('client'));
        } else {
            return redirect()->back()->with('error', __('Permission Denied!'));
        }
    }


    public function edit(Client $client)
    {
        if (\Auth::user()->can('edit client')) {
            $property = Property::where('parent_id', parentId())->get()->pluck('name', 'id');
            $property->prepend(__('Select Property'), 0);

            $user = User::find($client->user_id);
            return view('client.edit', compact('property', 'client', 'user'));
        } else {
            return redirect()->back()->with('error', __('Permission Denied!'));
        }
    }


    public function update(Request $request, Client $client)
    {
        if (\Auth::user()->can('edit client')) {
            $validator = \Validator::make(
                $request->all(),
                [
                    'first_name' => 'required',
                    'last_name' => 'required',
                    'email' => 'required|email|unique:users,email,' . $client->user_id,
                    'phone_number' => 'required',
                    'family_member' => 'required',
                    'country' => 'required',
                    'state' => 'required',
                    'city' => 'required',
                    'zip_code' => 'required',
                    'address' => 'required',
                    'property' => 'required',
                    'unit' => 'required',
                    'booking_start_date' => 'required',
                    'booking_end_date' => 'required',
                ]
            );
            if ($validator->fails()) {
                $messages = $validator->getMessageBag();
                return response()->json([
                    'status' => 'error',
                    'msg' => $messages->first(),

                ]);
            }

            $user = User::find($client->user_id);
            $user->first_name = $request->first_name;
            $user->last_name = $request->last_name;
            $user->email = $request->email;
            $user->phone_number = $request->phone_number;
            $user->save();

            if ($request->profile != '') {
                $clientFilenameWithExt = $request->file('profile')->getClientOriginalName();
                $clientFilename = pathinfo($clientFilenameWithExt, PATHINFO_FILENAME);
                $clientExtension = $request->file('profile')->getClientOriginalExtension();
                $clientFileName = $clientFilename . '_' . time() . '.' . $clientExtension;
                $dir = storage_path('upload/profile');
                if (!file_exists($dir)) {
                    mkdir($dir, 0777, true);
                }
                $request->file('profile')->storeAs('upload/profile/', $clientFileName);
                $user->profile = $clientFileName;
                $user->save();
            }

            $client->family_member = $request->family_member;
            $client->country = $request->country;
            $client->state = $request->state;
            $client->city = $request->city;
            $client->zip_code = $request->zip_code;
            $client->address = $request->address;
            $client->property = $request->property;
            $client->unit = $request->unit;
            $client->booking_start_date = $request->booking_start_date;
            $client->booking_end_date = $request->booking_end_date;
            $client->save();



            if (!empty($request->client_images)) {
                foreach ($request->client_images as $file) {
                    $clientFilenameWithExt = $file->getClientOriginalName();
                    $clientFilename = pathinfo($clientFilenameWithExt, PATHINFO_FILENAME);
                    $clientExtension = $file->getClientOriginalExtension();
                    $clientFileName = $clientFilename . '_' . time() . '.' . $clientExtension;
                    $dir = storage_path('upload/client');
                    if (!file_exists($dir)) {
                        mkdir($dir, 0777, true);
                    }
                    $file->storeAs('upload/client/', $clientFileName);

                    $clientImage = new ClientDocument();
                    $clientImage->property_id = $request->property;
                    $clientImage->client_id = $client->id;
                    $clientImage->document = $clientFileName;
                    $clientImage->parent_id = parentId();
                    $clientImage->save();
                }
            }

            return response()->json([
                'status' => 'success',
                'msg' => __('Client successfully updated.'),
            ]);
        } else {
            return redirect()->back()->with('error', __('Permission Denied!'));
        }
    }


    public function destroy(Client $client)
    {
        if (\Auth::user()->can('delete client')) {
            User::where('id',$client->user_id)->delete();
            $client->delete();
            return redirect()->back()->with('success', 'Client successfully deleted.');
        } else {
            return redirect()->back()->with('error', __('Permission Denied!'));
        }
    }
}
