---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - Java

includes:
  - errors

search: true
---

# 介绍

百应API开放，详细接口文档。

# 认证方式</aside>
联系百应同学开通isv账号(appkey)，并建立测试企业。

# company

## 获取公司列表

```Java
String baseUrl = "http://api.byrobot.cn";
String url = baseUrl + "/openapi/v1/company/getCompanys";
String result = IndataHttpUtils.sendGet(url, "AppKey", "AppSecret");
System.out.print(result);
```

> 返回结果示例:

```json
{
    "code": 200,
    "data": [
        {
            "companyName": "公司名称", // 公司名称
            "companyId": 1 // 公司id
        }
    ],
    "resultMsg": "获取成功",
    "errorStackTrace": null
}
```

获取可以管理的所有企业列表

### HTTP Request

`GET /openapi/v1/company/getCompanys`

## 获取公司的主叫电话

```Java
String baseUrl = "http://api.byrobot.cn";
String url = baseUrl + "/openapi/v1/company/getPhones?companyId=1";
String result = IndataHttpUtils.sendGet(url, "AppKey", "AppSecret");
System.out.print(result);
```

> 返回结果示例:

```json
{
    "code": 200,
    "data": [
        {
            "userPhoneId": 0, // 电话id
            "phone": "17706423289", // 电话号码
            "phoneName": "可用卡1", // 电话号码名称
            "phoneType": 0, // 电话卡类型 0:机器人手机卡 1:人工坐席手机卡
            "available": false // 是否可用
        },
        {
            "userPhoneId": 13,
            "phone": "18072749353",
            "phoneName": "可用卡2",
            "phoneType": 0,
            "available": true
        },
        {
            "userPhoneId": 31,
            "phone": "15868457106",
            "phoneName": "不可用卡1",
            "phoneType": 1,
            "available": false
        }
    ],
    "resultMsg": "获取成功",
    "errorStackTrace": null
}
```

获取可以管理的某一个企业下的可用的主叫电话



### HTTP Request

`GET /openapi/v1/company/getPhones`

### 请求参数:

字段 | 类型 | 描述
--------- | ----------- | -----------
companyId | Integer | 公司id

## 获取公司的机器人

```Java
String baseUrl = "http://api.byrobot.cn";
String url = baseUrl + "/openapi/v1/company/getRobots?companyId=1";
String result = IndataHttpUtils.sendGet(url, "AppKey", "AppSecret");
System.out.print(result);
```

> 返回结果示例:

```json
{
    "code": 200,
    "data": [
        {
            "robotDefId": 6, // 机器人id
            "robotName": "产品电销_废弃_勿用", // 机器人名称
            "sceneDefId": 11, // 场景id
            "sceneRecords": [
                {
                    "sceneRecordId": 25, // 录音id
                    "sceneRecordName": "房产电销女声版(佑琪)" //录音名称
                },
                {
                    "sceneRecordId": 24,
                    "sceneRecordName": "房产电销女声版(凯萍)"
                },
                {
                    "sceneRecordId": 21,
                    "sceneRecordName": "房产电销优化版(精品录音)"
                },
                {
                    "sceneRecordId": 2,
                    "sceneRecordName": "房产电销优化版(丸子)"
                },
                {
                    "sceneRecordId": 1,
                    "sceneRecordName": "房产电销优化版(张飞)"
                }
            ]
        },
        {
            "robotDefId": 11,
            "robotName": "金融销售机器人_默认",
            "sceneDefId": 24,
            "sceneRecords": [
                {
                    "sceneRecordId": 20,
                    "sceneRecordName": "金融销售默认话术"
                }
            ]
        },
        {
            "robotDefId": 12,
            "robotName": "房产竞标机器人",
            "sceneDefId": 31,
            "sceneRecords": [
                {
                    "sceneRecordId": 31,
                    "sceneRecordName": "房产竞标话术@20171223_23_49_57"
                }
            ]
        }
    ],
    "resultMsg": "获取成功",
    "errorStackTrace": null
}
```

获取可以管理的某一个企业下的机器人列表

### HTTP Request

`GET /openapi/v1/company/getRobots`

### 请求参数:

字段 | 类型 | 描述
--------- | ----------- | -----------
companyId | Integer | 公司id



