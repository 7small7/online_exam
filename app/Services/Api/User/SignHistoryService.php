<?php


namespace App\Services\Api\User;


use App\Exceptions\DBException;
use App\Libs\UUID;
use App\Mapping\Config\ScoreKey;
use App\Repository\Api\User\SignHistoryRepository;
use App\Services\Api\ApiServiceInterface;
use Illuminate\Support\Facades\DB;

/**
 * 用户签到历史
 *
 * Class SignHistoryService
 * @package App\Services\Api\User
 */
class SignHistoryService implements ApiServiceInterface
{
    private $signHistoryRepository;

    public function __construct()
    {
        $this->signHistoryRepository = new SignHistoryRepository;
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
     * @throws DBException
     */
    public function serviceCreate(array $requestParams): bool
    {
        try {
            DB::transaction(function () use ($requestParams) {
                // 添加签到记录
                $this->signHistoryRepository->repositoryCreate((array)[
                    'uuid' => UUID::getUUID(),
                    'wechat_user_uuid' => $requestParams['user_id'],
                    'sign_date' => date('Y-m-d'),
                    'is_show' => 1,
                ]);

                // 添加签到汇总
                (new SignCollectionService())->checkUserSign((array)[
                    'user_id' => $requestParams['user_id'],
                ]);

                // 添加积分
                (new ScoreHistoryService())->serviceCreate((array)[
                    'type' => 1,
                    'key' => ScoreKey::SIGN,
                    'user_id' => $requestParams['user_id']
                ]);
            });

            return true;
        } catch (\Exception $exception) {
            throw  new DBException($exception->getMessage());
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
        return $this->signHistoryRepository->repositoryFind(function ($query) use ($requestParams) {
            extract($requestParams);
            if (!empty($user_id)) {
                $query->where('wechat_user_uuid', '=', $user_id);
            }
            if (!empty($sign_date)) {
                $query->where('sign_date', '=', $sign_date);
            }
        });
    }
}
