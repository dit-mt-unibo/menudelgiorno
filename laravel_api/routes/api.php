<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\MenuController;
use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\Api\LanguageController;
use App\Http\Controllers\Api\RegistryController;
use App\Http\Controllers\Api\RestaurantController;
use App\Http\Controllers\Api\TranslationController;
use App\Http\Controllers\Api\LanguageUserController;

// Public
Route::post('auth/register', [AuthController::class, 'register']);
Route::post('auth/login', [AuthController::class, 'login']);
Route::post('auth/logout', [AuthController::class, 'logout']);

// Development
Route::apiresource('users', UserController::class);
Route::apiResource('users.languages', LanguageUserController::class);
Route::apiResource('registries', RegistryController::class);
Route::apiResource('languages', LanguageController::class);
Route::apiResource('restaurants', RestaurantController::class);
Route::apiResource('translations', TranslationController::class);
Route::apiResource('menus', MenuController::class);

// Private
Route::group(['middleware' => 'auth:sanctum'], function () {
    // Qui le routes da proteggere con Token
});
