<?php

namespace App\Rules;

use App\Mapping\Config\ConfigType;
use Illuminate\Contracts\Validation\Rule;

/**
 * 文件格式验证
 *
 * Class ConfigTypeValidateRule
 * @package App\Rules
 */
class ConfigTypeValidateRule implements Rule
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
        $configTypeArray = array_keys(ConfigType::SETTING_TYPE);

        return in_array($value, $configTypeArray);
    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message()
    {
        return '配置类型不存在';
    }
}
