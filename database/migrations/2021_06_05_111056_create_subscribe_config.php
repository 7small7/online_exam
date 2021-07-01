<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class CreateSubscribeConfig extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('wechat_subscribe_config', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->uuid('uuid');
            $table->uuid('store_uuid')->comment('商户uuid');
            $table->string('title', 32)->comment('配置名称');
            $table->string('template_id', 100)->comment('微信模板id')->unique();
            $table->string('page', 100)->nullable()->comment('跳转路径');
            $table->json('data')->comment('数据包');
            $table->string('miniprogram_state', 32)->comment('跳转小程序类型');
            $table->string('lang', 32)->comment('进入小程序查看的语言类型');
            $table->tinyInteger('is_show', false, true)->default(1)->comment('是否显示1是|0否');
            $table->timestamps();
            $table->softDeletes();
        });

        $tablePrefix = env('DB_PREFIX', '');
        DB::select("alter table `{$tablePrefix}wechat_subscribe_config`  comment '微信订阅消息配置表'");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('subscribe_config');
    }
}
