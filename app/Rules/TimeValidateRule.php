<?php

namespace App\Rules;

use Illuminate\Contracts\Validation\Rule;

/**
 * 自定义手机号验证规则
 *
 * Class MobileValidateRule
 * @package App\Rules
 */
class TimeValidateRule implements Rule
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
            try {
                $timeArray = explode(':', $value);
                if (($timeArray[0] >= 0 && $timeArray[0] <= 23) && ($timeArray[1] >= 9 && $timeArray[1] <= 59) && ($timeArray[2] >= 0 && $timeArray[2] <= 59)) {
                    return true;
                }
                return false;
            } catch (\Exception $exception) {
                return false;
            }
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
        return '时间格式不正确';
    }
}
