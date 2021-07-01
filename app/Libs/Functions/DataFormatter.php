<?php


namespace App\Libs\Functions;

/**
 * 数据格式处理库
 *
 * Class DataFormatter
 * @package App\Libs\Functions
 */
class DataFormatter
{
    /**
     * 递归数据
     *
     * @param array $info
     * @param string $pid
     * @return array
     */
    public static function recursionData(array $info, $pid = ''): array
    {
        $tree = array ();
        foreach ($info as $value) {
            if ($value['parent_uuid'] == $pid) {
                $value['children'] = self::recursionData((array)$info, (string)$value['uuid']);
                if ($value['children'] == null) {
                    unset($value['children']);
                }
                $tree[] = $value;
            }
        }

        return $tree;
    }

    /**
     * 将日期格式化为今天、昨天、两天前、三天前的格式
     *
     * @param string $startDate
     * @param string|null $endDate
     * @return string
     */
    public static function formatterDate(string $startDate, string $endDate = null): string
    {
        $endDate = empty($endDate) ? date('Y-m-d') : $endDate;

        $startTimeStamp = strtotime($startDate);
        $endTimeStamp = strtotime($endDate);

        if ($startTimeStamp == $endTimeStamp) {
            return '今天';
        } elseif (($endTimeStamp - $startTimeStamp) / 86400 == 1) {
            return '昨天';
        } elseif (($endTimeStamp - $startTimeStamp) / 86400 == 2) {
            return '两天前';
        } elseif (($endTimeStamp - $startTimeStamp) / 86400 == 3) {
            return '三天前';
        } else {
            return '四天前';
        }
    }
}
