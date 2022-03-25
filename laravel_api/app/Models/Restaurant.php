<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Restaurant extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = ['name', 'address', 'street_number', 'postcode', 'city', 'province', 'user_id'];


    public function menu(){
        $this->hasOne(Menu::class);
    }
}
