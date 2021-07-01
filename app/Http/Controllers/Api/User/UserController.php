<?php
declare(strict_types = 1);

namespace App\Http\Controllers\Api\User;

use App\Http\Controllers\APiAuthBaseController;
use App\Http\Requests\Api\WeChat\UserValidate;
use App\Mapping\Response\ApiResponse;
use App\Services\Api\User\WeChatUserService;
use Illuminate\Http\JsonResponse;

/**
 * 用户
 *
 * Class UserController
 * @package App\Http\Controllers\Api\User
 */
class UserController extends APiAuthBaseController
{
    public function __construct(WeChatUserService $apiService)
    {
        $this->service = $apiService;
        parent::__construct($apiService);
    }

    /**
     * 用户信息更新
     *
     * @param UserValidate $validate
     * @return JsonResponse
     */
    public function update(UserValidate $validate)
    {
        $userInfo = $validate->validated();
        $userInfo['user_id'] = $this->userId;
        $createResult = $this->service->serviceUpdate(((array)$userInfo));

        return $createResult ? ApiResponse::success() : ApiResponse::error();
    }
}
