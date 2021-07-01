<?php
declare(strict_types=1);

namespace App\Http\Requests\Store\Exam;


use App\Rules\TimeValidateRule;
use Illuminate\Foundation\Http\FormRequest;

/**
 * 试卷
 *
 * Class CategoryValidate
 * @package App\Http\Requests\Store\Exam
 */
class CollectionValidate extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'title'              => 'required|max:32',
            'cover'              => 'required',
            'submit_number'      => 'required|integer',
            'exam_tag_uuid'      => 'required',
            'exam_category_uuid' => 'required',
            'exam_time'          => ['required', new TimeValidateRule()],
            'orders'             => 'nullable|integer',
            'is_recommend'       => 'in:1,0',
            'is_show'            => 'in:1,0',
            'content'            => 'required',
            'level'              => 'in:1,2,3,4,5',
            'author'             => 'nullable',
            'audit_author'       => 'nullable',
        ];
    }

    public function messages()
    {
        return [
            'title.required'              => '试卷名称必填',
            'title.max'                   => '试卷名称最大长度为32',
            'cover.required'              => '试卷封面必传',
            'big_cover.required'          => '试卷大封面必传',
            'submit_number.required'      => '答题人数必填',
            'submit_number.integer'       => '答题人数格式错误',
            'exam_tag_uuid.required'      => '考察知识点必填',
            'exam_category_uuid.required' => '试卷类型必填',
            'exam_time.required'          => '答题时长必填',
            'exam_time.time'              => '答题时长格式错误',
            'orders.integer'              => '显示顺序格式错误',
            'is_recommend.in'             => '是否推荐格式错误',
            'content.required'            => '试卷介绍必填',
            'level.in'                    => '难易等级格式错误',
            'is_home.in'                  => '首页推荐格式错误',
            'is_show.in'                  => '是否显示格式错误',
        ];
    }
}
