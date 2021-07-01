<?php
declare(strict_types = 1);

namespace App\Http\Controllers\Api\User;

use App\Http\Controllers\APiAuthBaseController;
use App\Mapping\Response\ApiResponse;
use App\Services\Api\User\ScoreHistoryService;

/**
 * 积分历史
 *
 * Class ScoreHistoryController
 * @package App\Http\Controllers\Api\User
 */
class ScoreHistoryController extends APiAuthBaseController
{
    public function __construct(ScoreHistoryService $apiService)
    {
        $this->service = $apiService;
        parent::__construct($apiService);
    }

    public function index()
    {
        $items = $this->service->serviceSelect((array)$this->requestParams);

        return ApiResponse::success((array)$items);
    }
}
