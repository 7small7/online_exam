<?php


namespace App\Admin\Controllers;


use Encore\Admin\Controllers\AdminController;

/**
 * Admin基础控制器
 *
 * Class BaseController
 * @package App\Admin\Controllers
 */
class BaseController extends AdminController
{
    /**
     *
     * 数据模型
     *
     * @var
     */
    protected $model;


    /**
     * 显示switch
     *
     *
     * @var array
     */
    protected $switchStatus = [
        'on'  => ['value' => 1, 'text' => '启用', 'color' => 'success'],
        'off' => ['value' => 0, 'text' => '禁用', 'color' => 'danger'],
    ];

    /**
     * 列表启用状态查询
     *
     * @var array
     */
    protected $status = [1 => '启用', 0 => '禁用'];

    /**
     * 列表图片宽度和高度
     *
     * @var array
     */
    protected $imageStyle = ['width' => 50, 'height' => 50];

    /**
     * 模拟商户端的商户uuid
     * @var string
     */
    protected $storeUUID = 'db530975-5958-c8ab-abcc-afc17681fc53';

}
