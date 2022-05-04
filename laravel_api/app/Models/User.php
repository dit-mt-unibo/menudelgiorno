<?php

namespace App\Models;

use Laravel\Sanctum\HasApiTokens;
use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;


    protected $fillable = [
        'name',
        'password',
        'role'
    ];


    protected $hidden = [
        'password',
        'remember_token',
    ];


    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function registry()
    {
        return $this->hasOne(Registry::class);
    }
    public function restaurant()
    {
        return $this->hasOne(Restaurant::class);
    }
    public function translation()
    {
        return $this->hasMany(Translation::class);//utente traduttore
    }
    public function languages(){
        return $this->belongsToMany(Language::class,'language_user');
    }
    public function languages_config(){
        return $this->hasMany(LanguageUser::class);
    }

}
