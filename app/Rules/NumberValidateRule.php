<?php

namespace App\Rules;

use Illuminate\Contracts\Validation\Rule;

/**
 * 验证是一个两位小数或者正整数
 *
 * Class MobileValidateRule
 * @package App\Rules
 */
class NumberValidateRule implements Rule
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
                if ($value >= 0 && (is_int($value) || is_float($value))) {
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
