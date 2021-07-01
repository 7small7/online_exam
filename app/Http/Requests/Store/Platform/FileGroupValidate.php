<?php
declare(strict_types=1);

namespace App\Http\Requests\Store\Platform;


use Illuminate\Foundation\Http\FormRequest;

/**
 * 平台文件
 *
 * Class FileGroupValidate
 * @package App\Http\Requests\Store\Platform
 */
class FileGroupValidate extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'title'       => 'required',
            'parent_uuid' => 'nullable',
        ];
    }

    public function messages()
    {
        return [
            'title.required' => '分组名必填',
        ];
    }
}
