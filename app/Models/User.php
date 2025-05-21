<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Auth\Notifications\VerifyEmail;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\DB;
use Spatie\Permission\Traits\HasRoles;

class User extends Authenticatable implements MustVerifyEmail
{
    use HasRoles;
    use Notifiable;


    protected $fillable = [
        'first_name',
        'last_name',
        'email',
        'password',
        'type',
        'phone_number',
        'profile',
        'lang',
        'subscription',
        'subscription_expire_date',
        'parent_id',
        'is_active',
    ];


    protected $hidden = [
        'password',
        'remember_token',
    ];


    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function sendEmailVerificationNotification()
    {
        $this->notify(new VerifyEmail);
    }

    public function totalUser()
    {
        return User::whereNotIn('type',['client','maintainer'])->where('parent_id', $this->id)->count();
    }
    public function totalClient()
    {
        return User::where('type','client')->where('parent_id', $this->id)->count();
    }

    public function getNameAttribute()
    {
        return ucfirst($this->first_name) . ' ' . ucfirst($this->last_name);
    }


    public function totalContact()
    {
        return Contact::where('parent_id', '=', parentId())->count();
    }

    public function roleWiseUserCount($role)
    {
        return User::where('type', $role)->where('parent_id',parentId())->count();
    }
    public static function getDevice($user)
    {
        $mobileType = '/(?:phone|windows\s+phone|ipod|blackberry|(?:android|bb\d+|meego|silk|googlebot) .+? mobile|palm|windows\s+ce|opera mini|avantgo|mobilesafari|docomo)/i';
        $tabletType = '/(?:ipad|playbook|(?:android|bb\d+|meego|silk)(?! .+? mobile))/i';
        if(preg_match_all($mobileType, $user))
        {
            return 'mobile';
        }
        else
        {
            if(preg_match_all($tabletType, $user)) {
                return 'tablet';
            } else {
                return 'desktop';
            }

        }
    }

    public function totalProperty()
    {
        return Property::where('parent_id', parentId())->count();
    }
    public function totalUnit()
    {
        return PropertyUnit::where('parent_id', parentId())->count();
    }

    public function subscriptions()
    {
        return $this->hasOne('App\Models\Subscription','id','subscription');
    }

    public function clients()
    {
        return $this->hasOne('App\Models\Client','user_id','id');
    }

    public static $systemModules=[
        'user',
        'property',
        'unit',
        'client',
        'invoice',
        'maintainer',
        'maintenance request',
        'expense',
        'types',
        'contact',
        'note',
        'logged history',
        'pricing transation',
        'settings',
    ];

    public static function parentData()
    {
        return User::find(parentId());
    }
}
