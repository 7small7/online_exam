<?php


namespace App\Models\Admin\Exam;


use App\Models\Common\AdminBaseModel;

/**
 * 试题类型
 *
 * Class Category
 * @package App\Models\Admin\Exam
 */
class Category extends AdminBaseModel
{
    protected $table = 'exam_category';

    protected $primaryKey = 'uuid';

    protected $keyType = 'string';

    public $incrementing = false;

    public function parent()
    {
        return $this->belongsTo(Category::class, 'parent_uuid', 'uuid');
    }

    public static function getList(): array
    {
        $items = Category::query()->where([['is_show', '=', 1], ['parent_uuid', '<>', null]])->get(['uuid', 'title']);

        $itemsArray = [];
        foreach ($items as $value) {
            $itemsArray[$value->uuid] = $value->title;
        }

        return $itemsArray;
    }

    public function exam()
    {
        return $this->belongsToMany(Exam::class, 'exam_category_relation', 'exam_category_uuid', 'exam_item_uuid');
    }
}
