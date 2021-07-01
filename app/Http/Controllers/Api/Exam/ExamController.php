<?php
declare(strict_types = 1);

namespace App\Http\Controllers\Api\Exam;


use App\Http\Controllers\APiAuthBaseController;
use App\Libs\Cache\Redis\RedisConnection;
use App\Mapping\Response\ApiCode;
use App\Mapping\Response\ApiHttpCode;
use App\Mapping\Response\ApiResponse;
use App\Services\Api\Exam\ExamService;
use App\Services\Api\Exam\SubmitHistoryService;
use Illuminate\Http\JsonResponse;

/**
 * 试题
 *
 * Class ExamController
 * @package App\Http\Controllers\Api\Exam
 */
class ExamController extends APiAuthBaseController
{
    public function __construct(ExamService $apiService)
    {
        $this->service = $apiService;
        parent::__construct($apiService);
    }

    /**
     * 试卷试题列表
     *
     * @return JsonResponse
     */
    public function index()
    {
        $items = $this->service->serviceSelectByCollection((array)$this->requestParams);

        return ApiResponse::success((array)$items);
    }

    /**
     * 提交试卷
     *
     * @return JsonResponse
     */
    public function store()
    {
        if (RedisConnection::getInstance()->setnx($this->userId, $this->userId)) {
            RedisConnection::getInstance()->expire($this->userId, 100);
            $createResult = (new SubmitHistoryService())->serviceCreate((array)$this->requestParams);

            return $createResult ? ApiResponse::success() : ApiResponse::error();
        }

        return ApiResponse::defineResponse((int)ApiCode::REPEAT_REQUEST, ApiCode::getMessage(ApiCode::REPEAT_REQUEST),
            (array)[], (int)ApiHttpCode::FORBIDDEN);
    }
}
