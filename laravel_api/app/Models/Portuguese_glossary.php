<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Portuguese_glossary extends Model
{
    use HasFactory;
    protected $fillable=['it-IT','pt-PT','description'];
}
