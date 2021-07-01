<?php
declare(strict_types=1);

namespace App\Http\Requests\Store\Exam;


use App\Rules\NumberValidateRule;
use Illuminate\Foundation\Http\FormRequest;

/**
 * 单选试题
 *
 * Class CategoryValidate
 * @package App\Http\Requests\Store\Exam
 */
class OptionValidate extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'title'               => 'required|max:10',
            'cover'               => 'nullable',
            'answer'              => 'required|json',
            'option'              => 'required|json',
            'analysis'            => 'nullable',
            'tips'                => 'nullable',
            'tips_expend_score'   => ['nullable', new NumberValidateRule()],
            'answer_expend_score' => ['nullable', new NumberValidateRule()],
            'tips_income_score'   => ['nullable', new NumberValidateRule()],
            'answer_income_score' => ['nullable', new NumberValidateRule()],
            'is_show'             => 'in:1,0',
            'level'               => 'in:1,2,3,4,5',
            'exam_category_uuid'  => 'nullable|json',
            'exam_tag_uuid'       => 'nullable|json',
        ];
    }

    public function messages()
    {
        return [
            'title.required'          => '题干必填',
            'answer.required'         => '答案必填',
            'answer.json'             => '答案格式错误',
            'option.required'         => '选项必填',
            'option.json'             => '选项格式错误',
            'exam_category_uuid.json' => '试题类型格式错误',
            'exam_tag_uuid.json'      => '试题知识点格式错误',
            'is_show.in'              => '是否显示格式错误',
            'level.in'                => '难易等级格式错误',
        ];
    }
}
