<?php


namespace App\Models\Admin\Exam;


use App\Models\Common\AdminBaseModel;

/**
 * 试卷
 *
 * Class Collection
 * @package App\Models\Admin\Exam
 */
class Collection extends AdminBaseModel
{
    protected $table = 'exam_collection';

    protected $primaryKey = 'uuid';

    protected $keyType = 'string';

    public $incrementing = false;


    public function category()
    {
        return $this->belongsTo(Category::class, 'exam_category_uuid', 'uuid');
    }

    public function tag()
    {
        return $this->belongsTo(Tag::class, 'exam_tag_uuid', 'uuid');
    }

    public function exam()
    {
        return $this->belongsToMany(Exam::class, 'collection_exam', 'exam_collection_uuid', 'exam_item_uuid');
    }

    public static function getList(array $searchWhere = [], array $searchFields = ['uuid', 'title']): array
    {
        array_push($searchWhere, ['is_show', '=', 1]);
        $items = Collection::query()->where($searchWhere)->get($searchFields);

        $itemsArray = [];
        foreach ($items as $value) {
            $itemsArray[$value->uuid] = $value->title;
        }

        return $itemsArray;
    }
}
