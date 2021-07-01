<?php
declare(strict_types = 1);

namespace App\Http\Controllers\Api\User;

use App\Http\Controllers\APiBaseController;
use App\Mapping\Cache\UserInfo;
use App\Mapping\Response\ApiResponse;
use App\Services\Api\Platform\MessageHistory;
use App\Services\Api\User\ScoreHistoryService;
use App\Services\Api\User\SignCollectionService;
use App\Services\Api\User\SignHistoryService;
use App\Services\Api\User\WeChatUserService;
use Illuminate\Http\JsonResponse;

/**
 * 用户信息
 *
 * Class UserInfoController
 * @package App\Http\Controllers\Api\User
 */
class UserInfoController extends APiBaseController
{
    public function __construct(WeChatUserService $apiService)
    {
        $this->service = $apiService;
        parent::__construct($apiService);
    }

    /**
     * 用户信息
     *
     * @return JsonResponse
     */
    public function getUserInfo()
    {
        $userInfo = [
            'sign' => [
                'is_sign' => 0,
                'sign_days' => 0,
            ],
            'collection' => 0,
            'attention' => 0,
            'score' => 0,
            'unread_message' => 0,
            'userInfo' => [],
        ];
        if (isset($this->header['authentication']) && !empty($this->header['authentication'][0])) {

            $userId = UserInfo::getUserId();
            if (!empty($userId)) {
                $user = $this->service->serviceFind(((array)['user_id' => $userId]));
                unset($user['id']);

                $userSignCollection = (new SignCollectionService())->serviceFind((array)['user_id' => $userId]);
                $userSignHistory = (new SignHistoryService())->serviceFind((array)['user_id' => $userId, 'sign_date' => date('Y-m-d')]);

                // 登录状态
                $userInfo['sign'] = [
                    'is_sign' => empty($userSignHistory) ? 0 : 1,
                    'sign_days' => empty($userSignCollection) ? 0 : $userSignCollection['sign_number'],
                ];
                $userInfo['collection'] = 10;
                $userInfo['attention'] = 10;
                $userInfo['score'] = (new ScoreHistoryService())->scoreCount((string)$userId);
                $userInfo['unread_message'] = (new MessageHistory())->serviceCount((array)['uuid' => $userId]);
                $userInfo['userInfo'] = $user;
            }

            return ApiResponse::success((array)$userInfo);
        }

        return ApiResponse::success((array)$userInfo);
    }
}
