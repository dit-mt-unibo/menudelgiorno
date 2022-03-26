<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\MenuController;
use App\Http\Controllers\Api\LanguageController;
use App\Http\Controllers\Api\TranslationController;
use App\Http\Controllers\Api\RegistryController;
use App\Http\Controllers\Api\RestaurantController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Public
Route::post('auth/register', [AuthController::class, 'register']);
Route::post('auth/login', [AuthController::class, 'login']);

// Private
Route::group(['middleware' => 'auth:sanctum'], function () {
    Route::apiResource('registries', RegistryController::class);
    Route::apiResource('languages', LanguageController::class);
    Route::apiResource('restaurants', RestaurantController::class);
    Route::apiResource('translations', TranslationController::class);
    Route::apiResource('menus', MenuController::class);
    Route::post('auth/logout', [AuthController::class, 'logout']);
});
