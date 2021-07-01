<?php
declare(strict_types = 1);

namespace App\Http\Controllers\Api\User;

use App\Http\Controllers\APiBaseController;
use App\Libs\Cache\Redis\RedisConnection;
use App\Libs\UUID;
use App\Libs\WeChat\WeChat;
use App\Mapping\Cache\RedisCacheKey;
use App\Mapping\Config\ScoreKey;
use App\Mapping\Response\ApiResponse;
use App\Services\Api\User\ScoreHistoryService;
use App\Services\Api\User\WeChatUserService;
use Illuminate\Http\JsonResponse;

/**
 * 用户登录
 *
 * Class LoginController
 * @package App\Http\Controllers\Api\User
 */
class LoginController extends APiBaseController
{
    public function __construct(WeChatUserService $apiService)
    {
        $this->service = $apiService;
        parent::__construct($apiService);
    }

    /**
     * 微信小程序登录
     *
     * @return JsonResponse
     * @author kert
     */
    public function weChatLogin()
    {
        $code = $this->requestParams['code'];
        $sessionInfo = (new WeChat())->getSessionKey($code);
        $requestUserInfo = $this->requestParams['userInfo'];
        if ($sessionInfo['code'] == 0) {
            // 用户信息入库
            $userInfo = [
                'openid' => $sessionInfo['data']['openid'],
                'nickname' => $requestUserInfo['nickName'],
                'avatar_url' => $requestUserInfo['avatarUrl'],
                'gender' => $requestUserInfo['gender'],
                'country' => $requestUserInfo['country'],
                'province' => $requestUserInfo['province'],
                'city' => $requestUserInfo['city'],
                'uuid' => UUID::getUUID(),
                'language' => $requestUserInfo['language']
            ];

            if ($this->service->serviceCreate((array)$userInfo)) {
                $userInfo['user_agent'] = $this->header['user-agent'];
                // 创建缓存
                $userInfo = $this->service->serviceFind((array)['openid' => $sessionInfo['data']['openid']]);
                // 创建积分历史
                (new ScoreHistoryService())->serviceCreate((array)[
                    'type' => 1,
                    'key' => ScoreKey::LOGIN_SCORE,
                    'user_id' => $userInfo['uuid'],
                ]);
                $token = md5(UUID::getUUID());
                RedisConnection::getInstance()->set(RedisCacheKey::USER_LOGIN_TOKEN . $token, json_encode($userInfo, JSON_UNESCAPED_UNICODE), 'ex', 874000);

                return ApiResponse::success((array)[
                    'token' => $token,
                    'info' => $userInfo,
                ]);
            }

            return ApiResponse::error();
        }

        return ApiResponse::error();
    }
}
