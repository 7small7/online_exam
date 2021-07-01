<?php
declare(strict_types=1);

namespace App\Http\Requests\Store\Exam;


use Illuminate\Foundation\Http\FormRequest;

/**
 * 分类
 *
 * Class CategoryValidate
 * @package App\Http\Requests\Store\Exam
 */
class CategoryValidate extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'title'     => 'required|max:10',
            'remark'    => 'nullable',
            'cover'     => 'required',
            'big_cover' => 'required',
            'orders'    => 'nullable|integer',
            'is_home'   => 'in:1,0',
            'is_show'   => 'in:1,0',
        ];
    }

    public function messages()
    {
        return [
            'title.required'     => '分类名称必填',
            'title.max'          => '分类名称最大长度为10',
            'cover.required'     => '分类封面必传',
            'big_cover.required' => '分类大封面必传',
            'orders.integer'     => '显示顺序无效',
            'is_home.in'         => '首页推荐格式错误',
            'is_show.in'         => '是否显示格式错误',
        ];
    }
}
