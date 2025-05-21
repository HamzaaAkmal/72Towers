@extends('layouts.app')
@section('page-title')
    {{__('Client')}}
@endsection
@section('breadcrumb')
    <ul class="breadcrumb mb-0">
        <li class="breadcrumb-item">
            <a href="{{route('dashboard')}}"><h1>{{__('Dashboard')}}</h1></a>
        </li>
        <li class="breadcrumb-item active">
            <a href="#">{{__('Client')}}</a>
        </li>
    </ul>
@endsection
@section('card-action-btn')
    @can('create client')
        <a class="btn btn-primary btn-sm ml-20" href="{{ route('client.create') }}" data-size="md"> <i
                class="ti-plus mr-5"></i>{{__('Create Client')}}</a>
    @endcan
@endsection
@section('content')
    <div class="row">
        @foreach($clients as $client)
            <div class="col-xl-3 col-md-6 cdx-xxl-50 cdx-xl-50 ">
                <div class="card custom contact-card">
                    <div class="card-body">
                        <div class="media align-items-center">
                            <div class="user-imgwrapper">
                                <img class="img-fluid rounded-50"
                                     src="{{(!empty($client->user) && !empty($client->user->profile))? asset(Storage::url("upload/profile/".$client->user->profile)): asset(Storage::url("upload/profile/avatar.png"))}}"
                                     alt="">
                            </div>
                            <div class="media-body">
                                <a href="{{ route('client.show',$client->id) }}">
                                    <h4>{{ucfirst(!empty($client->user)?$client->user->first_name:'').' '.ucfirst(!empty($client->user)?$client->user->last_name:'')}}</h4>
                                    <h6 class="text-light">{{!empty($client->user)?$client->user->email:'-'}}</h6>
                                </a>
                            </div>
                            @if(Gate::check('edit client') || Gate::check('delete client') || Gate::check('show client'))
                                <div class="user-setting">
                                    <div class="action-menu">
                                        <div class="action-toggle"><i data-feather="more-vertical"></i></div>
                                        <ul class="action-dropdown">
                                            @can('edit client')
                                                <li>
                                                    <a class="" href="{{ route('client.edit',$client->id) }}"> <i
                                                            data-feather="edit"> </i>{{__('Edit Client')}}</a>
                                                </li>
                                            @endcan
                                            @can('delete client')
                                                <li>
                                                    {!! Form::open(['method' => 'DELETE', 'route' => ['client.destroy', $client->id],'id'=>'client-'.$client->id]) !!}
                                                    <a href="#" class="confirm_dialog"> <i
                                                            data-feather="trash"></i>{{__('Delete Client')}}</a>
                                                    {!! Form::close() !!}
                                                </li>
                                            @endcan
                                            @can('show client')
                                                <li>
                                                    <a href="{{ route('client.show',$client->id) }}"> <i
                                                            data-feather="eye"> </i>{{__('View Client')}}</a>
                                                </li>
                                            @endcan
                                        </ul>
                                    </div>
                                </div>
                            @endif
                        </div>
                        <div class="user-detail">
                            <h5 class="text-primary mb-10"><i class="fa fa-info-circle mr-10"></i>{{__('Infomation')}}
                            </h5>
                            <p class="text-light">{{$client->address}}</p>
                            <ul class="info-list">
                                <li><span>{{__('Phone')}} : </span>{{!empty($client->user)?$client->user->phone_number:'-'}}</li>
                                <li><span>{{__('Family Member')}} :</span>{{$client->family_member}}</li>
                                <li>
                                    <span>{{__('Property')}} : </span>{{!empty($client->properties)?$client->properties->name:'-'}}
                                </li>
                                <li><span>{{__('Unit')}} : </span>{{!empty($client->units)?$client->units->name:'-'}}
                                </li>
                                <li>
                                    <span>{{__('Booking Start Date')}} : </span>{{dateFormat($client->booking_start_date)}}
                                </li>
                                <li>
                                    <span>{{__('Booking End Date')}} : </span>{{dateFormat($client->booking_end_date)}}
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        @endforeach
    </div>
@endsection

