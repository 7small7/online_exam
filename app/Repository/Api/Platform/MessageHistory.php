<?php
declare(strict_types=1);

namespace App\Repository\Api\Platform;

use App\Exceptions\DBException;
use App\Models\Api\Platform\MessageHistory as HistoryModel;
use App\Repository\Api\ApiRepositoryInterface;

/**
 * 消息历史
 *
 * Class MessageHistory
 * @package App\Repository\Api\Platform
 */
class MessageHistory implements ApiRepositoryInterface
{
    private $historyModel;

    public function __construct()
    {
        $this->historyModel = new HistoryModel();
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
        // TODO: Implement repositorySelect() method.
    }

    /**
     * 创建数据
     *
     * @param array $insertInfo 创建信息
     * @return boolean true|false
     * @throws DBException
     */
    public function repositoryCreate(array $insertInfo): bool
    {
        try {
            $model = $this->historyModel::query()->create($insertInfo);
            return $model->getKey() ? true : false;
        } catch (\Exception $exception) {
            throw new DBException($exception->getMessage());
        }
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
     * 查询总数
     *
     * @param array $searchWhere 查询条件
     * @return int
     */
    public function repositoryCount(array $searchWhere = []): int
    {
        return $this->historyModel::query()->where($searchWhere)->count('id');
    }
}
