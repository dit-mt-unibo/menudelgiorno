<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Language extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = ['name','code'];

    public function translation(){
        return $this->hasMany(Translation::class);
    }
    public function menu()
    {
        return $this->belongsToMany(Menu::class);
    }
    public function users(){
        return $this->belongsToMany(User::class,'language_user');
    }
    public function user_config(){
        return $this->hasMany(LanguageUser::class);
    }
}
