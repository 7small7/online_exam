<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class CreatePlatformMessageHistory extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('platform_message_history', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->uuid('uuid');
            $table->uuid('platform_message_category_uuid')->comment('消息类型id');
            $table->uuid('platform_message_content_uuid')->comment('消息id');
            $table->uuid('wechat_user_uuid')->comment('用户id');
            $table->tinyInteger('is_show', false, true)->default(1)->comment('是否显示1是|0否');
            $table->timestamps();
            $table->softDeletes();

            $table->unique(['platform_message_content_uuid', 'wechat_user_uuid'], 'idx_user_content');
        });
        $tablePrefix = env('DB_PREFIX', '');
        DB::select("alter table `{$tablePrefix}platform_message_history`  comment '消息阅读历史'");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('platform_message_history');
    }
}
