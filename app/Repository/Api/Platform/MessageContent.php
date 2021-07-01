<?php
declare(strict_types=1);

namespace App\Repository\Api\Platform;

use App\Models\Api\Platform\MessageContent as ContentModel;
use App\Repository\Api\ApiRepositoryInterface;

/**
 * 消息内容
 *
 * Class MessageContent
 * @package App\Repository\Api\Platform
 */
class MessageContent implements ApiRepositoryInterface
{
    private $contentModel;

    public function __construct()
    {
        $this->contentModel = new ContentModel;
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
        $items = $this->contentModel::query()
            ->where($closure)
            ->select(['uuid', 'title', 'content', 'created_at', 'platform_message_category_uuid'])
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
        $bean = $this->contentModel::query()->where($closure)
            ->first(['uuid', 'title', 'content', 'created_at', 'platform_message_category_uuid']);

        return !empty($bean) ? $bean->toArray() : [];
    }


    /**
     * 查询总数
     *
     * @param array $searchWhere
     * @return int
     */
    public function repositoryCount(array $searchWhere = []): int
    {
        return $this->contentModel::query()->where($searchWhere)->count('id');
    }
}
