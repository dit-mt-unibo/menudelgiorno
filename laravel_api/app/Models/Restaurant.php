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
    ];

    public function menu()
    {
        $this->hasOne(Menu::class);
    }
}
