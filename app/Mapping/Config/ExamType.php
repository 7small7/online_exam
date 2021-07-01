<?php
declare(strict_types=1);

namespace App\Mapping\Config;

/**
 * 试题类型
 *
 * Class ExamType
 * @package App\Mapping\Config
 */
class ExamType
{
    // 选择题
    CONST OPTIONS = 'options';

    // 判断题
    CONST JUDGE = 'judge';

    // 填空题
    CONST FILL_BLANK = 'fill_blan';

    // 阅读理解
    CONST READING = 'reading';
}
