<?php
declare(strict_types = 1);

namespace App\Http\Controllers\Api\User\Exam;


use App\Http\Controllers\APiAuthBaseController;
use App\Mapping\Response\ApiResponse;
use App\Services\Api\Exam\SubmitHistoryService;
use Illuminate\Http\JsonResponse;

/**
 * 试卷记录
 *
 * Class CollectionController
 * @package App\Http\Controllers\Api\User\Exam
 */
class CollectionController extends APiAuthBaseController
{
    public function __construct(SubmitHistoryService $apiService)
    {
        $this->service = $apiService;
        parent::__construct($apiService);
    }

    /**
     * 答题列表
     *
     * @return JsonResponse
     */
    public function index()
    {
        $items = $this->service->serviceSelect((array)$this->requestParams);

        return ApiResponse::success((array)$items);
    }
}
