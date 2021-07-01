<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Default Filesystem Disk
    |--------------------------------------------------------------------------
    |
    | Here you may specify the default filesystem disk that should be used
    | by the framework. The "local" disk, as well as a variety of cloud
    | based disks are available to your application. Just store away!
    |
    */

    'default' => env('FILESYSTEM_DRIVER', 'local'),

    /*
    |--------------------------------------------------------------------------
    | Default Cloud Filesystem Disk
    |--------------------------------------------------------------------------
    |
    | Many applications store files both locally and in the cloud. For this
    | reason, you may specify a default "cloud" driver here. This driver
    | will be bound as the Cloud disk implementation in the container.
    |
    */

    'cloud' => env('FILESYSTEM_CLOUD', 's3'),

    /*
    |--------------------------------------------------------------------------
    | Filesystem Disks
    |--------------------------------------------------------------------------
    |
    | Here you may configure as many filesystem "disks" as you wish, and you
    | may even configure multiple disks of the same driver. Defaults have
    | been setup for each driver as an example of the required options.
    |
    | Supported Drivers: "local", "ftp", "sftp", "s3"
    |
    */

    'disks' => [

        'local' => [
            'driver' => 'local',
            'root'   => storage_path('app'),
        ],

        'public' => [
            'driver'     => 'local',
            'root'       => storage_path('app/public'),
            'url'        => env('APP_URL') . '/storage',
            'visibility' => 'public',
        ],

        's3'    => [
            'driver'   => 's3',
            'key'      => env('AWS_ACCESS_KEY_ID'),
            'secret'   => env('AWS_SECRET_ACCESS_KEY'),
            'region'   => env('AWS_DEFAULT_REGION'),
            'bucket'   => env('AWS_BUCKET'),
            'url'      => env('AWS_URL'),
            'endpoint' => env('AWS_ENDPOINT'),
        ],
        //laravel-admin文件上传配置
        'admin' => [
            'driver'     => 'local',
            'root'       => public_path('upload'),
            'visibility' => 'public',
            'url'        => env('APP_URL') . '/upload/',
        ],
        //七牛云文件上传配置
        'qiniu' => [
            'driver'     => 'qiniu',
            'domains'    => [
                'default' => env('QINIU_URI'), //你的七牛域名
                'https'   => 'dn-yourdomain.qbox.me',         //你的HTTPS域名
                'custom'  => env('QINIU_URI'),                //你的自定义域名
            ],
            'access_key' => env('QINIU_ACCESSS_KEY'),  //AccessKey
            'secret_key' => env('QINIU_SECRET_KEY'),  //SecretKey
            'bucket'     => env('QINIU_BUCKET'),  //Bucket名字
            'notify_url' => '',  //持久化处理回调地址
            'url'        => env('QINIU_URI'),  // 填写文件访问根url
        ],

    ],

];
