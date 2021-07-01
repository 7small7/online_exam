<?php
declare(strict_types=1);

namespace App\Http\Requests\Common;


use Illuminate\Foundation\Http\FormRequest;

/**
 * 数据id验证
 *
 * Class UUIDValidate
 * @package App\Http\Requests\Common
 */
class UUIDValidate extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'uuid' => 'required',
        ];
    }

    public function messages()
    {
        return [
            'uuid.required' => '数据编号必填',
        ];
    }
}
