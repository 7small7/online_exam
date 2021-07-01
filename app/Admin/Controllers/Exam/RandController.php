<?php
declare(strict_types=1);

namespace App\Admin\Controllers\Exam;


use App\Admin\Controllers\BaseController;
use App\Libs\UUID;
use App\Models\Admin\Exam\Rand;
use Encore\Admin\Form;
use Encore\Admin\Grid;

/**
 * 附件试题
 *
 * Class RandController
 * @package App\Admin\Controllers\Exam
 */
class RandController extends BaseController
{
    protected $title = '附件试题';

    public function __construct(Rand $rand)
    {
        $this->model = $rand;
    }

    public function grid()
    {
        $grid   = new Grid($this->model);
        $status = $this->status;

        $grid->column('id', '数据编号')->sortable();
        $grid->column('uuid', '数据编号')->copyable();
        $grid->column('title', '试题标题');
        $grid->column('author', '试题作者');
        $grid->column('source', '信息来源');
        $grid->column('link', '相关连接')->copyable();
        $grid->column('read_number', '浏览数量')->sortable();
        $grid->column('read_number', '下载数量')->sortable();
        $grid->column('orders', '显示顺序')->sortable();
        $grid->column('is_show', '显示状态')->display(function ($isShow) use ($status) {
            $text = $status[$isShow];
            if ($isShow == 0) {
                return "<span class='label bg-red'>{$text}</span>";
            } elseif ($isShow == 1) {
                return "<span class='label bg-green'>{$text}</span>";
            } else {
                return '异常';
            }
        });
        $grid->model()->orderByDesc('id');

        $grid->filter(function ($filter) {
            $filter->disableIdFilter();
            $filter->column(1 / 2, function ($filter) {
                $filter->like('title', '试题标题');
            });
        });

        $grid->actions(function ($actions) {
            $actions->disableView();
        });

        return $grid;
    }

    public function form()
    {
        $form = new Form($this->model);
        $form->hidden('uuid')->default(UUID::getUUID());
        $form->hidden('store_uuid')->default($this->storeUUID);
        $form->text('title', '试题标题')->required();
        $form->image('cover', '试题封面')->required();
        $form->UEditor('content', '试题介绍')->required();
        $form->multipleImage('attache_file', '试题图片');
        $form->text('link', '相关链接')
            ->help('涉及到外部网站链接的，直接复制粘贴即可。连接长度不可以超过1000个字符。');
        $form->text('author', '发布人')->required();
        $form->text('source', '信息来源')->required();
        $form->number('read_number', '浏览数量')->default(0);
        $form->number('download_number', '下载数量')->default(0);
        $form->number('orders', '显示顺序')->default(0)->help('值越大显示权重越大');
        $form->switch('is_show', '显示状态')->options($this->switchStatus);

        return $form;
    }
}
