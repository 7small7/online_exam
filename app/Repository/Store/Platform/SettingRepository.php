<?php
declare(strict_types=1);

namespace App\Repository\Store\Platform;


use App\Models\Store\Platform\Setting;
use App\Repository\Store\StoreRepositoryInterface;

/**
 * 平台设置
 *
 * Class SettingRepository
 * @package App\Repository\Store\Platform
 */
class SettingRepository implements StoreRepositoryInterface
{
    private $settingModel;

    public function __construct()
    {
        $this->settingModel = new Setting;
    }

    /**
     * 查询数据
     *
     * @param \Closure $closure
     * @param int $perSize 分页大小
     * @return array
     */
    public function repositorySelect(\Closure $closure, int $perSize): array
    {
        $items = $this->settingModel::query()->where($closure)->select($this->settingModel->searchFields)->paginate($perSize);

        return [
            'items' => $items->items(),
            'total' => $items->total(),
            'page'  => $items->currentPage(),
            'size'  => $items->perPage(),
        ];
    }

    /**
     * 创建数据
     *
     * @param array $insertInfo 创建信息
     * @return array 插入的数据记录
     */
    public function repositoryCreate(array $insertInfo): array
    {
        $newSettingModel = $this->settingModel::query()->create($insertInfo);

        return !empty($newSettingModel) ? $newSettingModel->toArray() : [];
    }

    /**
     * 添加数据
     *
     * @param array $addInfo 添加信息
     * @return int 添加之后的ID或者行数
     */
    public function repositoryAdd(array $addInfo): int
    {
        // TODO: Implement repositoryAdd() method.
    }

    /**
     * 单条数据查询
     *
     * @param \Closure $closure
     * @return array
     */
    public function repositoryFind(\Closure $closure): array
    {
        $bean = $this->settingModel::query()->where($closure)->first($this->settingModel->searchFields);

        return !empty($bean) ? $bean->toArray() : [];
    }

    /**
     * 更新数据
     *
     * @param array $updateWhere 修改条件
     * @param array $updateInfo 修改信息
     * @return int 更新行数
     */
    public function repositoryUpdate(array $updateWhere, array $updateInfo): int
    {
        $updateInfo = $this->settingModel->updateIgnoreFields((array)$updateInfo);

        return $this->settingModel::query()->where($updateWhere)->update($updateInfo);
    }

    /**
     * 删除数据
     *
     * @param array $deleteWhere 删除条件
     * @return int 删除行数
     */
    public function repositoryDelete(array $deleteWhere): int
    {
        $uuid         = json_decode($deleteWhere['uuid'], true);
        $deleteResult = $this->settingModel::query()
            ->where([['store_uuid', '=', $deleteWhere['store_uuid']]])
            ->whereIn('uuid', $uuid)
            ->delete();

        return !empty($deleteResult) ? $deleteResult : 0;
    }
}
