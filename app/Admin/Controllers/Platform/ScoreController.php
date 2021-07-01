<?php


namespace App\Admin\Controllers\Platform;


use App\Admin\Controllers\BaseController;
use App\Libs\UUID;
use App\Mapping\Config\ScoreKey;
use App\Models\Admin\Platform\Score;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

/**
 * 平台积分
 *
 * Class ScoreController
 * @package App\Admin\Controllers\Platform
 */
class ScoreController extends BaseController
{
    protected $title = '积分配置';

    public function __construct(Score $score)
    {
        $this->model = $score;
    }

    public function grid()
    {
        $grid = new Grid($this->model);
        $status = $this->status;

        $grid->column('id', '数据编号')->sortable();
        $grid->column('uuid', '积分编号')->copyable();
        $grid->column('key', '积分类型')->using(ScoreKey::$score);
        $grid->column('score', '消息积分');
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

        $grid->disableFilter();

        $grid->actions(function ($actions) {
            $actions->disableView();
        });

        return $grid;
    }

    public function form()
    {
        $form = new Form($this->model);
        $form->hidden('uuid', 'uuid')->default(UUID::getUUID())->readonly();
        $form->hidden('store_uuid')->default($this->storeUUID);
        $form->select('key', '积分类型')->options(ScoreKey::$score)->required();
        $form->decimal('score', '消息积分')->required()->help('消息积分');
        $form->switch('is_show', '显示状态')->states($this->switchStatus)->placeholder('是否显示');

        return $form;
    }

    public function detail($id)
    {
        return new Show($this->model::query()->findOrFail($id));
    }
}
