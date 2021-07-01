<?php
declare(strict_types = 1);

namespace App\Http\Controllers\Store\Exam;

use App\Exceptions\DBException;
use App\Http\Controllers\StoreAuthBaseController;
use App\Http\Requests\Common\UUIDValidate;
use App\Http\Requests\Store\Exam\TagValidate;
use App\Mapping\Response\ApiResponse;
use App\Services\Store\Exam\TagService;
use Illuminate\Http\JsonResponse;

/**
 * 知识点
 *
 * Class TagController
 * @package App\Http\Controllers\Store\Exam
 */
class TagController extends StoreAuthBaseController
{
    public function __construct(TagService $apiService)
    {
        $this->service = $apiService;
        parent::__construct($apiService);
    }

    /**
     * 知识点列表
     *
     * @return JsonResponse
     * @author kert
     */
    public function index()
    {
        $items = $this->service->serviceSelect((array)$this->requestParams);

        return ApiResponse::success((array)$items);
    }

    /**
     * 创建知识点
     *
     * @param TagValidate $tagValidate
     * @return JsonResponse
     * @throws DBException
     * @author kert
     */
    public function store(TagValidate $tagValidate)
    {
        $result = $this->service->serviceCreate((array)$this->requestParams);

        return $result ? ApiResponse::success() : ApiResponse::error();
    }

    /**
     * 更新知识点
     *
     * @param TagValidate $tagValidate
     * @return JsonResponse
     * @author kert
     */
    public function update(TagValidate $tagValidate)
    {
        $result = $this->service->serviceUpdate((array)$this->requestParams);

        return $result ? ApiResponse::success() : ApiResponse::error();
    }

    /**
     * 显示知识点
     *
     * @return JsonResponse
     * @author kert
     */
    public function show(UUIDValidate $UUIDValidate)
    {
        $result = $this->service->serviceFind((array)$this->requestParams);

        return $result ? ApiResponse::success() : ApiResponse::error();
    }

    /**
     * 查询知识点
     *
     * @return JsonResponse
     * @author kert
     */
    public function destroy(UUIDValidate $UUIDValidate)
    {
        $result = $this->service->serviceDelete((array)$this->requestParams);

        return $result ? ApiResponse::success() : ApiResponse::error();
    }
}
