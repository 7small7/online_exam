<?php

namespace App\Http\Requests\Api\WeChat;

use Illuminate\Foundation\Http\FormRequest;

class UserValidate extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'address'   => 'nullable',
            'city'      => 'nullable',
            'district'  => 'nullable',
            'latitude'  => 'nullable',
            'longitude' => 'nullable',
            'mobile'    => 'nullable',
            'province'  => 'nullable',
            'real_name' => 'nullable',
            'birthday'  => 'nullable',
        ];
    }
}
