<?php
declare(strict_types = 1);

namespace App\Http\Controllers\Api\Exam;


use App\Http\Controllers\APiBaseController;
use App\Mapping\Response\ApiResponse;
use App\Services\Api\Exam\RandService;
use Illuminate\Http\JsonResponse;

/**
 * 附件试题
 *
 * Class RandController
 * @package App\Http\Controllers\Api\Exam
 */
class RandController extends APiBaseController
{
    public function __construct(RandService $apiService)
    {
        $this->service = $apiService;
        parent::__construct($apiService);
    }

    /**
     * 随机试题列表
     *
     * @return JsonResponse
     */
    public function index()
    {
        $items = $this->service->serviceSelect((array)$this->requestParams);

        return ApiResponse::success((array)$items);
    }

    /**
     * 随机试题详情
     *
     * @return JsonResponse
     */
    public function show()
    {
        $bean = $this->service->serviceFind((array)$this->requestParams);

        return ApiResponse::success((array)$bean);
    }

    /**
     * 随机试题数量增加(下载和阅读)
     *
     * @return JsonResponse
     */
    public function incr()
    {
        $this->service->incrNUmber((array)$this->requestParams);

        return ApiResponse::success();
    }
}
