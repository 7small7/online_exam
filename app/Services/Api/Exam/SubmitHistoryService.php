<?php


namespace App\Services\Api\Exam;


use App\Libs\UUID;
use App\Repository\Api\Exam\SubmitHistoryRepository;
use App\Services\Api\ApiServiceInterface;

/**
 * 试卷提交记录
 *
 * Class SubmitHistoryService
 * @package App\Services\Api\Exam
 */
class SubmitHistoryService implements ApiServiceInterface
{
    private $submitRepository;

    public function __construct()
    {
        $this->submitRepository = new SubmitHistoryRepository;
    }

    /**
     * 格式化查询条件
     *
     * @param array $requestParams 请求参数
     * @return mixed 组装的查询条件
     */
    public static function searchWhere(array $requestParams)
    {
        return function ($query) use ($requestParams) {
            extract($requestParams);
            if (!empty($user_id)) {
                $query->where('wechat_user_uuid', '=', $user_id);
            }
        };
    }

    /**
     * 查询数据
     *
     * @param array $requestParams 请求参数
     * @return array 查询结果
     */
    public function serviceSelect(array $requestParams): array
    {
        $perSize = $requestParams['size'] ?? 20;

        return $this->submitRepository->repositorySelect(self::searchWhere((array)$requestParams), (int)$perSize);
    }

    /**
     * 查询答题列表
     *
     * @param array $requestParams
     * @return array
     * @author kert
     */
    public function serviceExamSelect(array $requestParams): array
    {
        $perSize = $requestParams['size'] ?? 20;

        return $this->submitRepository->repositoryExamSelect(function ($query) use ($requestParams) {
            extract($requestParams);
            if (!empty($user_id)) {
                $query->where('wechat_user_uuid', '=', $user_id);
            }
            if (!empty($exam_collection_uuid)) {
                $query->where('exam_collection_uuid', '=', $exam_collection_uuid);
            }
        }, (int)$perSize);
    }

    /**
     * 创建数据
     *
     * @param array $requestParams 请求参数
     * @return boolean true|false
     */
    public function serviceCreate(array $requestParams): bool
    {
        $requestParams = $this->formatter((array)$requestParams);
        if (!empty($requestParams)) {

            return $this->submitRepository->repositoryCreate((array)$requestParams);
        }

        return true;
    }

    /**
     * 更新数据
     *
     * @param array $requestParams 请求参数
     * @return int 更新行数
     */
    public function serviceUpdate(array $requestParams): int
    {
        // TODO: Implement serviceUpdate() method.
    }

    /**
     * 删除数据
     *
     * @param array $requestParams 请求参数
     * @return int 删除行数
     */
    public function serviceDelete(array $requestParams): int
    {
        // TODO: Implement serviceDelete() method.
    }

    /**
     * 查询用户答卷下面对应的试题
     *
     * @param array $requestParams 请求参数
     * @return array 删除行数
     */
    public function serviceFind(array $requestParams): array
    {

    }

    private function formatter(array $requestParams): array
    {
        $collectionInfo = (new CollectionService())->serviceFind((array)['uuid' => $requestParams['id']]);
        // 试卷设置时长
        $collectionTime = explode(':', $collectionInfo['exam_time']);
        $seconds = $collectionTime[0] * 3600 + $collectionTime[1] * 60 + $collectionTime[2];
        // 用户答题剩余时长
        $userSeconds = $requestParams['cutDownTime']['minutes'] * 60 + $requestParams['cutDownTime']['seconds'];
        // 用户答题时长
        $secondsDiffer = $seconds - $userSeconds;
        $i = 0;
        $data = [];
        // 用户答题记录
        $selectExam = $requestParams['select'];
        $selectIdArray = array_column($selectExam, 'id');
        $items = (new ExamService())->serviceSelectAll((array)$selectIdArray);
        // 转换数据格式
        $examArray = [];
        foreach ($items as $value) {
            $examArray[$value['uuid']] = $value['answer_income_score'];
        }

        // 处理数据格式
        foreach ($selectExam as $key => $value) {
            if (!empty($value['id'])) {
                $data[$i] = [
                    'uuid' => UUID::getUUID(),
                    'wechat_user_uuid' => $requestParams['user_id'],
                    'exam_collection_uuid' => $requestParams['id'],
                    'exam_item_uuid' => $value['id'],
                    'success_number' => $value['answer'] == $value['select'] ? 1 : 0,
                    'error_number' => $value['answer'] != $value['select'] ? 1 : 0,
                    'score' => $value['answer'] == $value['select'] ? $examArray[$value['id']] : 0.00,
                    'submit_time' => gmstrftime('%H:%M:%S', $secondsDiffer),
                    'answer' => $value['answer'],
                    'select_answer' => $value['select'],
                ];
                ++$i;
            }
        }

        return $data;
    }
}
