<?php


namespace App\Repository\Api\Exam;


use App\Models\Api\Exam\Exam;
use App\Repository\Api\ApiRepositoryInterface;

/**
 * 试题
 *
 * Class ExamRepository
 * @package App\Repository\Api\Exam
 */
class ExamRepository implements ApiRepositoryInterface
{
    private $examModel;

    public function __construct()
    {
        $this->examModel = new Exam;
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
        $items = $this->examModel::query()->where($closure)
            ->select(['uuid', 'title', 'cover'])
            ->paginate($perSize);

        return [
            'items' => $items->items(),
            'total' => $items->total(),
            'page' => $items->currentPage(),
            'size' => $items->perPage(),
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
        // TODO: Implement repositoryFind() method.
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
     * 通过试卷查询试题
     *
     * @param array $searchWhere ['exam_collection_uuid'=>'试卷uuid']
     * @param int $perSize
     * @return array
     */
    public function repositorySelectByCollection(array $searchWhere, int $perSize): array
    {
        $items = $this->examModel::query()->with(['collectionExamRelation:exam_item_uuid,exam_collection_uuid'
        ])->whereHas('collectionExamRelation', function ($query) use ($searchWhere) {
            $query->where('exam_collection_uuid', '=', $searchWhere['exam_collection_uuid']);
        })->select(['uuid', 'title', 'cover', 'answer', 'analysis', 'tips', 'option'])
            ->paginate($perSize);

        return [
            'items' => $items->items(),
            'total' => $items->total(),
            'page' => $items->currentPage(),
            'size' => $items->perPage(),
        ];
    }

    /**
     * 通过范围查询所有的试题
     *
     * @param array $searchWhere 查询范围
     * @param string $field 查询字段
     * @return array
     */
    public function repositorySelectAllByIn(array $searchWhere, string $field): array
    {
        $items = $this->examModel::query()->whereIn($field, $searchWhere)->get(['uuid', 'answer_income_score']);

        return !empty($items) ? $items->toArray() : [];
    }
}
