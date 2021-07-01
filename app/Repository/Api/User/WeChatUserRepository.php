<?php
declare(strict_types=1);

namespace App\Repository\Api\User;


use App\Models\Api\User\WeChatUser;
use App\Repository\Api\ApiRepositoryInterface;

/**
 * 微信用户
 *
 * Class WeChatUserRepository
 * @package App\Repository\Api\User
 */
class WeChatUserRepository implements ApiRepositoryInterface
{
    private $userModel;

    public function __construct()
    {
        $this->userModel = new WeChatUser;
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
     */
    public function repositoryCreate(array $insertInfo): bool
    {
        if ($this->userModel::query()->where('openid', '=', $insertInfo['openid'])->first(['id'])) {
            unset($insertInfo['uuid']);
            $result = $this->userModel::query()->where('openid', '=', $insertInfo['openid'])->update($insertInfo);
        } else {
            $result = $this->userModel::query()->create($insertInfo);
        }

        return $result ? true : false;
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
        $bean = $this->userModel::query()->where($closure)->first(['*']);

        return !empty($bean) ? $bean->toArray() : [];
    }
}
