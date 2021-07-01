<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Laravel-admin name
    |--------------------------------------------------------------------------
    |
    | This value is the name of laravel-admin, This setting is displayed on the
    | login page.
    |
    */
    'name'                      => '答题系统',

    /*
    |--------------------------------------------------------------------------
    | Laravel-admin logo
    |--------------------------------------------------------------------------
    |
    | The logo of all admin pages. You can also set it as an image by using a
    | `img` tag, eg '<img src="http://logo-url" alt="Admin logo">'.
    |
    */
    'logo'                      => '<b>答题</b> 系统',

    /*
    |--------------------------------------------------------------------------
    | Laravel-admin mini logo
    |--------------------------------------------------------------------------
    |
    | The logo of all admin pages when the sidebar menu is collapsed. You can
    | also set it as an image by using a `img` tag, eg
    | '<img src="http://logo-url" alt="Admin logo">'.
    |
    */
    'logo-mini'                 => '<b>Exam</b>',

    /*
    |--------------------------------------------------------------------------
    | Laravel-admin bootstrap setting
    |--------------------------------------------------------------------------
    |
    | This value is the path of laravel-admin bootstrap file.
    |
    */
    'bootstrap'                 => app_path('Admin/bootstrap.php'),

    /*
    |--------------------------------------------------------------------------
    | Laravel-admin route settings
    |--------------------------------------------------------------------------
    |
    | The routing configuration of the admin page, including the path prefix,
    | the controller namespace, and the default middleware. If you want to
    | access through the root path, just set the prefix to empty string.
    |
    */
    'route'                     => [

        'prefix' => env('ADMIN_ROUTE_PREFIX', 'exam/admin'),

        'namespace' => 'App\\Admin\\Controllers',

        'middleware' => ['web', 'admin'],
    ],

    /*
    |--------------------------------------------------------------------------
    | Laravel-admin install directory
    |--------------------------------------------------------------------------
    |
    | The installation directory of the controller and routing configuration
    | files of the administration page. The default is `app/Admin`, which must
    | be set before running `artisan admin::install` to take effect.
    |
    */
    'directory'                 => app_path('Admin'),

    /*
    |--------------------------------------------------------------------------
    | Laravel-admin html title
    |--------------------------------------------------------------------------
    |
    | Html title for all pages.
    |
    */
    'title'                     => 'Exam',

    /*
    |--------------------------------------------------------------------------
    | Access via `https`
    |--------------------------------------------------------------------------
    |
    | If your page is going to be accessed via https, set it to `true`.
    |
    */
    'https'                     => env('ADMIN_HTTPS', false),

    /*
    |--------------------------------------------------------------------------
    | Laravel-admin auth setting
    |--------------------------------------------------------------------------
    |
    | Authentication settings for all admin pages. Include an authentication
    | guard and a user provider setting of authentication driver.
    |
    | You can specify a controller for `login` `logout` and other auth routes.
    |
    */
    'auth'                      => [

        'controller' => App\Admin\Controllers\AuthController::class,

        'guard' => 'admin',

        'guards' => [
            'admin' => [
                'driver'   => 'session',
                'provider' => 'admin',
            ],
        ],

        'providers'   => [
            'admin' => [
                'driver' => 'eloquent',
                'model'  => Encore\Admin\Auth\Database\Administrator::class,
            ],
        ],

        // Add "remember me" to login form
        'remember'    => true,

        // Redirect to the specified URI when user is not authorized.
        'redirect_to' => 'auth/login',

        // The URIs that should be excluded from authorization.
        'excepts'     => [
            'auth/login',
            'auth/logout',
        ],
    ],

    /*
    |--------------------------------------------------------------------------
    | Laravel-admin upload setting
    |--------------------------------------------------------------------------
    |
    | File system configuration for form upload files and images, including
    | disk and upload path.
    |
    */
    'upload'                    => [

        // Disk in `config/filesystem.php`.
        'disk'      => 'qiniu',

        // Image and file upload path under the disk above.
        'directory' => [
            'image' => '',
            'file'  => 'files',
        ],
    ],

    /*
    |--------------------------------------------------------------------------
    | Laravel-admin database settings
    |--------------------------------------------------------------------------
    |
    | Here are database settings for laravel-admin builtin model & tables.
    |
    */
    'database'                  => [

        // Database connection for following tables.
        'connection'             => '',

        // User tables and model.
        'users_table'            => 'admin_users',
        'users_model'            => Encore\Admin\Auth\Database\Administrator::class,

        // Role table and model.
        'roles_table'            => 'admin_roles',
        'roles_model'            => Encore\Admin\Auth\Database\Role::class,

        // Permission table and model.
        'permissions_table'      => 'admin_permissions',
        'permissions_model'      => Encore\Admin\Auth\Database\Permission::class,

        // Menu table and model.
        'menu_table'             => 'admin_menu',
        'menu_model'             => Encore\Admin\Auth\Database\Menu::class,

        // Pivot table for table above.
        'operation_log_table'    => 'admin_operation_log',
        'user_permissions_table' => 'admin_user_permissions',
        'role_users_table'       => 'admin_role_users',
        'role_permissions_table' => 'admin_role_permissions',
        'role_menu_table'        => 'admin_role_menu',
    ],

    /*
    |--------------------------------------------------------------------------
    | User operation log setting
    |--------------------------------------------------------------------------
    |
    | By setting this option to open or close operation log in laravel-admin.
    |
    */
    'operation_log'             => [

        'enable'          => true,

        /*
         * Only logging allowed methods in the list
         */
        'allowed_methods' => ['GET', 'HEAD', 'POST', 'PUT', 'DELETE', 'CONNECT', 'OPTIONS', 'TRACE', 'PATCH'],

        /*
         * Routes that will not log to database.
         *
         * All method to path like: admin/auth/logs
         * or specific method to path like: get:admin/auth/logs.
         */
        'except'          => [
            'admin/auth/logs*',
        ],
    ],

    /*
    |--------------------------------------------------------------------------
    | Indicates whether to check route permission.
    |--------------------------------------------------------------------------
    */
    'check_route_permission'    => true,

    /*
    |--------------------------------------------------------------------------
    | Indicates whether to check menu roles.
    |--------------------------------------------------------------------------
    */
    'check_menu_roles'          => true,

    /*
    |--------------------------------------------------------------------------
    | User default avatar
    |--------------------------------------------------------------------------
    |
    | Set a default avatar for newly created users.
    |
    */
    'default_avatar'            => '/vendor/laravel-admin/AdminLTE/dist/img/user2-160x160.jpg',

    /*
    |--------------------------------------------------------------------------
    | Admin map field provider
    |--------------------------------------------------------------------------
    |
    | Supported: "tencent", "google", "yandex".
    |
    */
    'map_provider'              => 'google',

    /*
    |--------------------------------------------------------------------------
    | Application Skin
    |--------------------------------------------------------------------------
    |
    | This value is the skin of admin pages.
    | @see https://adminlte.io/docs/2.4/layout
    |
    | Supported:
    |    "skin-blue", "skin-blue-light", "skin-yellow", "skin-yellow-light",
    |    "skin-green", "skin-green-light", "skin-purple", "skin-purple-light",
    |    "skin-red", "skin-red-light", "skin-black", "skin-black-light".
    |
    */
    'skin'                      => 'skin-purple',

    /*
    |--------------------------------------------------------------------------
    | Application layout
    |--------------------------------------------------------------------------
    |
    | This value is the layout of admin pages.
    | @see https://adminlte.io/docs/2.4/layout
    |
    | Supported: "fixed", "layout-boxed", "layout-top-nav", "sidebar-collapse",
    | "sidebar-mini".
    |
    */
    'layout'                    => ['fixed'],

    /*
    |--------------------------------------------------------------------------
    | Login page background image
    |--------------------------------------------------------------------------
    |
    | This value is used to set the background image of login page.
    |
    */
    'login_background_image'    => '',

    /*
    |--------------------------------------------------------------------------
    | Show version at footer
    |--------------------------------------------------------------------------
    |
    | Whether to display the version number of laravel-admin at the footer of
    | each page
    |
    */
    'show_version'              => true,

    /*
    |--------------------------------------------------------------------------
    | Show environment at footer
    |--------------------------------------------------------------------------
    |
    | Whether to display the environment at the footer of each page
    |
    */
    'show_environment'          => true,

    /*
    |--------------------------------------------------------------------------
    | Menu bind to permission
    |--------------------------------------------------------------------------
    |
    | whether enable menu bind to a permission
    */
    'menu_bind_permission'      => true,

    /*
    |--------------------------------------------------------------------------
    | Enable default breadcrumb
    |--------------------------------------------------------------------------
    |
    | Whether enable default breadcrumb for every page content.
    */
    'enable_default_breadcrumb' => true,

    /*
    |--------------------------------------------------------------------------
    | Enable/Disable assets minify
    |--------------------------------------------------------------------------
    */
    'minify_assets'             => [

        // Assets will not be minified.
        'excepts' => [

        ],

    ],

    /*
    |--------------------------------------------------------------------------
    | Enable/Disable sidebar menu search
    |--------------------------------------------------------------------------
    */
    'enable_menu_search'        => true,

    /*
    |--------------------------------------------------------------------------
    | Alert message that will displayed on top of the page.
    |--------------------------------------------------------------------------
    */
    'top_alert'                 => '',

    /*
    |--------------------------------------------------------------------------
    | The global Grid action display class.
    |--------------------------------------------------------------------------
    */
    'grid_action_class'         => \Encore\Admin\Grid\Displayers\DropdownActions::class,

    /*
    |--------------------------------------------------------------------------
    | Extension Directory
    |--------------------------------------------------------------------------
    |
    | When you use command `php artisan admin:extend` to generate extensions,
    | the extension files will be generated in this directory.
    */
    'extension_dir'             => app_path('Admin/Extensions'),

    /*
    |--------------------------------------------------------------------------
    | Settings for extensions.
    |--------------------------------------------------------------------------
    |
    | You can find all available extensions here
    | https://github.com/laravel-admin-extensions.
    |
    */
    'extensions'                => [
        // 图片灯箱效果
        'grid-lightbox' => [
            'enable' => true,
        ],
        'star-rating'   => [
            // set to false if you want to disable this extension
            'enable' => true,
            // configuration
            'config' => [
                'min' => 1, 'max' => 5, 'step' => 1, 'size' => 'xs', 'language' => 'zh',
            ]
        ],
        // 百度编辑器
        'ueditor'       => [
            // 如果要关掉这个扩展，设置为false
            'enable'         => true,
            // 编辑器的前端配置 参考：http://fex.baidu.com/ueditor/#start-config
            'config'         => [
                'initialFrameHeight' => 200, // 例如初始化高度,
                "imageWidth"         => 500, /* 上传图片宽度指定， 1.4.3官方版本无此参数，自行添加*/
                "imageeight"         => 500, /* 上传图片高度指定， 1.4.3官方版本无此参数，自行添加*/
                "imageSide"          => 1, /* 多图上传图片尺寸设置方式，0为不指定，1为按照宽度，2为按照高度，3为同时指定 1.4.3官方版本无此参数，自行添加*/
                'toolbars'           => [
                    [
                        'anchor', //锚点
                        'undo', //撤销
                        'redo', //重做
                        'bold', //加粗
                        'indent', //首行缩进
                        'snapscreen', //截图
                        'italic', //斜体
                        'underline', //下划线
                        'strikethrough', //删除线
                        'subscript', //下标
                        'fontborder', //字符边框
                        'superscript', //上标
                        'formatmatch', //格式刷
                        'source', //源代码
                        'blockquote', //引用
                        'pasteplain', //纯文本粘贴模式
                        'selectall', //全选
                        'print', //打印
                        'preview', //预览
                        'horizontal', //分隔线
                        'removeformat', //清除格式
                        'time', //时间
                        'date', //日期
                        'unlink', //取消链接
                        'insertrow', //前插入行
                        'insertcol', //前插入列
                        'mergeright', //右合并单元格
                        'mergedown', //下合并单元格
                        'deleterow', //删除行
                        'deletecol', //删除列
                        'splittorows', //拆分成行
                        'splittocols', //拆分成列
                        'splittocells', //完全拆分单元格
                        'deletecaption', //删除表格标题
                        'inserttitle', //插入标题
                        'mergecells', //合并多个单元格
                        'deletetable', //删除表格
                        'cleardoc', //清空文档
                        'insertparagraphbeforetable', //"表格前插入行"
                        'insertcode', //代码语言
                        'fontfamily', //字体
                        'fontsize', //字号
                        'paragraph', //段落格式
                        'simpleupload', //单图上传
                        'insertimage', //多图上传
                        'edittable', //表格属性
                        'edittd', //单元格属性
                        'link', //超链接
                        'emotion', //表情
                        'spechars', //特殊字符
                        'searchreplace', //查询替换
                        'map', //Baidu地图
                        'gmap', //Google地图
                        'insertvideo', //视频
                        'help', //帮助
                        'justifyleft', //居左对齐
                        'justifyright', //居右对齐
                        'justifycenter', //居中对齐
                        'justifyjustify', //两端对齐
                        'forecolor', //字体颜色
                        'backcolor', //背景色
                        'insertorderedlist', //有序列表
                        'insertunorderedlist', //无序列表
                        'fullscreen', //全屏
                        'directionalityltr', //从左向右输入
                        'directionalityrtl', //从右向左输入
                        'rowspacingtop', //段前距
                        'rowspacingbottom', //段后距
                        'pagebreak', //分页
                        'insertframe', //插入Iframe
                        'imagenone', //默认
                        'imageleft', //左浮动
                        'imageright', //右浮动
                        'attachment', //附件
                        'imagecenter', //居中
                        'wordimage', //图片转存
                        'lineheight', //行间距
                        'edittip ', //编辑提示
                        'customstyle', //自定义标题
                        'autotypeset', //自动排版
                        'webapp', //百度应用
                        'touppercase', //字母大写
                        'tolowercase', //字母小写
                        'background', //背景
                        'template', //模板
                        'scrawl', //涂鸦
                        'music', //音乐
                        'inserttable', //插入表格
                        'drafts', // 从草稿箱加载
                        'charts', // 图表
                    ]
                ]
            ],
            'imageUrlPrefix' => '/'
        ]
    ],
];
