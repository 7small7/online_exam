<?php


namespace App\Services\Api\User;


use App\Libs\UUID;
use App\Mapping\Config\ScoreKey;
use App\Repository\Api\User\ScoreHistoryRepository;
use App\Services\Api\ApiServiceInterface;
use App\Services\Api\Platform\ScoreSettingService;

/**
 * 用户积分历史
 *
 * Class ScoreHistoryService
 * @package App\Services\Api\User
 */
class ScoreHistoryService implements ApiServiceInterface
{
    private $scoreHistoryRepository;

    public function __construct()
    {
        $this->scoreHistoryRepository = new ScoreHistoryRepository;
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
            if (!empty($user_id)) {
                $query->where('wechat_user_uuid', '=', $user_id);
            }
        };
    }

    /**
     * 查询数据
     *
     * @param array $requestParams 请求参数['user_id' => '用户id', 'page' => '选填', 'size' => '选填']
     * @return array 查询结果
     */
    public function serviceSelect(array $requestParams): array
    {
        $perSize = $requestParams['size'] ?? 10;

        return $this->scoreHistoryRepository->repositorySelect(self::searchWhere((array)$requestParams), (int)$perSize);
    }

    /**
     * 创建数据
     *
     * @param array $requestParams 请求参数['key' => '增加积分key', 'user_id' => '用户id', 'type' => '1增加|2减少']
     * @return boolean true|false
     */
    public function serviceCreate(array $requestParams): bool
    {
        $bean = $this->scoreHistoryRepository->repositoryFind(function ($query) use ($requestParams) {
            extract($requestParams);
            if (!empty($key)) {
                if ($key == ScoreKey::LOGIN_SCORE) {// 如果是注册场景，就只能添加一次。
                    $query->where('key', '=', $requestParams['key']);
                    $query->where('wechat_user_uuid', '=', $requestParams['user_id']);
                }
            }
        });
        if ($requestParams['key'] != ScoreKey::LOGIN_SCORE) {// 非注册时用户
            $bean = (new ScoreSettingService())->serviceFind((array)['key' => $requestParams['key']]);
            if (!empty($bean)) {// 配置了积分
                return $this->scoreHistoryRepository->repositoryCreate((array)[
                    'uuid' => UUID::getUUID(),
                    'type' => $requestParams['type'],
                    'key' => $requestParams['key'],
                    'score' => $bean['score'],
                    'wechat_user_uuid' => $requestParams['user_id'],
                    'is_show' => 1,
                ]);
            }
            return true;
        } elseif ($requestParams['key'] == ScoreKey::LOGIN_SCORE && empty($bean)) {
            $bean = (new ScoreSettingService())->serviceFind((array)['key' => $requestParams['key']]);
            if (!empty($bean)) {// 配置了积分
                return $this->scoreHistoryRepository->repositoryCreate((array)[
                    'uuid' => UUID::getUUID(),
                    'type' => $requestParams['type'],
                    'key' => $requestParams['key'],
                    'score' => $bean['score'],
                    'wechat_user_uuid' => $requestParams['user_id'],
                    'is_show' => 1,
                ]);
            }
            return true;
        } else {
            return true;
        }
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
     * 查询当前用户积分
     *
     * @param string $userId 用户id
     * @return string
     */
    public function scoreCount(string $userId): string
    {
        $incomeScore = $this->scoreHistoryRepository->repositorySum((array)[['type', '=', 1], ['wechat_user_uuid', '=', $userId]], (array)['score']);
        $expendScore = $this->scoreHistoryRepository->repositorySum((array)[['type', '=', 2], ['wechat_user_uuid', '=', $userId]], (array)['score']);

        return sprintf('%01.2f', $incomeScore['score'] - $expendScore['score']);
    }
}
