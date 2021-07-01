<?php
declare(strict_types = 1);

namespace App\Http\Controllers\Api\Exam;


use App\Http\Controllers\APiAuthBaseController;
use App\Http\Requests\Api\WeChat\CollectionValidate;
use App\Mapping\Response\ApiResponse;
use App\Services\Api\Exam\CollectionExamService;
use Illuminate\Http\JsonResponse;

/**
 * 试卷试题
 *
 * Class CollectionExamController
 * @package App\Http\Controllers\Api\Exam
 */
class CollectionExamController extends APiAuthBaseController
{
    public function __construct(CollectionExamService $apiService)
    {
        $this->service = $apiService;
        parent::__construct($apiService);
    }

    /**
     * 试卷试题列表
     *
     * @param CollectionValidate $validate
     * @return JsonResponse
     */
    public function index(CollectionValidate $validate)
    {
        $items = $this->service->serviceSelect((array)$this->requestParams);

        return ApiResponse::success((array)$items);
    }
}
