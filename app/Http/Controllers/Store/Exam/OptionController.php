<?php
declare(strict_types = 1);

namespace App\Http\Controllers\Store\Exam;

use App\Exceptions\DBException;
use App\Http\Controllers\StoreAuthBaseController;
use App\Http\Requests\Common\UUIDValidate;
use App\Http\Requests\Store\Exam\OptionValidate;
use App\Mapping\Response\ApiResponse;
use App\Services\Store\Exam\OptionService;
use Illuminate\Http\JsonResponse;

/**
 * 单选题
 *
 * Class CollectionController
 * @package App\Http\Controllers\Store\Exam
 */
class OptionController extends StoreAuthBaseController
{
    public function __construct(OptionService $apiService)
    {
        $this->service = $apiService;
        parent::__construct($apiService);
    }

    /**
     * 单选题列表
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
     * 创建单选题
     *
     * @param OptionValidate $validate
     * @return JsonResponse
     * @throws DBException
     * @author kert
     */
    public function store(OptionValidate $validate)
    {
        $result = $this->service->serviceCreate((array)$this->requestParams);

        return $result ? ApiResponse::success() : ApiResponse::error();
    }

    /**
     * 更新单选题
     *
     * @param OptionValidate $validate
     * @return JsonResponse
     * @throws DBException
     * @author kert
     */
    public function update(OptionValidate $validate)
    {
        $result = $this->service->serviceUpdate((array)$this->requestParams);

        return $result ? ApiResponse::success() : ApiResponse::error();
    }

    /**
     * 显示单选题
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
     * 查询单选题
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
