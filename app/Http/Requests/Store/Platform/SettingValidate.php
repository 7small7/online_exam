<?php
declare(strict_types=1);

namespace App\Http\Requests\Store\Platform;


use App\Rules\ConfigTypeValidateRule;
use Illuminate\Foundation\Http\FormRequest;

/**
 * 平台设置
 *
 * Class SettingValidate
 * @package App\Http\Requests\Store\Platform
 */
class SettingValidate extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'title'  => 'required|max:10',
            'values' => 'required|json',
            'type'   => ['required', new ConfigTypeValidateRule()],
        ];
    }

    public function messages()
    {
        return [
            'title.required' => '配置名称必填',
            'values.values'  => '配置值必填',
            'values.json'    => '配置值格式错误',
            'type.required'  => '配置类型必填',
        ];
    }
}
