<?php

namespace App\Admin\Actions\Exam;

use Encore\Admin\Actions\RowAction;

class CollectionExam extends RowAction
{
    public $name = '查看试题';


    public function href()
    {
        return 'collection/exam?collection_id=' . $this->getKey();
    }
}
