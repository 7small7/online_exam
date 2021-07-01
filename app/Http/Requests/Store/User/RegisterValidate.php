<?php

namespace App\Http\Requests\Store\User;

use App\Rules\MobileValidateRule;
use Illuminate\Foundation\Http\FormRequest;

/**
 * 商户注册验证
 *
 * Class LoginValidate
 * @package App\Http\Requests\Store\User
 */
class RegisterValidate extends FormRequest
{
    public function authorize()
    {
        return true;
    }


    public function rules()
    {
        return [
            'name'     => 'required|alpha_num',
            'password' => 'required',
            'mobile'   => [new MobileValidateRule(), 'required'],
            'email'    => 'nullable|email',
        ];
    }

    public function messages()
    {
        return [
            'name.required'     => '名称必填',
            'name.alpha_num'    => '名称只能有字母和数字组成',
            'mobile.required'   => '手机号必填',
            'password.required' => '密码必填',
            'email.email'       => '邮箱格式错误',
        ];
    }
}
