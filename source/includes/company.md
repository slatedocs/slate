# 公司信息

##获取公司列表

###功能说明：

通过此接口可以获取用户所有的公司信息

>JSON响应实例：

```
{
    "code": 200,
    "data": [
        {
            "companyName": "阿里巴巴", 
            "companyId": 1 
        },
        {
            "companyName": "网易", 
            "companyId": 2
        }
    ],
    "resultMsg": "获取成功",
    "errorStackTrace": null
}

```

###请求：

URL：http://api.byrobot.cn/openapi/v1/company/getCompanys

###访问方式：

GET


###请求参数:

无



###响应：

参数名 | 类型 | 描述 
--------- | ------- |------
 code|integer | 响应码 |
 data| object | 返回实体 |
 companyName|String | 公司名称 |
 companyId| integer | 公司Id |
 resultMsg| String | 响应说明 |
 errorStackTrace| String | 接口异常说明 |


##获取公司的主叫电话列表

###功能说明：

通过接口可以获取指定公司的所有主叫电话的列表


>JSON响应实例：

```
{
    "code": 200,
    "data": [
        {
            "userPhoneId": 0, 
            "phone": "17706423289", 
            "phoneName": "可用卡1", 
            "phoneType": 0, 
            "available": false, 
            "totalConcurrencyQuota" : 1, 
            "usedConcurrencyQuota" : 1 
        },
        {
            "userPhoneId": 13,
            "phone": "18072749353",
            "phoneName": "可用卡2",
            "phoneType": 0,
            "available": true,
            "totalConcurrencyQuota" : 1, 
            "usedConcurrencyQuota" : 0 
        }
    ],
    "resultMsg": "获取成功",
    "errorStackTrace": null
}

```

###请求：

URL：http://api.byrobot.cn/openapi/v1/company/getPhones

###访问方式：

GET


###请求参数:

参数名 | 类型 | 是否必须 | 描述 | 实例 
--------- | ------- |------- | ------ |------
 companyId| Integer| 是 | 公司Id| 1 |



###响应：

参数名 | 类型 | 描述 
--------- | ------- |------
 code|integer | 响应码 |
 data| object | 返回实体 |
 userPhoneId|Integer | 电话id |
 phone| String | 电话号码 |
  phoneName| String | 电话号码名称 |
 phoneType| Integer | 手机(0, "手机"),阿里云固话(1, "阿里云固话"),无主叫固话(2, "无主叫固话"), |
 available| Boolean | 是否可用 |
 totalConcurrencyQuota| Integer | 总并发数 |
 usedConcurrencyQuota| Integer | 已经使用并发数 |
 resultMsg| String | 响应说明 |
 errorStackTrace| String | 接口异常说明 |

##获取公司的机器人话术列表

###功能说明：

通过接口可以获取指定公司的所有配置完成的机器人话术 

>JSON响应实例：

```
{
    "code": 200,
    "data": [
        {
            "robotDefId": 6, 
            "robotName": "产品电销", 
            "sceneDefId": 11, 
            "sceneRecords": [
                {
                    "sceneRecordId": 25, 
                    "sceneRecordName": "房产电销女声版(佑琪)" 
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
        }
    ],
    "resultMsg": "获取成功",
    "errorStackTrace": null
}

```

###请求：

URL：http://api.byrobot.cn/openapi/v1/company/getPhones

###访问方式：

GET


###请求参数:

参数名 | 类型 | 是否必须 | 描述 | 实例 
--------- | ------- |------- | ------ |------
 companyId| Integer| 是 | 公司Id| 1 |



###响应：

参数名 | 类型 | 描述 
--------- | ------- |------
 code|integer | 响应码 |
 data| object | 返回实体 |
 robotDefId|Integer | 机器人话术id |
 robotName| String | 机器人话术名称 |
 sceneDefId| Integer | 机器人话术场景id |
 sceneRecordId| Integer | 机器人话术录音id |
 sceneRecordName| String | 机器人录音名称 |
 resultMsg| String | 响应说明 |
 errorStackTrace| String | 接口异常说明 |

