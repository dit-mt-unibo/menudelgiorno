<?php

use App\Http\Controllers\RegistryController;
use App\Http\Controllers\RestaurantController;
use App\Http\Controllers\LanguageController;
use App\Http\Controllers\MenuController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::apiResource('restaurants', RestaurantController::class);
Route::apiResource('registries', RegistryController::class);
Route::apiResource('languages', LanguageController::class);
Route::apiResource('menus', MenuController::class);

