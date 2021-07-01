<?php


namespace App\Models\Admin\Platform;


use App\Models\Common\AdminBaseModel;

/**
 * 平台常量配置
 *
 * Class ConstConfig
 * @package App\Models\Admin\Platform
 */
class ConstConfig extends AdminBaseModel
{
    protected $table = 'platform_const_config';

    /**
     * 获取系统参数配置
     *
     * @param string $key 配置键
     * @return array
     */
    public static function list(string $key): array
    {
        $item      = self::query()->where([['key', '=', $key]])->get(['values', 'describe']);
        $itemArray = [];
        if (!empty($item)) {
            foreach ($item as $value) {
                $itemArray[$value->values] = $value->describe;
            }
        }

        return $itemArray;
    }
}
