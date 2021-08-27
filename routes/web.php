<?php

use App\Http\Controllers\FollowController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\TweetController;
use App\Http\Controllers\TweetLikesController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ExploreController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});


Route::middleware('auth')->group(function () {
    Route::get('/tweets', [TweetController::class, 'index'])
        ->name('tweets');

    Route::get('/explore', ExploreController::class);

    Route::post('/tweets', [TweetController::class, 'store'])
        ->name('store');

    Route::post('/tweets/{tweet}/like', [TweetLikesController::class, 'store']);
    Route::delete('/tweets/{tweet}/like', [TweetLikesController::class, 'destroy']);

    Route::get('/profiles/{user:username}', [ProfileController::class, 'show'])
        ->name('profiles');

    Route::post('/profiles/{user:username}/follow', [FollowController::class, 'store'])
        ->name('follow');

    Route::get('/profiles/{user:username}/edit', [ProfileController::class, 'edit'])
        ->middleware('can:edit,user');

    Route::patch('/profiles/{user:username}/update', [ProfileController::class, 'update'])
        ->middleware('can:edit,user');

});


require __DIR__.'/auth.php';
