<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ClientDocument extends Model
{
    protected $fillable=[
        'document',
        'property_id',
        'client_id',
        'parent_id',
    ];
    use HasFactory;
}
