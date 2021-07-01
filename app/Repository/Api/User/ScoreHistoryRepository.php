<?php

namespace App\Repository\Api\User;

use App\Models\Api\User\ScoreHistory;
use App\Repository\Api\ApiRepositoryInterface;

/**
 * 积分历史
 *
 * Class ScoreHistoryRepository
 * @package App\Repository\Api\User
 */
class ScoreHistoryRepository implements ApiRepositoryInterface
{
    private $scoreHistoryModel;

    public function __construct()
    {
        $this->scoreHistoryModel = new ScoreHistory;
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
        $items = $this->scoreHistoryModel::query()
            ->where($closure)
            ->select(['uuid', 'type', 'key', 'score', 'created_at'])
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
        $model = $this->scoreHistoryModel::query()->create($insertInfo);

        return !empty($model->getKey()) ? true : false;
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
        $bean = $this->scoreHistoryModel::query()->where($closure)->first(['id']);

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
     * 查询数据总数
     *
     * @param array $searchWhere
     * @param array $searchFields
     * @return array
     */
    public function repositorySum(array $searchWhere, array $searchFields): array
    {
        foreach ($searchFields as $value) {
            $searchFields[$value] = $this->scoreHistoryModel::query()->where($searchWhere)->sum($value);
        }

        return $searchFields;
    }
}
