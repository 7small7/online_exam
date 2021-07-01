<?php

namespace App\Admin\Actions\Exam;

use App\Models\Admin\Exam\Exam;
use Encore\Admin\Actions\RowAction;

class ShowDetail extends RowAction
{
    public $name = '试题详情';


    public function form()
    {
        $examUUID = $this->getKey();

        $bean = Exam::query()->where([['uuid', '=', $examUUID]])->first();

        $option = [];
        foreach ($bean->option as $value) {
            array_push($option, $value['title']);
        }

        $this->text('uuid', '试题uuid')->default($examUUID)->readonly();
        $this->text('title', '试题题目')->default($bean->title)->readonly();
        $this->checkbox('options', '试题选项')->options($option)->readOnly()->stacked();
        $this->checkbox('answer', '试题答案')->options($bean->answer)->readOnly();
        $this->text('tips_expend_score', '查看提示消耗积分')->default($bean->tips_expend_score)->readonly();
        $this->text('answer_expend_score', '查看答案消耗积分')->default($bean->answer_expend_score)->readonly();
        $this->text('tips_income_score', '提示奖励积分')->default($bean->tips_income_score)->readonly();
        $this->text('answer_income_scores', '答对奖励积分')->default($bean->answer_income_scores)->readonly();
        $this->text('level', '试题难度')->default($bean->level . '颗星')->readonly();
        $this->textarea('analysis', '试题解析')->default($bean->analysis)->readonly();
        $this->textarea('tips', '试题提示')->default($bean->tips)->readonly();
    }
}
