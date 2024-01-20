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

use App\Http\Controllers\UsersController;
Route::get('/login', [UsersController::class, 'index']);


// use App\Http\Controllers\UsersController;
// Route::group(['prefix' => 'users'], function () {
//     Route::get("/login", [UsersController::class, 'index']);
// });