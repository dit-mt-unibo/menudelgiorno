<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Spanish_glossary extends Model
{
    use HasFactory;
    protected $fillable=['it-IT','es-ES','description'];
}
