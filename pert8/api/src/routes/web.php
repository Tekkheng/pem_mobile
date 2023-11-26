<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

// yg benar
// Route::get('/login', [App\Http\Controllers\UsersController::class, 'index']);

use App\Http\Controllers\UsersController as User;
Route::get('/login', [User::class, 'login']);
