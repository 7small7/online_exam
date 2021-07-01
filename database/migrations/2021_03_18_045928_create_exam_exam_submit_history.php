<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class CreateExamExamSubmitHistory extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('exam_submit_history', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->uuid('uuid');
            $table->uuid('wechat_user_uuid')->comment('用户uuid');
            $table->uuid('exam_collection_uuid')->comment('试卷uuid');
            $table->uuid('exam_item_uuid')->comment('试题uuid');
            $table->string('answer', 32)->comment('答案');
            $table->tinyInteger('success_number', false, true)->default(0)->comment('正确题数');
            $table->tinyInteger('error_number', false, true)->default(0)->comment('错误题数');
            $table->decimal('score', 6, 2)->default(0.00)->comment('最终得分');
            $table->time('submit_time')->nullable()->comment('答题时间');
            $table->tinyInteger('is_show', false, true)->default(1)->comment('是否显示1是|0否');
            $table->timestamps();
            $table->softDeletes();
        });

        $tablePrefix = env('DB_PREFIX', '');
        DB::select("alter table `{$tablePrefix}exam_exam_submit_history`  comment '用户签到历史'");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('exam_exam_submit_history');
    }
}
