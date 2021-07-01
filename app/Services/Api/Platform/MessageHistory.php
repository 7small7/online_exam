<?php
declare(strict_types=1);

namespace App\Services\Api\Platform;

use App\Libs\UUID;
use App\Repository\Api\Platform\MessageContent;
use App\Repository\Api\Platform\MessageHistory as HistoryRepository;
use App\Services\Api\ApiServiceInterface;

/**
 * 消息历史记录
 *
 * Class MessageHistory
 * @package App\Services\Api\Platform
 */
class MessageHistory implements ApiServiceInterface
{
    private $historyRepository;

    public function __construct()
    {
        $this->historyRepository = new HistoryRepository;
    }

    /**
     * 格式化查询条件
     *
     * @param array $requestParams 请求参数
     * @return mixed 组装的查询条件
     */
    public static function searchWhere(array $requestParams)
    {
        // TODO: Implement searchWhere() method.
    }

    /**
     * 查询数据
     *
     * @param array $requestParams 请求参数
     * @return array 查询结果
     */
    public function serviceSelect(array $requestParams): array
    {
        // TODO: Implement serviceSelect() method.
    }

    /**
     * 创建数据
     *
     * @param array $requestParams 请求参数
     * @return boolean true|false
     */
    public function serviceCreate(array $requestParams): bool
    {
        return $this->historyRepository->repositoryCreate((array)[
            'uuid'                           => UUID::getUUID(),
            'platform_message_category_uuid' => $requestParams['platform_message_category_uuid'],
            'platform_message_content_uuid'  => $requestParams['platform_message_content_uuid'],
            'wechat_user_uuid'               => $requestParams['user_id'],
            'is_show'                        => 1,
        ]);
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

    }

    /**
     * 查询消息未阅读数量
     *
     * @param array $requestParams
     * @return int
     */
    public function serviceCount(array $requestParams): int
    {
        // 查询总消息数量
        $messageCount = (new MessageContent())->repositoryCount();
        // 查询当前已经阅读数量
        $historyCount = $this->historyRepository->repositoryCount((array)['wechat_user_uuid' => $requestParams['uuid']]);

        return abs($messageCount - $historyCount);
    }
}
