<?php
declare(strict_types=1);

namespace App\Services\Api\Platform;

use App\Repository\Api\Platform\MessageContent as ContentRepository;
use App\Services\Api\ApiServiceInterface;

/**
 * 消息内容
 *
 * Class MessageContent
 * @package App\Services\Api\Platform
 */
class MessageContent implements ApiServiceInterface
{
    private $contentRepository;

    public function __construct()
    {
        $this->contentRepository = new ContentRepository();
    }

    /**
     * 格式化查询条件
     *
     * @param array $requestParams 请求参数
     * @return mixed 组装的查询条件
     */
    public static function searchWhere(array $requestParams)
    {
        return function ($query) use ($requestParams) {
            extract($requestParams);
            if (!empty($platform_message_category_uuid)) {
                $query->where('platform_message_category_uuid', '=', $requestParams['platform_message_category_uuid']);
            }
            if (!empty($platform_message_uuid)) {
                $query->where('uuid', '=', $platform_message_uuid);
            }
        };
    }

    /**
     * 查询数据
     *
     * @param array $requestParams 请求参数
     * @return array 查询结果
     */
    public function serviceSelect(array $requestParams): array
    {
        $perSize = $requestParams['size'] ?? 10;

        return $this->contentRepository->repositorySelect(self::searchWhere((array)$requestParams), (int)$perSize);
    }

    /**
     * 创建数据
     *
     * @param array $requestParams 请求参数
     * @return boolean true|false
     */
    public function serviceCreate(array $requestParams): bool
    {
        // TODO: Implement serviceCreate() method.
    }

    /**
     * 更新数据
     *
     * @param array $requestParams 请求参数
     * @return int 更新行数
     */
    public function serviceUpdate(array $requestParams): int
    {
        // TODO: Implement serviceUpdate() method.
    }

    /**
     * 删除数据
     *
     * @param array $requestParams 请求参数
     * @return int 删除行数
     */
    public function serviceDelete(array $requestParams): int
    {
        // TODO: Implement serviceDelete() method.
    }

    /**
     * 查询单条数据
     *
     * @param array $requestParams 请求参数
     * @return array 删除行数
     */
    public function serviceFind(array $requestParams): array
    {
        return $this->contentRepository->repositoryFind(self::searchWhere((array)$requestParams));
    }
}
