<?php
declare(strict_types = 1);

namespace App\Http\Controllers\Api\User;

use App\Exceptions\DBException;
use App\Http\Controllers\APiAuthBaseController;
use App\Mapping\Response\ApiResponse;
use App\Services\Api\User\SignHistoryService;
use Illuminate\Http\JsonResponse;

/**
 * 用户签到
 *
 * Class SignController
 * @package App\Http\Controllers\Api\User
 */
class SignController extends APiAuthBaseController
{
    public function __construct(SignHistoryService $apiService)
    {
        $this->service = $apiService;
        parent::__construct($apiService);
    }

    /**
     * 用户签到记录
     *
     * @return JsonResponse
     * @throws DBException
     */
    public function store()
    {

        $this->service->serviceCreate((array)$this->requestParams);

        return ApiResponse::success();
    }
}
