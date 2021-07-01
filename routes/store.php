<?php
/*
|--------------------------------------------------------------------------
| store Routes
|--------------------------------------------------------------------------
|
| 商户端路由定义文件
|
*/

use Illuminate\Support\Facades\Route;

// 登录
Route::middleware(['store.global'])->namespace('Store')->group(function () {
    Route::post('login', 'LoginController@login');
    Route::post('register', 'LoginController@register');

    Route::middleware('store.auth')->group(function () {
        // 商户信息
        Route::prefix('user')->group(function () {
            Route::get('info', 'User\UserController@show');
        });

        // 试题管理
        Route::prefix('exam')->group(function () {
            // 分类
            Route::post('category/store', 'Exam\CategoryController@store');
            Route::get('category/index', 'Exam\CategoryController@index');
            Route::get('category/show', 'Exam\CategoryController@show');
            Route::post('category/update', 'Exam\CategoryController@update');
            Route::post('category/destroy', 'Exam\CategoryController@destroy');
            // 知识点
            Route::post('tag/store', 'Exam\TagController@store');
            Route::get('tag/index', 'Exam\TagController@index');
            Route::get('tag/show', 'Exam\TagController@show');
            Route::post('tag/update', 'Exam\TagController@update');
            Route::post('tag/destroy', 'Exam\TagController@destroy');
            // 试卷
            Route::post('collection/store', 'Exam\CollectionController@store');
            Route::get('collection/index', 'Exam\CollectionController@index');
            Route::get('collection/show', 'Exam\CollectionController@show');
            Route::post('collection/update', 'Exam\CollectionController@update');
            Route::post('collection/destroy', 'Exam\CollectionController@destroy');
        });
        // 平台配置
        Route::prefix('platform')->group(function () {
            // 参数配置
            Route::post('setting/store', 'Platform\SettingController@store');
            Route::get('setting/index', 'Platform\SettingController@index');
            Route::get('setting/show', 'Platform\SettingController@show');
            Route::post('setting/update', 'Platform\SettingController@update');
            Route::post('setting/destroy', 'Platform\SettingController@destroy');
            // 文件管理
            Route::post('file/store', 'Platform\FileController@store');
            Route::get('file/index', 'Platform\FileController@index');
            Route::get('file/show', 'Platform\FileController@show');
            Route::post('file/update', 'Platform\FileController@update');
            Route::post('file/destroy', 'Platform\FileController@destroy');
            // 文件组管理
            Route::post('file_group/store', 'Platform\FileGroupController@store');
            Route::get('file_group/index', 'Platform\FileGroupController@index');
            Route::get('file_group/show', 'Platform\FileGroupController@show');
            Route::post('file_group/update', 'Platform\FileGroupController@update');
            Route::post('file_group/destroy', 'Platform\FileGroupController@destroy');
        });
        // 文章管理
        Route::prefix('article')->group(function () {
            // 分类
            Route::post('category/store', 'Article\CategoryController@store');
            Route::get('category/index', 'Article\CategoryController@index');
            Route::get('category/show', 'Article\CategoryController@show');
            Route::post('category/update', 'Article\CategoryController@update');
            Route::post('category/destroy', 'Article\CategoryController@destroy');
            // 知识点
            Route::post('store', 'Article\ArticleController@store');
            Route::get('index', 'Article\ArticleController@index');
            Route::get('show', 'Article\ArticleController@show');
            Route::post('update', 'Article\ArticleController@update');
            Route::post('destroy', 'Article\ArticleController@destroy');
        });
    });
});
