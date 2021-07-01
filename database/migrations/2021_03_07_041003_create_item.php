<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

/**
 * 试卷
 *
 * Class CreateItem
 */
class CreateItem extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('exam_option', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->uuid('uuid');
            $table->string('title', 32)->comment('试题名称');
            $table->string('cover', 1000)->nullable()->comment('试题图片');
            $table->json('answer')->comment('试题答案,根据选项中的option_title取值');
            $table->text('analysis')->nullable()->comment('试题解析');
            $table->text('tips')->nullable()->comment('试题提示');
            $table->decimal('tips_expend_score', 6, 2)->nullable()->default(0.00)->comment('查看提示消耗的积分');
            $table->decimal('answer_expend_score', 6, 2)->nullable()->default(0.00)->comment('查看答案消耗的积分');
            $table->decimal('tips_income_score', 6, 2)->nullable()->default(0.00)->comment('查看提示奖励的积分');
            $table->decimal('answer_income_score', 6, 2)->nullable()->default(0.00)->comment('查看答案奖励的积分');
            $table->json('option')->comment('试题选项');
            $table->tinyInteger('is_show', false, true)->default(1)->comment('是否显示1是|2否');
            $table->timestamps();
            $table->softDeletes();
        });
        $tablePrefix = env('DB_PREFIX', '');
        DB::select("alter table `{$tablePrefix}exam_item`  comment '试题信息'");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('item');
    }
}
