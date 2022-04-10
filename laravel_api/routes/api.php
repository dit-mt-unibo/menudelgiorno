<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\MenuController;
use App\Http\Controllers\Api\LanguageController;
use App\Http\Controllers\Api\TranslationController;
use App\Http\Controllers\Api\RegistryController;
use App\Http\Controllers\Api\RestaurantController;
use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\Api\LanguageUserController;

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
Route::post('auth/logout', [AuthController::class, 'logout']);

Route::apiresource('user', UserController::class);
//lingue
Route::post('user/languages/create', [LanguageUserController::class, 'createLanguage']);
Route::put('user/languages/{userId}', [LanguageUserController::class, 'updateLanguage']);
Route::post('user/languages', [LanguageUserController::class, 'lista'])->name('lista');

Route::apiResource('registries', RegistryController::class);
Route::apiResource('languages', LanguageController::class);
Route::apiResource('restaurants', RestaurantController::class);
Route::apiResource('translations', TranslationController::class);
Route::apiResource('menus', MenuController::class);

// Private
Route::group(['middleware' => 'auth:sanctum'], function () {
    // Qui le routes da proteggere con Token
});
