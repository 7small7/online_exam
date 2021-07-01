<?php


namespace App\Admin\Controllers\Platform;


use App\Admin\Controllers\BaseController;
use App\Models\Admin\Platform\ConstConfig;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

/**
 * 平台配置
 *
 * Class ConfigController
 * @package App\Admin\Controllers\Platform
 */
class ConfigController extends BaseController
{
    protected $title = '系统参数配置';

    public function __construct(ConstConfig $constConfig)
    {
        $this->model = $constConfig;
    }

    public function grid()
    {
        $grid = new Grid($this->model);

        $grid->column('key', '配置key');
        $grid->column('values', '配置值');
        $grid->column('describe', '配置描述');
        $grid->model()->paginate(50);

        $grid->filter(function ($filter) {
            $filter->disableIdFilter();
            $filter->column(1 / 2, function ($filter) {
                $filter->like('key', '配置key');
                $filter->like('values', '配置值');
            });
            $filter->column(1 / 2, function ($filter) {
                $filter->like('describe', '配置描述');
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

        $form->text('key', '配置key')->required();
        $form->text('values', '配置值')->required();
        $form->text('describe', '配置描述')->required();

        return $form;
    }

    public function detail($id)
    {
        return new Show($this->model::query()->findOrFail($id));
    }
}
