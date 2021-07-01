<?php


namespace App\Admin\Controllers\Exam;


use App\Admin\Actions\Common\ShowStatus;
use App\Admin\Controllers\BaseController;
use App\Libs\UUID;
use App\Models\Admin\Exam\SearchHistory;
use App\Models\Admin\Platform\ConstConfig;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

/**
 * 搜索历史
 *
 * Class SearchHistoryController
 * @package App\Admin\Controllers\Exam
 */
class SearchHistoryController extends BaseController
{
    protected $title = '搜索历史';

    private $key = 'exam_search';

    public function __construct(SearchHistory $history)
    {
        $this->model = $history;
    }

    public function grid()
    {
        $grid   = new Grid($this->model);
        $status = $this->status;

        $grid->column('id', '数据编号')->sortable();
        $grid->column('uuid', '搜索编号')->copyable();
        $grid->column('WeChatUser.nickname', '搜索用户');
        $grid->column('title', '搜索内容');
        $grid->column('position', '显示位置')->using(ConstConfig::list(($this->key)));
        $grid->column('is_show', '是否显示')->display(function ($isShow) use ($status) {
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
                $filter->like('title', '搜索内容');
            });
            $filter->column(1 / 2, function ($filter) {
                $filter->equal('is_show', '启用状态')->select($this->status);
            });
            $filter->column(1 / 2, function ($filter) {
                $filter->equal('position', '显示位置')->select(ConstConfig::list(($this->key)));
            });
        });

        $grid->actions(function ($actions) {
            $actions->disableDelete();
            $actions->disableView();
            $actions->add(new ShowStatus());
        });

        return $grid;
    }

    public function form()
    {
        $form = new Form($this->model);
        $form->hidden('uuid','数据编号')->default(UUID::getUUID())->readonly();
        $form->hidden('store_uuid','商户编号')->default($this->storeUUID)->readonly();
        $form->text('title', '搜索内容');
        $form->switch('is_show', '是否显示')->options($this->switchStatus);
        $form->select('position', '显示位置')->options(ConstConfig::list((string)$this->key));

        return $form;
    }

    public function detail($id)
    {
        return new Show($this->model::query()->findOrFail($id));
    }
}
