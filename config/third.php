<?php
/**
 * 第三方平台的配置信息
 */
return [
    // 七牛云配置
    'qiniu'  => [
        'key'       => env('QINIU_ACCESSS_KEY'),
        'secret'    => env('QINIU_SECRET_KEY'),
        'bucket'    => env('QINIU_BUCKET'),
        'domain'    => env('QINIU_URI'),
        'agreement' => env('QINIU_AGREEMENT'),
    ],
    // 微信小程序
    'wechat' => [
        'key'    => env('WX_APPID'),
        'secret' => env('WX_SECRET'),
    ],
];
