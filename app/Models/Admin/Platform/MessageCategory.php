<?php


namespace App\Models\Admin\Platform;


use App\Models\Common\AdminBaseModel;

/**
 * 消息分类
 *
 * Class MessageCategory
 * @package App\Models\Admin\Platform
 */
class MessageCategory extends AdminBaseModel
{
    protected $table = 'platform_message_category';

    /**
     * 获取分类
     *
     * @return array
     */
    public static function list(): array
    {
        $item      = self::query()->where([['is_show', '=', 1]])->get(['uuid', 'title']);
        $itemArray = [];
        if (!empty($item)) {
            foreach ($item as $value) {
                $itemArray[$value->uuid] = $value->title;
            }
        }

        return $itemArray;
    }
}
