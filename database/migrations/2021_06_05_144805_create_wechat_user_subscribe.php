<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class CreateWechatUserSubscribe extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('wechat_user_subscribe', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->uuid('uuid');
            $table->uuid('store_uuid')->comment('商户uuid');
            $table->uuid('wechat_user_uuid')->comment('微信用户uuid');
            $table->string('template_id', 100)->comment('微信模板id');
            $table->tinyInteger('is_used', false, false)->default(1)->comment('可用状态1可用|0不可用');
            $table->tinyInteger('is_show', false, true)->default(1)->comment('是否显示1是|0否');
            $table->timestamps();
            $table->softDeletes();
        });

        $tablePrefix = env('DB_PREFIX', '');
        DB::select("alter table `{$tablePrefix}wechat_user_subscribe`  comment '微信用户消息订阅记录'");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('wechat_user_subscribe');
    }
}
