<?php

namespace App\Http\Requests\Store\User;

use App\Rules\MobileValidateRule;
use Illuminate\Foundation\Http\FormRequest;

/**
 * 商户登录验证
 *
 * Class LoginValidate
 * @package App\Http\Requests\Store\User
 */
class LoginValidate extends FormRequest
{
    public function authorize()
    {
        return true;
    }


    public function rules()
    {
        return [
            'password' => 'required',
            'username'   => [new MobileValidateRule(), 'required'],
        ];
    }

    public function messages()
    {
        return [
            'password.required' => '密码必填',
            'username.required'   => '账号必填',
        ];
    }
}
