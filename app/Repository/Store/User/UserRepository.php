<?php
declare(strict_types=1);

namespace App\Repository\Store\User;


use App\Exceptions\DBException;
use App\Models\Store\User\User;
use App\Repository\Store\StoreRepositoryInterface;

/**
 * 商户
 *
 * Class UserRepository
 * @package App\Repository\Store\User
 */
class UserRepository implements StoreRepositoryInterface
{
    private $userModel;

    public function __construct()
    {
        $this->userModel = new User;
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
        $items = $this->userModel::query()->where($closure)->select($this->userModel->searchFields)->paginate($perSize);

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
     * @return array 查询的新数据
     * @throws DBException
     */
    public function repositoryCreate(array $insertInfo): array
    {
        try {
            $newUserModel = $this->userModel::query()->create($insertInfo);

            return $newUserModel->getAttributes();
        } catch (\Exception $exception) {
            if (!empty(stripos($exception->getMessage(), 'Duplicate entry'))) {
                throw  new DBException('手机号已存在');
            }
            throw  new DBException('注册信息异常');
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
        return 0;
    }

    /**
     * 单条数据查询
     *
     * @param \Closure $closure
     * @return array
     */
    public function repositoryFind(\Closure $closure): array
    {
        $bean = $this->userModel::query()->where($closure)->first($this->userModel->searchFields);
        if (!empty($bean)) {
            return $bean->toArray();
        }

        return [];
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
        return $this->userModel::query()->where($updateWhere)->update($updateInfo);
    }

    /**
     * 删除数据
     *
     * @param array $deleteWhere 删除条件
     * @return int 删除行数
     */
    public function repositoryDelete(array $deleteWhere): int
    {
        return $this->userModel::query()->where($deleteWhere)->delete() ? 1 : 0;
    }
}
