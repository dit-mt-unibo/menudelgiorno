<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Translation extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = ['language_id', 'text'];

    public function language(){
        $this->hasOne(Language::class);
    }
    public function user()
    {
        $this->belongsTo(User::class);
    }

}
