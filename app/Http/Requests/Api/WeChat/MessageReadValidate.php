<?php

namespace App\Http\Requests\Api\WeChat;

use Illuminate\Foundation\Http\FormRequest;

class MessageReadValidate extends FormRequest
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
            'platform_message_category_uuid' => 'exists:platform_message_category,uuid',
            'platform_message_content_uuid'  => 'exists:platform_message_content,uuid',
        ];
    }

    public function messages()
    {
        return [
            'platform_message_category_uuid.exists' => '该消息不存在',
            'platform_message_content_uuid.exists'  => '该消息不存在',
        ];
    }
}
