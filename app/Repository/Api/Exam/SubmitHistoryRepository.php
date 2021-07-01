<?php


namespace App\Repository\Api\Exam;


use App\Models\Api\Exam\SubmitHistory;
use App\Repository\Api\ApiRepositoryInterface;
use Illuminate\Support\Facades\DB;

/**
 * 试卷答题记录
 *
 * Class SubmitHistoryRepository
 * @package App\Repository\Api\Exam
 */
class SubmitHistoryRepository implements ApiRepositoryInterface
{
    private $submitModel;

    public function __construct()
    {
        $this->submitModel = new SubmitHistory;
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
        $items = $this->submitModel::query()->where($closure)
            ->with(['collection:uuid,title,cover'])
            ->select(['exam_collection_uuid', 'success_number', 'error_number', 'score', 'submit_time'])
            ->groupBy(['exam_collection_uuid'])
            ->paginate($perSize);

        return [
            'items' => $items->items(),
            'total' => $items->total(),
            'page'  => $items->currentPage(),
            'size'  => $items->perPage(),
        ];
    }

    /**
     * 查询答题列表
     *
     * @param \Closure $closure
     * @param int $perSize
     * @return array
     * @author kert
     */
    public function repositoryExamSelect(\Closure $closure, int $perSize): array
    {
        $items = $this->submitModel::query()->with(['exam:uuid,title,options,cover,answer,analysis,tips'])
            ->where($closure)
            ->select(['uuid', 'exam_item_uuid', 'exam_collection_uuid', 'answer'])
            ->paginate($perSize);

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
     * @return boolean true|false
     */
    public function repositoryCreate(array $insertInfo): bool
    {
        $result = false;
        DB::transaction(function () use ($insertInfo, &$result) {
            // 删除之前的答题记录
            $this->submitModel::query()->where([
                ['wechat_user_uuid', '=', $insertInfo[0]['wechat_user_uuid']],
                ['exam_collection_uuid', '=', $insertInfo[0]['exam_collection_uuid']],
            ])->delete();
            $this->submitModel->batchAll((string)$this->submitModel->getTable(), (array)$insertInfo);

            // 增加对应答题数量
            (new CollectionRepository())->incrByColumn((array)['uuid' => $insertInfo[0]['exam_collection_uuid']], ['submit_number']);

            $result = true;
        });

        return $result;
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
     * 查询用户答卷下面对应的试题
     *
     * @param \Closure $closure
     * @return array
     */
    public function repositoryFind(\Closure $closure): array
    {

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
        // TODO: Implement repositoryUpdate() method.
    }

    /**
     * 删除数据
     *
     * @param array $deleteWhere 删除条件
     * @return int 删除行数
     */
    public function repositoryDelete(array $deleteWhere): int
    {
        // TODO: Implement repositoryDelete() method.
    }
}
