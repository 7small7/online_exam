<?php
declare(strict_types=1);

namespace App\Http\Controllers\Store\User;


use App\Http\Controllers\StoreAuthBaseController;
use App\Mapping\Response\ApiResponse;
use App\Services\Store\User\UserService;
use Illuminate\Http\JsonResponse;

/**
 * 商户
 *
 * Class UserController
 * @package App\Http\Controllers\Store\User
 */
class UserController extends StoreAuthBaseController
{
    public function __construct(UserService $apiService)
    {
        $this->service = $apiService;
        parent::__construct($apiService);
    }

    /**
     * 商户信息
     *
     * @return JsonResponse
     * @author kert
     */
    public function show()
    {
        $bean = $this->userInfo;

        return ApiResponse::success((array)$bean);
    }
}
