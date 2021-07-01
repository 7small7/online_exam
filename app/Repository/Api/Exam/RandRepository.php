<?php
declare(strict_types=1);

namespace App\Repository\Api\Exam;


use App\Models\Api\Exam\Rand;
use App\Repository\Api\ApiRepositoryInterface;

/**
 * 附件试题
 *
 * Class RandRepository
 * @package App\Repository\Api\Exam
 */
class RandRepository implements ApiRepositoryInterface
{
    private $randModel;

    public function __construct()
    {
        $this->randModel = new Rand;
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
        $items = $this->randModel::query()->where($closure)
            ->select(['uuid', 'title', 'cover', 'author', 'link', 'read_number', 'download_number', 'source', 'created_at'])
            ->orderByDesc('orders')
            ->paginate((int)$perSize);

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
        $bean = $this->randModel::query()
            ->where($closure)
            ->first($this->randModel->searchFields);

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
     * 增加数量
     *
     * @param array $updateWhere 更新条件
     * @param array $updateInfo 更新信息
     * @return bool
     * @author kert
     */
    public function incrNumber(array $updateWhere, array $updateInfo): bool
    {
        if ($this->randModel::query()->where($updateWhere)->increment($updateInfo['field'], $updateInfo['value'])) {
            return true;
        }

        return false;
    }
}
