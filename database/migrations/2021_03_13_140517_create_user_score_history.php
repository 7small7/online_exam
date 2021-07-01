<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class CreateUserScoreHistory extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('user_score_history', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->uuid('uuid');
            $table->tinyInteger('type', false, true)->comment('积分类型1增加|2减少');
            $table->string('key', 32)->comment('类型key');
            $table->decimal('score', 5, 2)->comment('积分');
            $table->uuid('wechat_user_uuid')->comment('用户uuid');
            $table->tinyInteger('is_show', false, true)->default(1)->comment('是否显示1是|0否');
            $table->timestamps();
            $table->softDeletes();
        });

        $tablePrefix = env('DB_PREFIX', '');
        DB::select("alter table `{$tablePrefix}user_score_history`  comment '用户积分历史'");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('user_score_history');
    }
}
