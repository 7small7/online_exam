<?php

namespace App\Rules;

use Illuminate\Contracts\Validation\Rule;

/**
 * 自定义手机号验证规则
 *
 * Class MobileValidateRule
 * @package App\Rules
 */
class MobileValidateRule implements Rule
{
    /**
     * Create a new rule instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Determine if the validation rule passes.
     *
     * @param string $attribute
     * @param mixed $value
     * @return bool
     */
    public function passes($attribute, $value)
    {
        if (!empty($value)) {
            $mobileRex = '/^[1](([3][0-9])|([4][5-9])|([5][0-3,5-9])|([6][5,6])|([7][0-8])|([8][0-9])|([9][1,8,9]))[0-9]{8}$/'; // 手机号正则
            preg_match($mobileRex, $value, $mobile);

            return !empty($mobile) ? true : false;
        }

        return true;
    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message()
    {
        return '手机号错误';
    }
}
