<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Translation extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = ['language_id', 'text','menu_id','user_id','state'];


    public function language(){
        return $this->belongsTo(Language::class);
    }
    public function user()
    {
        return $this->belongsTo(User::class);//utente traduttore
    }

}
