<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Web\FrontEndController;

Route::get('/', function () {
    return view('welcome');
});

// Translation Page
Route::get('translations/{translationId}', [FrontEndController::class, 'getTranslationPage']);

// Translation QR Code
Route::get('qrcodes/{translationId}', [FrontEndController::class, 'getTranslationQrCode']);
