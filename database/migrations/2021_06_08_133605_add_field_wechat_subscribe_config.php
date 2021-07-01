<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddFieldWechatSubscribeConfig extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('wechat_subscribe_config', function (Blueprint $table) {
            $table->string('cover', 255)->comment('订阅图标');
            $table->string('description', 255)->nullable()->comment('配置说明');
            $table->integer('orders', false, false)->default(0)->comment('显示顺序');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('wechat_subscribe_config', function (Blueprint $table) {
            //
        });
    }
}
