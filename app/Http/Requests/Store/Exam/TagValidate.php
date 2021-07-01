<?php
declare(strict_types=1);

namespace App\Http\Requests\Store\Exam;


use Illuminate\Foundation\Http\FormRequest;

/**
 * 知识点
 *
 * Class CategoryValidate
 * @package App\Http\Requests\Store\Exam
 */
class TagValidate extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'title'   => 'required|max:10',
            'remark'  => 'nullable',
            'orders'  => 'nullable|integer',
            'is_show' => 'in:1,0',
        ];
    }

    public function messages()
    {
        return [
            'title.required' => '分类名称必填',
            'title.max'      => '分类名称最大长度为10',
            'orders.integer' => '显示顺序无效',
            'is_show.in'     => '是否显示格式错误',
        ];
    }
}
