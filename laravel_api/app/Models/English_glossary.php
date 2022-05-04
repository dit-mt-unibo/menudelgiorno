<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class English_glossary extends Model
{
    use HasFactory;
    protected $fillable=['it-IT','en-EN','description'];
}
