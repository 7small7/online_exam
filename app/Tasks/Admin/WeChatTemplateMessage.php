<?php
declare(strict_types = 1);

namespace App\Tasks\Admin;

use App\Libs\WeChat\WeChat;
use App\Mapping\Config\ScoreKey;
use App\Models\Common\WeChatSubscribeConfig;
use App\Services\Api\Platform\ScoreSettingService;
use App\Services\Api\User\WeChatUserSubscribeService;
use GuzzleHttp\Client;
use GuzzleHttp\Psr7\Request;

/**
 * 微信模板消息
 *
 * Class WeChatTemplateMessage
 * @package App\Tasks\Admin
 */
class WeChatTemplateMessage
{
    // 试题更新消息提醒
    public function sendExamUpdateMessage()
    {
        /** @var string $templateId 微信模板消息template_id */
        $templateId = '6MgOV69Ny-BltjQ_-EXrT3M-0V90dmtFxjmqZlDnA5Y';
        $accessToken = (new WeChat())->getAccessToken();

        $bean = WeChatSubscribeConfig::query()->where('template_id', $templateId)
            ->first(['title', 'template_id', 'page', 'data', 'miniprogram_state', 'lang'])->toArray();

        $client = new Client();
        $data = [
            'date1' => ['value' => date('Y') . '年' . date('m') . '月' . date('d') . '日'],
            'thing2' => ['value' => 'PHP面试真题'],
            'thing5' => ['value' => '您订阅的PHP试题库更新了!'],
        ];
        $request = new Request('POST', "https://api.weixin.qq.com/cgi-bin/message/subscribe/send?access_token={$accessToken}", [], json_encode([
            'access_token' => "$accessToken",
            'touser' => 'odJ2P4h7xJ-mhBE1_uYNh77Wj2Rw',
            'template_id' => $templateId,
            'data' => $data,
            'page' => $bean['page'],
            'miniprogram_state' => $bean['miniprogram_state'],
            'lang' => $bean['lang'],
        ], JSON_UNESCAPED_UNICODE));

        $promise = $client->sendAsync($request)->then(function ($response) {
            var_dump('请求结果', $response->getBody()->getContents());
        });
        echo 111;
        $promise->wait();
    }

    // 每日签到提醒
    public function sendSignMessage()
    {
        /** @var string $templateId 微信模板消息template_id */
        $templateId = 'nkehEBGYZ6RDp_V0kWnxXHv5r2v8ZjqdQN9ueIZ17H8';
        $historyService = new WeChatUserSubscribeService();
        // 查询签到配置积分
        $scoreCofig = (new ScoreSettingService())->serviceFind((array)['key' => ScoreKey::SIGN]);
        // 查询查询签到用户订阅历史
        $items = $historyService->serviceListByTemplateId((string)$templateId);

        $bean = WeChatSubscribeConfig::query()->where('template_id', $templateId)
            ->first(['title', 'template_id', 'page', 'data', 'miniprogram_state', 'lang'])->toArray();
        dump('消息列表', $items);
        $client = new Client();
        /** @var array $updateIdArray 订阅历史uuid */
        $updateIdArray = [];
        foreach ($items as $value) {
            $accessToken = (new WeChat())->getAccessToken();
            $data = [
                'thing9' => ['value' => '签到提示'],
                'time14' => ['value' => date('Y年m月d日')],
                'thing7' => ['value' => '今日你还未签到'],
                'thing10' => ['value' => '你将获取' . $scoreCofig['score'] . '积分'],
                'number6' => ['value' => 1],
            ];
            $request = new Request('POST', "https://api.weixin.qq.com/cgi-bin/message/subscribe/send?access_token={$accessToken}", [], json_encode([
                'access_token' => "$accessToken",
                'touser' => $value['user']['openid'],
                'template_id' => $templateId,
                'data' => $data,
                'page' => $bean['page'],
                'miniprogram_state' => $bean['miniprogram_state'],
                'lang' => $bean['lang'],
            ], JSON_UNESCAPED_UNICODE));

            $promise = $client->sendAsync($request)->then(function ($response) {
                var_dump('请求结果', $response->getBody()->getContents());
            });
            array_push($updateIdArray, $value['uuid']);
        }
        if (!empty($items)) {
            $promise->wait();
            $updateResult = $historyService->serviceBatchUpdate((array)$updateIdArray, (array)['is_used' => 0], (string)'uuid');
            var_dump('修改成功', $updateIdArray);
        }
    }
}
