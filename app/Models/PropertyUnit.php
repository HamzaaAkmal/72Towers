<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PropertyUnit extends Model
{
    use HasFactory;
    protected $fillable = [
        'name',
        'bedroom',
        'property_id',
        'baths',
        'kitchen',
        'amount_due',
        'deposit_amount',
        'deposit_type',
        'late_fee_type',
        'late_fee_amount',
        'incident_receipt_amount',
        'charge_type',
        'charge_duration',
        'start_date',
        'end_date',
        'payment_due_date',
        'parent_id',
        'notes',
    ];

    public static $Types=[
        'fixed'=> 'Fixed',
        'percentage'=>'Percentage',
    ];
    public static $chargeTypes=[
        'monthly'=> 'Monthly',
        'yearly'=>'Yearly',
        'custom'=>'Custom',
    ];
    public function properties()
    {
        return $this->hasOne('App\Models\Property','id','property_id');
    }

    public function clients()
    {
        return Client::where('unit',$this->id)->first();
    }
}
