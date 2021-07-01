<?php

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

use App\Tasks\Admin\WeChatTemplateMessage;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    echo '访问错误';
});
Route::get('send/sign/template', function () {
    (new WeChatTemplateMessage())->sendSignMessage();
    //    header('Location:https://github.com/bruceqiq/code_study');
});

// 管理端获取试卷
Route::get('admin/collection', 'Common\Controller\CollectionController@index');
