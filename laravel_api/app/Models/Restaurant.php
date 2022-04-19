<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Restaurant extends Model
{
    use HasFactory;

    protected $fillable = [

        'name',
        'address',
        'street_number',
        'postcode',
        'city',
        'province',
        'user_id'
    ];

    public function menu()
    {
        return $this->hasMany(Menu::class);
    }
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
