<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\UsersController;
use App\Http\Controllers\LoginController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


Route::get('/home', [UsersController::class, 'index']);

// Route::get('/login', [AuthController::class, 'login']);

Route::get('/login', [AuthController::class, 'index']);

Route::post('/login', [AuthController::class, 'login']);
Route::post('/register', [AuthController::class, 'register']);


Route::get('/login/{id}', [AuthController::class, 'show']);

// use App\Http\Controllers\UsersController;
// Route::group(['prefix' => 'users'], function () {
//     Route::get("/login", [UsersController::class, 'index']);
// });

