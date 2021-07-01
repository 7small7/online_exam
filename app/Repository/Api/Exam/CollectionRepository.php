<?php


namespace App\Repository\Api\Exam;


use App\Models\Api\Exam\Collection;
use App\Repository\Api\ApiRepositoryInterface;

/**
 * 试卷
 *
 * Class CollectionRepository
 * @package App\Repository\Api\Exam
 */
class CollectionRepository implements ApiRepositoryInterface
{
    private $collectionModel;

    public function __construct()
    {
        $this->collectionModel = new Collection();
    }

    /**
     * 查询数据
     *
     * @param \Closure $closure
     * @param int $perSize 分页大小
     * @return array
     */
    public function repositorySelect(\Closure $closure, int $perSize): array
    {
        $items = $this->collectionModel::query()->where($closure)
            ->with(['category:uuid,title', 'tag:uuid,title'])
            ->select(['uuid', 'title', 'cover', 'submit_number', 'exam_tag_uuid', 'exam_category_uuid', 'exam_time', 'content', 'level'])
            ->orderByDesc('id')
            ->paginate($perSize);

        return [
            'items' => $items->items(),
            'total' => $items->total(),
            'page'  => $items->currentPage(),
            'size'  => $items->perPage(),
        ];
    }

    /**
     * 创建数据
     *
     * @param array $insertInfo 创建信息
     * @return boolean true|false
     */
    public function repositoryCreate(array $insertInfo): bool
    {
        // TODO: Implement repositoryCreate() method.
    }

    /**
     * 添加数据
     *
     * @param array $addInfo 添加信息
     * @return int 添加之后的ID或者行数
     */
    public function repositoryAdd(array $addInfo): int
    {
        // TODO: Implement repositoryAdd() method.
    }

    /**
     * 单条数据查询
     *
     * @param \Closure $closure
     * @return array
     */
    public function repositoryFind(\Closure $closure): array
    {
        $bean = $this->collectionModel::query()
            ->where($closure)
            ->with(['category:uuid,title', 'tag:uuid,title'])
            ->first(['uuid', 'title', 'cover', 'submit_number', 'exam_tag_uuid', 'exam_category_uuid', 'exam_time',
                     'content', 'level']);

        return !empty($bean) ? $bean->toArray() : [];
    }

    /**
     * 更新数据
     *
     * @param array $updateWhere 修改条件
     * @param array $updateInfo 修改信息
     * @return int 更新行数
     */
    public function repositoryUpdate(array $updateWhere, array $updateInfo): int
    {
        // TODO: Implement repositoryUpdate() method.
    }

    /**
     * 删除数据
     *
     * @param array $deleteWhere 删除条件
     * @return int 删除行数
     */
    public function repositoryDelete(array $deleteWhere): int
    {
        // TODO: Implement repositoryDelete() method.
    }

    /**
     * 对字段增加1
     *
     * @param array $incrWhere
     * @param array $updateFields
     * @return int
     * @author kert
     */
    public function incrByColumn(array $incrWhere, array $updateFields): int
    {
        $rows = 0;
        foreach ($updateFields as $value) {
            $rows += $this->collectionModel::query()->where($incrWhere)->increment($value);
        }

        return $rows;
    }
}
