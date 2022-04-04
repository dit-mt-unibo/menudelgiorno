<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Menu extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = ['name', 'text', 'restaurant_id'];

    public function restaurant(){

        return $this->belongsTo(Restaurant::class);
    }
    public function languages()
    {
        return $this->belongsToMany(Language::class);
    }
}
