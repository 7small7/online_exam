<?php

namespace App\Http\Requests\Api\WeChat;

use Illuminate\Foundation\Http\FormRequest;

/**
 * 试卷答题验证
 *
 * Class CollectionValidate
 * @package App\Http\Requests\Api\WeChat
 */
class CollectionValidate extends FormRequest
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
            'exam_collection_uuid' => 'required|exists:exam_collection,uuid',
        ];
    }

    public function messages()
    {
        return [
            'exam_collection_uuid.required' => '试卷编号不能为空',
            'exam_collection_uuid.exists'   => '试卷编号不存在',
        ];
    }
}
