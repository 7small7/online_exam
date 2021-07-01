<?php
declare(strict_types=1);

namespace App\Models\Admin\Article;


use App\Models\Common\AdminBaseModel;

/**
 * 文章分类
 *
 * Class Category
 * @package App\Models\Admin\Article
 */
class Category extends AdminBaseModel
{
    protected $table = 'article_category';

    public function parent()
    {
        return $this->belongsTo(Category::class, 'parent_uuid', 'uuid');
    }

    /**
     * 获取所有二级的分类
     *
     * @return array
     * @author kert
     */
    public static function getCategoryList(): array
    {
        $items = self::query()->whereNotExists(function ($query) {
            $query->where('parent_uuid', 'is', 'null');
        })->get(['uuid', 'title']);

        if (!empty($items)) {
            $items  = $items->toArray();
            $keys   = array_column($items, 'uuid');
            $values = array_column($items, 'title');

            return array_combine($keys, $values);
        }

        return [];
    }

    /**
     * 获取所有的一级分类
     *
     * @return array
     * @author kert
     */
    public static function getParentList(): array
    {
        $items = self::query()->where([['parent_uuid', null]])
            ->get(['uuid', 'title']);

        if (!empty($items)) {
            $items  = $items->toArray();
            $keys   = array_column($items, 'uuid');
            $values = array_column($items, 'title');

            return array_combine($keys, $values);
        }

        return [];
    }
}
