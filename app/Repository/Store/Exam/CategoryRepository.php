<?php
declare(strict_types=1);

namespace App\Repository\Store\Exam;


use App\Exceptions\DBException;
use App\Models\Store\Exam\ExamCategory;
use App\Repository\Store\StoreRepositoryInterface;

/**
 * 试题分类
 *
 * Class CategoryRepository
 * @package App\Repository\Store\Exam
 */
class CategoryRepository implements StoreRepositoryInterface
{
    private $categoryModel;

    public function __construct()
    {
        $this->categoryModel = new ExamCategory;
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
        $items = $this->categoryModel::query()->where($closure)->select($this->categoryModel->searchFields)->paginate($perSize);

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
            $newCategoryModel = $this->categoryModel::query()->create($insertInfo);

            return !empty($newCategoryModel) ? $newCategoryModel->getAttributes() : [];
        } catch (\Exception $exception) {
            if (!empty(stripos($exception->getMessage(), 'Duplicate entry'))) {
                throw  new DBException('该名称已存在');
            }
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
        $bean = $this->categoryModel::query()->where($closure)->first($this->categoryModel->searchFields);

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
        $updateInfo = $this->categoryModel->updateIgnoreFields((array)$updateInfo);

        try {
            return $this->categoryModel::query()->where($updateWhere)->update($updateInfo);

        } catch (\Exception $exception) {
            if (!empty(stripos($exception->getMessage(), 'Duplicate entry'))) {
                throw  new DBException('该名称已存在');
            }
            throw  new DBException('修改异常');
        }
    }

    /**
     * 删除数据
     *
     * @param array $deleteWhere 删除条件
     * @return int 删除行数
     * @throws DBException
     */
    public function repositoryDelete(array $deleteWhere): int
    {
        $uuid = json_decode($deleteWhere['uuid'], true);
        // 验证分类下面是否存在子类
        $items = $this->categoryModel::query()->whereIn('parent_uuid', $uuid)->first(['uuid']);
        if (empty($items)) {
            $deleteResult = $this->categoryModel::query()
                ->where([['store_uuid', '=', $deleteWhere['store_uuid']]])
                ->whereIn('uuid', $uuid)
                ->orWhereIn('parent_uuid', $uuid)
                ->delete();
            return !empty($deleteResult) ? $deleteResult : 0;
        } else {
            throw  new DBException('该分类下存在子级分类');
        }
    }
}
