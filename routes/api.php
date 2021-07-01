<?php
/*
|--------------------------------------------------------------------------
| api Routes
|--------------------------------------------------------------------------
|
| 客户端路由配置文件
|
*/

use Illuminate\Support\Facades\Route;

Route::middleware(['api.global'])->namespace('Api')->group(function () {
    /*
     * --------------------------------------------------------
     *
     *  无需授权接口
     *
     * --------------------------------------------------------
     */
    // 登录
    Route::post('wechat/login', 'User\LoginController@weChatLogin');
    Route::post('user/info', 'User\UserInfoController@getUserInfo');
    // 模板订阅消息
    Route::resource('template', 'User\SubscribeConfigController');
    // 平台配置信息
    Route::resource('banner', 'Platform\BannerController');
    // 菜单
    Route::resource('menu', 'Platform\MenuController');
    // 试题
    Route::prefix('exam')->group(function () {
        // 试卷
        Route::resource('collection', 'Common\CollectionController');
        // 首页
        Route::get('home', 'Exam\CategoryController@home');
        // 搜索历史
        Route::resource('history', 'Exam\SearchHistoryController');
        // 分类
        Route::resource('category', 'Exam\CategoryController');
        // 附件试题
        Route::get('rand/index', 'Exam\RandController@index');
        Route::get('rand/show', 'Exam\RandController@show');
        Route::post('rand/incr', 'Exam\RandController@incr');
    });
    // 文章
    Route::prefix('article')->namespace('Article')->group(function () {
        Route::resource('category', 'CategoryController');
        Route::get('list', 'ArticleController@index');
        Route::get('detail', 'ArticleController@show');
    });


    /*
     * --------------------------------------------------------
     *
     *  需授权接口
     *
     * --------------------------------------------------------
     */
    Route::middleware(['api.auth'])->group(function () {
        // 系统消息
        Route::prefix('message')->group(function () {
            Route::resource('category', 'Platform\MessageCategoryController');
            Route::get('content', 'Platform\MessageContentController@index');
            Route::get('detail', 'Platform\MessageContentController@show');
            Route::resource('history', 'Platform\MessageHistoryController');
        });
        // 签到
        Route::resource('sign', 'User\SignController');
        // 积分
        Route::prefix('score')->group(function () {
            Route::resource('score', 'User\ScoreHistoryController');
        });
        // 用户
        Route::prefix('user')->group(function () {
            Route::resource('collection', 'User\Exam\CollectionController');
            Route::resource('user', 'User\UserController');
            Route::resource('subscribe', 'User\SubscribeController');
        });
        // 平台
        Route::prefix('platform')->group(function () {
            Route::resource('content', 'Platform\ContentController');
        });
        // 试题
        Route::prefix('exam')->group(function () {
            Route::resource('exam', 'Exam\ExamController');
        });
        // 试卷
        Route::prefix('collection')->group(function () {
            Route::get('detail', 'Exam\CollectionController@show');
        });
    });
});
