<?php
declare(strict_types = 1);

namespace App\Http\Controllers\Api\Exam;


use App\Http\Controllers\APiAuthBaseController;
use App\Mapping\Response\ApiResponse;
use App\Services\Api\Exam\CollectionService;
use Illuminate\Http\JsonResponse;

/**
 * 试卷
 *
 * Class CollectionController
 * @package App\Http\Controllers\Api\Exam
 *
 */
class CollectionController extends APiAuthBaseController
{
    public function __construct(CollectionService $apiService)
    {
        $this->service = $apiService;
        parent::__construct($apiService);
    }

    /**
     * 试卷详情
     *
     * @return JsonResponse
     */
    public function show()
    {
        $bean = $this->service->serviceFind((array)$this->requestParams);

        return ApiResponse::success((array)$bean);
    }
}
