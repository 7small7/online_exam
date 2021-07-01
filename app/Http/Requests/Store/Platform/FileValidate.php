<?php
declare(strict_types=1);

namespace App\Http\Requests\Store\Platform;


use Illuminate\Foundation\Http\FormRequest;

/**
 * 平台文件
 *
 * Class FileValidate
 * @package App\Http\Requests\Store\Platform
 */
class FileValidate extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'file_name' => 'required',
        ];
    }

    public function messages()
    {
        return [
            'file_name.required' => '文件名称必填',
        ];
    }
}
