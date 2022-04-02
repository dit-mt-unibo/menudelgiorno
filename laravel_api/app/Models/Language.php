<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Language extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = ['name'];

    public function translation(){
        $this->hasMany(Translation::class);
    }

    public function menu()
    {
        $this->hasMany(Menu::class);
    }
    public function user(){
        $this->hasMany(User::class);
    }
}
