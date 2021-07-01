<?php


namespace App\Admin\Controllers\Exam;


use App\Admin\Controllers\BaseController;
use App\Libs\UUID;
use App\Models\Admin\Exam\Category;
use App\Models\Admin\Exam\Collection;
use App\Models\Admin\Exam\Exam;
use App\Models\Common\CollectionExam;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

/**
 * 选择题
 *
 * Class ExamController
 * @package App\Admin\Controllers\Exam
 */
class ExamController extends BaseController
{
    protected $title = '试题管理';

    public function __construct(Exam $exam)
    {
        $this->model = $exam;
    }


    public function grid()
    {
        $grid   = new Grid($this->model);
        $status = $this->status;

        $grid->column('id', '数据编号')->sortable();
        $grid->column('uuid', '试题编号')->copyable();
        $grid->column('title', '题干');
        $grid->column('cover', '图片')->lightbox($this->imageStyle);
        $grid->column('tips_expend_score', '提示消耗积分');
        $grid->column('answer_expend_score', '答案消耗积分');
        $grid->column('tips_income_score', '提示奖励积分');
        $grid->column('answer_income_score', '答案奖励积分');
        $grid->column('number', '绑定试卷数')->display(function () {
            $number = CollectionExam::query()->where([['exam_item_uuid', '=', $this->uuid]])->count('*');
            if ($number != 0) {
                return "<span class='label bg-green'>{$number}</span>";
            } else {
                return "<span class='label bg-red'>{$number}</span>";
            } 
        });
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
                $filter->like('uuid', '试题编号');
                $filter->like('title', '试题题干');
                $filter->equal('is_show', '启用状态')->select($this->status);
            });
        });

        $grid->actions(function ($action) {
            $action->disableView();
        });

        return $grid;
    }

    public function form()
    {
        $form = new Form($this->model);

        $form->hidden('uuid', 'uuid')->default(UUID::getUUID());
        $form->hidden('store_uuid')->default($this->storeUUID);

        $form->multipleSelect('category', '试题分类')->options(Category::getList());
//            ->load('collection', '/admin/collection');

        $form->multipleSelect('collection', '所属试卷')->options(Collection::getList());


        $form->text('title', '试题名称')->required()->help('长度控制在10位以内');
        $form->table('option', '试题选项', function ($table) {
            $table->text('title', '选项')->required();
            $table->select('check', '答案')->options(['A' => 'A', 'B' => 'B', 'C' => 'C', 'D' => 'D'])->required();
            $table->radio('is_check', '是否为答案')->options([1 => '是', 0 => '否'])->required();
        })->help('答案请按照A->B->C->D的顺序依次选择');
        $form->checkbox('answer', '答案')->options(['A' => 'A', 'B' => 'B', 'C' => 'C', 'D' => 'D']);
        $form->decimal('tips_expend_score', '提示消耗积分')->required()->default(0.00);
        $form->decimal('answer_expend_score', '答案消耗积分')->required()->default(0.00);
        $form->decimal('tips_income_score', '提示奖励积分')->required()->default(0.00);
        $form->decimal('answer_income_score', '答案奖励积分')->required()->default(0.00);
        $form->switch('is_show', '显示状态')->states($this->switchStatus)->default(1);
        $form->image('cover', '图片地址')->uniqueName()->help('小程序内展示的图片');
        $form->textarea('analysis', '解析');
        $form->textarea('tips', '提示');

        return $form;
    }

    public function detail($id)
    {
        return new Show($this->model::query()->findOrFail($id));
    }
}
