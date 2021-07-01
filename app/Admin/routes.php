<?php

use App\Admin\Controllers\Article\ArticleController;
use App\Admin\Controllers\Exam\CategoryController;
use App\Admin\Controllers\Exam\CollectionController;
use App\Admin\Controllers\Exam\CollectionExamController;
use App\Admin\Controllers\Exam\ExamController;
use App\Admin\Controllers\Exam\RandController;
use App\Admin\Controllers\Exam\SearchHistoryController;
use App\Admin\Controllers\Exam\TagController;
use App\Admin\Controllers\Platform\BannerController;
use App\Admin\Controllers\Platform\ConfigController;
use App\Admin\Controllers\Platform\ContentController;
use App\Admin\Controllers\Platform\MenuController;
use App\Admin\Controllers\Platform\MessageCategoryController;
use App\Admin\Controllers\Platform\MessageContentController;
use App\Admin\Controllers\Platform\ScoreController;
use App\Admin\Controllers\Platform\WeChatSubscribeConfigController;
use App\Admin\Controllers\User\ScoreHistoryController;
use App\Admin\Controllers\User\SubscribeController;
use App\Admin\Controllers\User\WeChatController;
use Encore\Admin\Facades\Admin;
use Illuminate\Routing\Router;
use Illuminate\Support\Facades\Route;

Admin::routes();

Route::group([
    'prefix'     => config('admin.route.prefix'),
    //    'namespace'  => config('admin.route.namespace'),
    'middleware' => config('admin.route.middleware'),
    'as'         => config('admin.route.prefix') . '.',
], function (Router $router) {

    $router->get('/', 'App\Admin\Controllers\HomeController@index')->name('home');

    /**
     * 文章
     */
    $router->group(['prefix' => 'article'], function () use ($router) {
        $router->resource('list', ArticleController::class);
        $router->resource('category', \App\Admin\Controllers\Article\CategoryController::class);
    });

    /**
     * 试题
     */
    $router->group(['prefix' => 'exam'], function () use ($router) {
        $router->resource('category', CategoryController::class);
        $router->resource('category', CategoryController::class);
        $router->resource('tag', TagController::class);
        $router->resource('search/history', SearchHistoryController::class);
        $router->resource('collection/exam', CollectionExamController::class);
        $router->resource('collection', CollectionController::class);
        $router->resource('rand', RandController::class);
    });
    $router->resource('exam', ExamController::class);

    /**
     * 系统配置
     */
    $router->group(['prefix' => 'platform'], function () use ($router) {
        $router->resource('banner', BannerController::class);
        $router->resource('message/category', MessageCategoryController::class);
        $router->resource('message/content', MessageContentController::class);
        $router->resource('score/setting', ScoreController::class);
        $router->resource('const/setting', ConfigController::class);
        $router->resource('content', ContentController::class);
        $router->resource('menu', MenuController::class);
        $router->resource('subscribe/config', WeChatSubscribeConfigController::class);
    });

    /**
     * 用户
     */
    $router->group(['prefix' => 'wechat'], function () use ($router) {
        $router->resource('user/score', ScoreHistoryController::class);
        $router->resource('user', WeChatController::class);
        $router->resource('subscribe', SubscribeController::class);
    });
});
