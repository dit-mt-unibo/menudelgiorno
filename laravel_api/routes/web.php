<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Web\FrontEndController;

Route::get('/', function () {
    return view('welcome');
});

// Translation Page
Route::get('translations/{id}', [FrontEndController::class, 'getTranslationPage']);
