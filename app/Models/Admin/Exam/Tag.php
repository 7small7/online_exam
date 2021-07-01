<?php


namespace App\Models\Admin\Exam;


use App\Models\Common\AdminBaseModel;

/**
 * 试卷标签
 *
 * Class Tag
 * @package App\Models\Admin\Exam
 */
class Tag extends AdminBaseModel
{
    protected $table = 'tag';

    public static function getList(): array
    {
        $items = self::query()->where([['is_show', '=', 1]])->get(['uuid', 'title']);

        $itemsArray = [];
        foreach ($items as $value) {
            $itemsArray[$value->uuid] = $value->title;
        }

        return $itemsArray;
    }
}
