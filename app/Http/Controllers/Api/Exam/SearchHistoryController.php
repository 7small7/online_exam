<?php
declare(strict_types = 1);

namespace App\Http\Controllers\Api\Exam;


use App\Http\Controllers\APiBaseController;
use App\Mapping\Response\ApiResponse;
use App\Services\Api\Exam\SearchHistoryService;
use Illuminate\Http\JsonResponse;

/**
 * 搜索历史
 *
 * Class SearchHistoryController
 * @package App\Http\Controllers\Api\Exam
 */
class SearchHistoryController extends APiBaseController
{
    public function __construct(SearchHistoryService $apiService)
    {
        $this->service = $apiService;
        parent::__construct($apiService);
    }

    /**
     * 搜索历史列表
     *
     * @return JsonResponse
     */
    public function index()
    {
        $items = $this->service->serviceSelect((array)$this->requestParams);

        return ApiResponse::success((array)$items);
    }

    /**
     * 存储搜索历史
     *
     * @return JsonResponse
     */
    public function store()
    {
        $this->service->serviceCreate((array)$this->requestParams);

        return ApiResponse::success();
    }
}
