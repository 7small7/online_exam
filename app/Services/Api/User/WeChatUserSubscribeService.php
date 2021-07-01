<?php
declare(strict_types = 1);

namespace App\Services\Api\User;


use App\Libs\UUID;
use App\Repository\Api\User\WeChatUserSubscribeRepository;
use App\Services\Api\ApiServiceInterface;

/**
 * 微信用户订阅消息
 *
 * Class WeChatUserSubscribeService
 * @package App\Services\Api\User
 */
class WeChatUserSubscribeService implements ApiServiceInterface
{

    private $userSubscribeRepository;

    public function __construct()
    {
        $this->userSubscribeRepository = new WeChatUserSubscribeRepository;
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
        return $this->userSubscribeRepository->repositoryCreate([
            'uuid' => UUID::getUUID(),
            'store_uuid' => env('STORE_UUID'),
            'wechat_user_uuid' => $requestParams['user_id'],
            'template_id' => $requestParams['template_id'],
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
        // TODO: Implement serviceFind() method.
    }

    /**
     * 查询订阅历史
     *
     * @param string $templateId 订阅消息木板id
     * @return array
     */
    public function serviceListByTemplateId(string $templateId): array
    {
        return $this->userSubscribeRepository->repositoryListByTemplateId((array)[['template_id', '=', $templateId]]);
    }

    /**
     * 批量修改数据
     *
     * @param array $updateWhere
     * @param array $updateValue
     * @param string $updateField
     * @return int
     */
    public function serviceBatchUpdate(array $updateWhere, array $updateValue, string $updateField): int
    {
        return $this->userSubscribeRepository->repositoryBatchUpdate((array)$updateWhere, (array)$updateValue, (string)$updateField);
    }
}
