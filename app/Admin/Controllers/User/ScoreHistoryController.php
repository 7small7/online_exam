<?php


namespace App\Admin\Controllers\User;


use App\Admin\Controllers\BaseController;
use App\Mapping\Config\ScoreKey;
use App\Models\Admin\User\ScoreHistory;
use Encore\Admin\Grid;

/**
 * 积分历史
 *
 * Class ScoreHistoryController
 * @package App\Admin\Controllers\User
 */
class ScoreHistoryController extends BaseController
{
    protected $title = '积分记录';

    public function __construct(ScoreHistory $history)
    {
        $this->model = $history;
    }

    public function grid()
    {
        $grid = new Grid($this->model);

        $grid->column('id', '数据编号')->sortable();
        $grid->column('uuid', '积分编号')->copyable();
        $grid->column('type', '积分类型')->display(function ($type) {
            if ($type == 2) {
                return "<span class='label bg-red'>减少</span>";
            } elseif ($type == 1) {
                return "<span class='label bg-green'>增加</span>";
            } else {
                return '异常';
            }
        });
        $grid->column('user.nickname', '积分用户');
        $grid->column('key', '积分渠道')->using(ScoreKey::$score);
        $grid->column('score', '积分值');
        $grid->column('created_at', '积分时间');
        $grid->model()->orderByDesc('id');

        $grid->filter(function ($filter) {
            $filter->disableIdFilter();
            $filter->column(1 / 2, function ($filter) {
                $filter->equal('type', '积分类型')->select([1 => '增加', 2 => '减少']);
            });
            $filter->column(1 / 2, function ($filter) {
                $filter->equal('key', '积分渠道')->select(ScoreKey::$score);
            });
        });

        $grid->disableCreateButton();
        $grid->disableActions();

        $grid->actions(function ($actions) {
            $actions->disableView();
        });

        return $grid;
    }
}
