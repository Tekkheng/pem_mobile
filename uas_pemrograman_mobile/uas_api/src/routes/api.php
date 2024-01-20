<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\TagController;
// use App\Http\Controllers\UsersController;
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


// Route::get('/home', [UsersController::class, 'index']);

Route::get('/login', [AuthController::class, 'index']);
Route::post('/login', [AuthController::class, 'login']);

Route::post('/register', [AuthController::class, 'register']);
Route::get('/login/{id}', [AuthController::class, 'show']);

Route::post('/category', [CategoryController::class, 'create']);
Route::get('/category', [CategoryController::class, 'index']);

Route::post('/tag', [TagController::class, 'create']);
Route::get('/tag', [TagController::class, 'index']);

Route::post('/product', [ProductController::class, 'create']);
Route::get('/product', [ProductController::class, 'index']);