<?php
declare(strict_types = 1);

namespace App\Http\Controllers\Api\Platform;

use App\Http\Controllers\APiAuthBaseController;
use App\Http\Requests\Api\WeChat\MessageReadValidate;
use App\Mapping\Response\ApiResponse;
use App\Services\Api\Platform\MessageHistory as HistoryService;
use Illuminate\Http\JsonResponse;

/**
 * 消息历史
 *
 * Class MessageHistory
 * @package App\Http\Controllers\Api\Platform
 */
class MessageHistoryController extends APiAuthBaseController
{
    public function __construct(HistoryService $apiService)
    {
        $this->service = $apiService;
        parent::__construct($apiService);
    }

    /**
     * 消息中心阅读历史
     *
     * @param MessageReadValidate $validate
     * @return JsonResponse
     */
    public function store(MessageReadValidate $validate)
    {
        $result = $this->service->serviceCreate((array)$this->requestParams);

        return $result ? ApiResponse::success() : ApiResponse::error();
    }
}
