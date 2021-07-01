<?php
declare(strict_types = 1);

namespace App\Http\Controllers\Store\Exam;

use App\Exceptions\DBException;
use App\Http\Controllers\StoreAuthBaseController;
use App\Http\Requests\Common\UUIDValidate;
use App\Http\Requests\Store\Exam\CategoryValidate;
use App\Mapping\Response\ApiResponse;
use App\Services\Store\Exam\CategoryService;
use Illuminate\Http\JsonResponse;

/**
 * 试题分类
 *
 * Class CategoryController
 * @package App\Http\Controllers\Store\Exam
 */
class CategoryController extends StoreAuthBaseController
{
    public function __construct(CategoryService $apiService)
    {
        $this->service = $apiService;
        parent::__construct($apiService);
    }

    /**
     * 分类列表
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
     * 创建分类
     *
     * @param CategoryValidate $validate
     * @return JsonResponse
     * @throws DBException
     * @author kert
     */
    public function store(CategoryValidate $validate)
    {
        $result = $this->service->serviceCreate((array)$this->requestParams);

        return $result ? ApiResponse::success() : ApiResponse::error();
    }

    /**
     * 更新分类
     *
     * @param CategoryValidate $validate
     * @return JsonResponse
     * @throws DBException
     * @author kert
     */
    public function update(CategoryValidate $validate)
    {
        $result = $this->service->serviceUpdate((array)$this->requestParams);

        return $result ? ApiResponse::success() : ApiResponse::error();
    }

    /**
     * 显示分类
     *
     * @param UUIDValidate $UUIDValidate
     * @return JsonResponse
     * @author kert
     */
    public function show(UUIDValidate $UUIDValidate)
    {
        $result = $this->service->serviceFind((array)$this->requestParams);

        return $result ? ApiResponse::success() : ApiResponse::error();
    }

    /**
     * 删除分类
     *
     * @param UUIDValidate $UUIDValidate
     * @return JsonResponse
     * @throws DBException
     * @author kert
     */
    public function destroy(UUIDValidate $UUIDValidate)
    {
        $result = $this->service->serviceDelete((array)$this->requestParams);

        return $result ? ApiResponse::success() : ApiResponse::error();
    }
}
