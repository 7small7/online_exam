<?php
declare(strict_types = 1);

namespace App\Repository\Api\User;


use App\Models\Api\User\WeChatUserSubscribe;
use App\Repository\Api\ApiRepositoryInterface;
use phpDocumentor\Reflection\Types\String_;

/**
 * 微信用户订阅消息
 *
 * Class WeChatUserSubscribeRepository
 * @package App\Repository\Api\User
 */
class WeChatUserSubscribeRepository implements ApiRepositoryInterface
{
    public $userSubscribeModel;

    public function __construct()
    {
        $this->userSubscribeModel = new WeChatUserSubscribe;
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
        $newModel = $this->userSubscribeModel::query()->create($insertInfo);

        return !empty($newModel) ? true : false;
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
     * 查询订阅数据
     *
     * @param array $searchWhere
     * @return array
     */
    public function repositoryListByTemplateId(array $searchWhere): array
    {

        $items = $this->userSubscribeModel::query()
            ->with(['user:openid,uuid'])
            ->where($searchWhere)
            ->where([['is_used', '=', 1]])
            ->groupBy(['wechat_user_uuid', 'template_id'])
            ->get(['wechat_user_uuid', 'template_id', 'uuid']);

        return !empty($items) ? $items->toArray() : [];
    }

    /**
     * 批量更新内容
     *
     * @param array $updateWhere
     * @param array $updateValue
     * @return int
     */
    public function repositoryBatchUpdate(array $updateWhere, array $updateValue, string $updateField): int
    {
        return $this->userSubscribeModel::query()->whereIn($updateField, $updateWhere)->update($updateValue);
    }
}
