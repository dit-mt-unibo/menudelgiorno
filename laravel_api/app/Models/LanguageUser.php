<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LanguageUser extends Model
{
    use HasFactory;

    protected $table='language_user';
    protected $fillable=['user_id','language_id'];
}
