<?php
declare(strict_types = 1);

namespace App\Http\Controllers\Store\Platform;

use App\Http\Controllers\StoreAuthBaseController;
use App\Http\Requests\Common\UUIDValidate;
use App\Http\Requests\Store\Platform\SettingValidate;
use App\Mapping\Response\ApiResponse;
use App\Services\Store\Platform\SettingService;
use Illuminate\Http\JsonResponse;

/**
 * 平台配置
 *
 * Class SettingController
 * @package App\Http\Controllers\Store\Store
 */
class SettingController extends StoreAuthBaseController
{
    public function __construct(SettingService $apiService)
    {
        $this->service = $apiService;
        parent::__construct($apiService);
    }

    /**
     * 平台设置列表
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
     * 创建平台设置
     *
     * @param SettingValidate $settingValidate
     * @return JsonResponse
     * @author kert
     */
    public function store(SettingValidate $settingValidate)
    {
        $result = $this->service->serviceCreate((array)$this->requestParams);

        return $result ? ApiResponse::success() : ApiResponse::error();
    }

    /**
     * 更新平台设置
     *
     * @param SettingValidate $settingValidate
     * @return JsonResponse
     * @author kert
     */
    public function update(SettingValidate $settingValidate)
    {
        $result = $this->service->serviceUpdate((array)$this->requestParams);

        return $result ? ApiResponse::success() : ApiResponse::error();
    }

    /**
     * 显示平台设置
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
     * 查询平台设置
     *
     * @param UUIDValidate $UUIDValidate
     * @return JsonResponse
     * @author kert
     */
    public function destroy(UUIDValidate $UUIDValidate)
    {
        $result = $this->service->serviceDelete((array)$this->requestParams);

        return $result ? ApiResponse::success() : ApiResponse::error();
    }
}
