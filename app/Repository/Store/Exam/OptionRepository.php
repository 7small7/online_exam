<?php
declare(strict_types=1);

namespace App\Repository\Store\Exam;


use App\Exceptions\DBException;
use App\Models\Store\Exam\Option;
use App\Repository\Store\StoreRepositoryInterface;

/**
 * 选择题
 *
 * Class OptionRepository
 * @package App\Repository\Store\Exam
 */
class OptionRepository implements StoreRepositoryInterface
{
    private $optionModel;

    public function __construct()
    {
        $this->optionModel = new Option;
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
        $items = $this->optionModel::query()->where($closure)->select($this->optionModel->searchFields)->paginate($perSize);

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
     * @return array 插入的数据记录
     * @throws DBException
     */
    public function repositoryCreate(array $insertInfo): array
    {
        try {
            $newOptionModel = $this->optionModel::query()->create($insertInfo);

            return !empty($newOptionModel) ? $newOptionModel->getAttributes() : [];
        } catch (\Exception $exception) {
            throw  new DBException('添加异常');
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
     * 单条数据查询
     *
     * @param \Closure $closure
     * @return array
     */
    public function repositoryFind(\Closure $closure): array
    {
        $bean = $this->optionModel::query()->where($closure)->first();

        return !empty($bean) ? $bean->toArray() : [];
    }

    /**
     * 更新数据
     *
     * @param array $updateWhere 修改条件
     * @param array $updateInfo 修改信息
     * @return int 更新行数
     * @throws DBException
     */
    public function repositoryUpdate(array $updateWhere, array $updateInfo): int
    {
        $updateInfo = $this->optionModel->updateIgnoreFields((array)$updateInfo);

        try {
            return $this->optionModel::query()->where($updateWhere)->update($updateInfo);

        } catch (\Exception $exception) {
            throw  new DBException('修改异常');
        }
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
}
