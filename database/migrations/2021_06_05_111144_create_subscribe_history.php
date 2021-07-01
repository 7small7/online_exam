<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class CreateSubscribeHistory extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('wechat_subscribe_history', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->uuid('uuid');
            $table->uuid('store_uuid')->comment('商户uuid');
            $table->string('touser', 100)->comment('接收者openid');
            $table->uuid('wechat_subscribe_config_uuid')->comment('微信订阅消息发送模板uuid');
            $table->string('template_id', 100)->comment('微信模板id');
            $table->string('page', 100)->nullable()->comment('跳转路径');
            $table->json('data')->comment('数据包');
            $table->string('miniprogram_state', 32)->comment('跳转小程序类型');
            $table->string('lang', 32)->comment('进入小程序查看的语言类型');
            $table->tinyInteger('send_result', false, false)->default(1)->comment('发送结果1成功|0失败');
            $table->string('send_result_message', 1000)->nullable()->comment('发送失败原因');
            $table->timestamp('send_time')->comment('消息发送时间');
            $table->tinyInteger('is_show', false, true)->default(1)->comment('是否显示1是|0否');
            $table->timestamps();
            $table->softDeletes();
        });

        $tablePrefix = env('DB_PREFIX', '');
        DB::select("alter table `{$tablePrefix}wechat_subscribe_history`  comment '微信订阅消息发送历史'");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('subscribe_history');
    }
}
