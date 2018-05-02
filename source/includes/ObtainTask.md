#任务信息查询

##获取任务列表

###功能说明：

通过此接口可以获取指定公司的任务列表

>JSON响应实例：

```
{
    "code": 200,
    "data": {
        "pageNum": 2, 
        "pageSize": 2, 
        "size": 2,
        "orderBy": null,
        "startRow": 3,
        "endRow": 4,
        "total": 46, 
        "pages": 23,
        "list": [
            {
                "callJobId": 66, 
                "jobName": "撒的发生", 
                "jobType": 2, 
                "startDate": "2017-10-25", 
                "workingStartTime": "09:00:00", 
                "workingEndTime": "21:00:00", 
                "status": 2, 
                "sceneDefId": 1, 
                "remark": "", 
                "totalCount": null, 
                "doneCount": null, 
                "calledCount": null, 
                "rejectedCount": null, 
                "unavailableCount": null,
                "fromUnavailableCount": null,
                "callPhones": null 
            },
            {
                "callJobId": 64,
                "jobName": "心热大师傅",
                "jobType": 2,
                "startDate": "2017-10-25",
                "workingStartTime": "09:00:00",
                "workingEndTime": "21:00:00",
                "status": 2,
                "sceneDefId": 1,
                "remark": "",
                "totalCount": null,
                "doneCount": null,
                "calledCount": null,
                "rejectedCount": null,
                "unavailableCount": null,
                "fromUnavailableCount": null,
                "sceneDefName": null,
                "callPhones": null
            }
        ]
    },
    "resultMsg": "操作成功",
    "errorStackTrace": null
}

```

###请求：

URL：http://api.byrobot.cn/openapi/v1/task/getTasks

###访问方式：

GET


###请求参数:

参数名 | 类型 | 是否必须 | 描述 | 实例 
--------- | ------- |------- | ------ |----------
 companyId| Integer| 是 | 公司Id| 1 |
 taskName| String| 否 |任务名称| 测试API任务 |
 createDate| String| 否 | | "2017-10-19" |
 status| Integer| 否 | 任务状态,选填 - 0:未开始,1:进行中,2:已完成,4:用户暂停,5:系统暂停,6:已终止| 1 |
 pageNum| Integer| 否 | 第几页,默认1| 1 |
 pageSize| Integer| 否 | 页面大小,选填,默认10| 10 |



###响应：

参数名 | 类型 | 描述 
--------- | ------- |------
 code|integer | 响应码 |
 data| object | 返回实体 |
 pageNum| Integer | 第几页 |
 pageSize| Integer | 每页页面条数 |
 total| Integer | 数据总条数 |
 pages| Integer | 页面总数 |
 callJobId| Integer | 任务id |
 jobName| String | 任务名称 |
 jobType| Integer | 任务类型，1-定时，2-手动 |
 startDate| object | 任务开始时间 |
 workingStartTime| String | 可拨打开始时间 |
 workingEndTime| String | 可拨打结束时间 |
 breakStartTime| String | 暂时停止开始时间 |
 breakEndTime| String | 暂时停止结束时间 |
 status| Integer | 任务状态, 0:未开始,1:进行中,2:已完成,4:用户暂停,5:系统暂停,6:已终止 |
 remark| String  | 任务注释 |
 totalCount| Integer | 任务拨打的号码总数 |
 doneCount| Integer | 任务已完成拨打的号码总数 |
 calledCount| Integer | 任务已完成呼通的号码总数 |
 rejectedCount| Integer | 任务呼叫被拒接的号码总数 |
 unavailableCount| Integer | 任务呼叫无法接通的号码总数 |
 fromUnavailableCount| Integer | 任务主叫号码不可用的号码总数 |
 callPhones| List | 主叫电话号码列表，格式和getPhones返回结果相同 |
 resultMsg| String | 响应说明 |
 errorStackTrace| String | 接口异常说明 |

##获取任务详情

###功能说明：

通过此接口可以获取指定任务的详细信息

>JSON响应实例：

```
{
    "code": 200,
    "data": {
        "callJobId": 19, // 任务id
        "jobName": "testJob", // 任务名称
        "jobType": 2, // 任务类型，1-定时，2-手动
        "startDate": "2017-10-19", // 任务开始时间
        "workingStartTime": "08:00:00", // 可拨打开始时间
        "workingEndTime": "22:00:00", // 可拨打结束时间
        "status": 2, // 任务状态, 0:未开始,1:进行中,2:已完成,4:用户暂停,5:系统暂停,6:已终止
        "sceneDefId": 1, // 场景id
        "remark": "testJobx", // 任务注释
        "totalCount": 2, // 任务拨打的号码总数
        "doneCount": 2, // 任务已完成拨打的号码总数
        "calledCount": 0, // 任务已完成呼通的号码总数
        "rejectedCount": 0, // 任务呼叫被拒接的号码总数
        "unavailableCount": 0, // 任务呼叫无法接通的号码总数
        "fromUnavailableCount": 2, // 任务主叫号码不可用的号码总数
        "robotDefName": "产品电销", // 机器人名称
        "sceneDefName": "金融催缴", // 场景名称
        "sceneRecordName": "房产电销优化版(张飞)", // 录音名称
        "durationStat": [
            {
                "name": "<10s", // 通话时长的统计信息
                "value": 22
            }
        ],
        "chatRoundStat": [
            {
                "name": "0-9次", // 通话轮次的统计信息
                "value": 22
            }
        ],
        "resultDefs": [
            {
                "name": "催缴结果", // 结果分析的枚举
                "values": [
                    "成功",
                    "不成功"
                ]
            }
        ],
        "callPhones": [ // 主叫电话号码列表，格式和getPhones返回结果相同
            {
                "jobPhoneId": 26,
                "userPhoneId": 1,
                "callJobId": 19,
                "phone": "13333333333",
                "phoneName": "sim1",
                "gmtCreate": "2017-10-19 17:33:06",
                "gmtModified": "2017-10-19 17:33:06"
            },
            {
                "jobPhoneId": 27,
                "userPhoneId": 2,
                "callJobId": 19,
                "phone": "18888888888",
                "phoneName": "sim2",
                "gmtCreate": "2017-10-19 17:33:06",
                "gmtModified": "2017-10-19 17:33:06"
            }
        ],
        "extraStat": {
           "客户意向等级": [ // 任务分析结果统计信息
               {
                   "name": "较强",
                   "value": 1
               }
           ],
           "客户关注点": [
               {
                   "name": "位置",
                   "value": 1
               },
               {
                   "name": "其他楼盘",
                   "value": 1
               },
               {
                   "name": "商业配套",
                   "value": 1
               },
               {
                   "name": "户型",
                   "value": 1
               },
               {
                   "name": "环境",
                   "value": 1
               },
               {
                   "name": "能否贷款",
                   "value": 1
               },
               {
                   "name": "询问价格",
                   "value": 1
               }
           ]
       }
    },
    "resultMsg": "操作成功",
    "errorStackTrace": null
}

```

###请求：

URL：http://api.byrobot.cn/openapi/v1/task/getTaskDetail

###访问方式：

GET


###请求参数:

参数名 | 类型 | 是否必须 | 描述 | 实例 
--------- | ------- |------- | ------ |----------
 companyId| Integer| 是 | 公司Id| 1 |
 taskId| Integer| 否 |任务Id| 21 |
 

###响应：

参数名 | 类型 | 描述 
--------- | ------- |------
 code|integer | 响应码 |
 data| object | 返回实体 |
 callJobId| Integer | 任务id |
 jobName| String | 任务名称 |
 jobType| Integer | 任务类型，1-定时，2-手动 |
 startDate| object | 任务开始时间 |
 workingStartTime| String | 可拨打开始时间 |
 workingEndTime| String | 可拨打结束时间 |
 breakStartTime| String | 暂时停止开始时间 |
 breakEndTime| String | 暂时停止结束时间 |
 status| Integer | 任务状态, 0:未开始,1:进行中,2:已完成,4:用户暂停,5:系统暂停,6:已终止 |
 remark| String  | 任务注释 |
 totalCount| Integer | 任务拨打的号码总数 |
 doneCount| Integer | 任务已完成拨打的号码总数 |
 calledCount| Integer | 任务已完成呼通的号码总数 |
 rejectedCount| Integer | 任务呼叫被拒接的号码总数 |
 unavailableCount| Integer | 任务呼叫无法接通的号码总数 |
 fromUnavailableCount| Integer | 任务主叫号码不可用的号码总数 |
 robotDefName| String | 机器人名称 |
 sceneDefName| String | 场景名称 |
 sceneRecordName| String | 录音名称 | 
 durationStat| List | 通话时长的统计信息 | 
 chatRoundStat| List | 通话轮次的统计信息 | 
 resultDefs| List | 结果分析的枚举 | 
 callPhones| List | 主叫电话号码列表，格式和getPhones返回结果相同 |
 extraStat| List | 任务分析结果统计信息 |
 resultMsg| String | 响应说明 |
 errorStackTrace| String | 接口异常说明 |
 
##获取已经完成任务电话号码
 
###功能说明：
 
 通过此接口可以获取指定任务中所有已经完成的电话号码
 
 >入参JSON实例
 
 ```
 
{
	"callJobId" : 62, // 任务id
	"durationLeft" : 0, // 通话时长左值
	"durationRight" : 100, // 通话时长右值
	"chatRoundLeft":0, // 通话轮次左值
	"chatRoundRight":10, // // 通话时长右值
	"finishStatus" : 1, // 0:已接听，1：拒接，2:无应答，3:主叫号码不可用, 4:空号, 5:关机, 6:占线, 7:停机, 8:未接, 9:主叫欠费
	"index": -1,    // 已经获取过任务结果的最大的index(第一次的时候传入-1，默认不传也是-1)，index是指任务中电话结束顺序
	"pageNum": 1,    // 第几页(默认为1)
	"pageSize": 10,    // 显示数量/页（默认为10）
	"resultQueryList" : [ // 支持按分析结果作为条件
		{
			"name" : "客户意向等级",
			"value" : "A级(较强)"
		}
	]
}
 
 ```
 
 >JSON响应实例：
 
 ```
 {
     "code": 200,
     "data": {
         "pageNum": 1,
         "pageSize": 2,
         "size": 2,
         "orderBy": null,
         "startRow": 0,
         "endRow": 1,
         "total": 2,
         "pages": 1,
         "list": [
             {
                 "callInstanceId": 493, // 任务实例id（每个被叫电话为一个实例）
                 "sceneDefId": 1, // 场景id
                 "callJobId": 62, // 任务id
                 "customerTelephone": "1008", // 被叫客户电话号码
                 "customerName": "测试02",  // 被叫客户名称
                 "status": 2, // 任务实例状态, 0: 未开始，1: 进行中，2: 已完成，3: 二次拨打调度中
                 "finishStatus": 0, // 任务实例已经完成的状态, 0:已接听，1：拒接，2:无应答，3:主叫号码不可用, 4:空号, 5:关机, 6:占线, 7:停机, 8:未接, 9:主叫欠费
                 "duration": "27秒", // 通话时长
                 "chatRound": 0, // 通话轮次
                 "startTime": "2017-10-25 11:32:54", // 开始拨打时间
                 "endTime": "2017-10-25 11:33:22", // 结束拨打时间
                 "callerPhone": "15868457106", // 主叫电话
                 "callIndex": 10,              // 电话结束顺序index
                 "luyinOssUrl": "https://jingrobot-dev.oss-cn-hangzhou.aliyuncs.com/RobotPhoneCommunicate/493.mp3", // 通话录音
                 "secondaryCallTime": "1970-01-01 11:18:13", // 二次重试拨打时间
                 "secondaryCallTimes": 0, // 重试拨打次数
                 "gmtCreate": "2017-10-25 09:45:32",
                 "gmtModified": "2017-10-25 11:33:22",
                 "jobName": "电话任务", // 任务名称
                 "resultList": [ // 通话分析结果信息
                     {
                         "name": "催缴结果",
                         "value": "成功"
                     }
                 ]
             },
             {
                 "callInstanceId": 489,
                 "sceneDefId": 1,
                 "callJobId": 62,
                 "customerTelephone": "17751279857",
                 "customerName": "不弃",
                 "status": 2,
                 "finishStatus": 0,
                 "duration": "11秒",
                 "chatRound": 0,
                 "startTime": "2017-10-25 11:17:06",
                 "endTime": "2017-10-25 11:17:18",
                 "callerPhone": "15868457106",
                 "luyinOssUrl": "https://jingrobot-dev.oss-cn-hangzhou.aliyuncs.com/RobotPhoneCommunicate/489.mp3",
                 "secondaryCallTime": "1970-01-01 10:59:23",
                 "secondaryCallTimes": 1,
                 "gmtCreate": "2017-10-25 09:45:32",
                 "gmtModified": "2017-10-25 11:17:17",
                 "jobName": "电话任务",
                 "resultList": [
                     {
                         "name": "催缴结果",
                         "value": "成功"
                     }
                 ]
             }
         ]
     },
     "resultMsg": "操作成功",
     "errorStackTrace": null
 }
 
 ```
 
###请求：
 
 URL：http://api.byrobot.cn/openapi/v1/task/queryDoneTaskPhones
 
###访问方式：
 
 GET
 
 
###请求参数:
 
 参数名 | 类型 | 是否必须 | 描述 | 实例 
 --------- | ------- |------- | ------ |----------
  callJobId| Integer| 是 | 任务id| 1 |
  durationLeft| Integer| 否 |通话时长左值| 0 |
   durationRight| Integer| 否 |通话时长右值| 100 |
  chatRoundLeft| Integer| 否 |通话轮次左值| 21 |
  chatRoundRight| Integer| 否 |通话时长右值| 21 |
  finishStatus| Integer| 否 |0:已接听，1：拒接，2:无应答，3:主叫号码不可用, 4:空号, 5:关机, 6:占线, 7:停机, 8:未接, 9:主叫欠费| 1 |
  index| Integer| 否 |已经获取过任务结果的最大的index(第一次的时候传入-1，默认不传也是-1)，index是指任务中电话结束顺序| 21 |
  pageNum| Integer| 否 |第几页(默认为1)| 1 |
  pageSize| Integer| 否 |显示数量/页（默认为10）| 10 |
  resultQueryList| List| 否 |支持按分析结果作为条件| 10 |
  
 
###响应：
 
 参数名 | 类型 | 描述 
 --------- | ------- |------
  code|integer | 响应码 |
  data| object | 返回实体 |
  pageNum| Integer | 第几页 |
   pageSize| Integer | 每页页面条数 |
   total| Integer | 数据总条数 |
   pages| Integer | 页面总数 |
  callInstanceId| Integer | 任务实例id（每个被叫电话为一个实例） |
  sceneDefId| Integer | 场景id |
  callJobId| Integer |任务id|
  customerTelephone| String | 被叫客户电话号码 |
  customerName| String | 被叫客户名称 |
  status| String | 任务实例状态, 0: 未开始，1: 进行中，2: 已完成，3: 二次拨打调度中 |
  finishStatus| String | 任务实例已经完成的状态, 0:已接听，1：拒接，2:无应答，3:主叫号码不可用, 4:空号, 5:关机, 6:占线, 7:停机, 8:未接, 9:主叫欠费 |
  breakEndTime| String | 暂时停止结束时间 |
  status| Integer | 任务状态, 0:未开始,1:进行中,2:已完成,4:用户暂停,5:系统暂停,6:已终止 |
  duration| Integer  | 通话时长 |
  chatRound| Integer | 通话轮次 |
  startTime| String | 开始拨打时间 |
  endTime| String | 结束拨打时间 |
  callerPhone| String | 主叫电话 |
  callIndex| Integer | 电话结束顺序index |
  luyinOssUrl| Integer | 通话录音 |
  secondaryCallTime| String | 二次重试拨打时间 |
  sceneDefName| String | 场景名称 |
  sceneRecordName| String | 录音名称 | 
  secondaryCallTime| List | 通话时长的统计信息 | 
  secondaryCallTimes| List | 重试拨打次数 | 
  jobName| List | 任务名称 | 
  resultList| List | 通话分析结果信息 |
  resultMsg| String | 响应说明 |
  errorStackTrace| String | 接口异常说明 |

##获取一个通话的详情
 
###功能说明：
 
 通过此接口可以获取指定通话的详细信息
 
 >JSON响应实例：
 
 ```
 {
    "code": 200,
     "data": {
        "phoneLog": {
            "phoneLogs": [ // 对话内容
                {
                    "sceneInstanceLogId": 1321,
                    "sceneInstanceId": 540, // 任务实例id
                    "speaker": "AI", // 角色
                    "content": "哎，您好，等待2s 哎，您好，拱墅区 中大银泰城边上有个首付50万左右的精装公寓你考虑吗？", // 内容
                    "userMean": null,
                    "userMeanDetail": null,
                    "aiUnknown": false,
                    "startTime": 0,
                    "endTime": 0,
                    "gmtCreate": "2018-01-24 20:51:53",
                    "gmtModified": "2018-01-24 20:51:53"
                },
                {
                    "sceneInstanceLogId": 1322,
                    "sceneInstanceId": 540,
                    "speaker": "ME",
                    "content": "喂你好",
                    "userMean": "~",
                    "userMeanDetail": null,
                    "aiUnknown": false,
                    "startTime": 300,
                    "endTime": 1145,
                    "gmtCreate": "2018-01-24 20:51:55",
                    "gmtModified": "2018-01-24 20:51:55"
                },
                {
                    "sceneInstanceLogId": 1323,
                    "sceneInstanceId": 540,
                    "speaker": "ME",
                    "content": "哦你好",
                    "userMean": "~",
                    "userMeanDetail": null,
                    "aiUnknown": false,
                    "startTime": 2330,
                    "endTime": 3565,
                    "gmtCreate": "2018-01-24 20:51:57",
                    "gmtModified": "2018-01-24 20:51:57"
                }
          "luyinOssUrl": "https://byrobot-test.oss-cn-hangzhou.aliyuncs.com/RobotPhoneCommunicate/540/JYSYDCCHVFYYTMGJKKHJAMHARNNBWEJQ.wav" // 通话录音
         },
         "sceneInstance": {
             "callInstanceId": 540, // 任务实例id
             "companyId": 1, // 公司id
             "callJobId": 31, // 任务id
             "customerId": 55, // 客户id
             "customerTelephone": "17751279857", // 客户手机
             "customerName": "不弃", // 客户名称
             "status": 2,  // 任务实例状态, 0: 未开始，1: 进行中，2: 已完成，3: 二次拨打调度中
             "finishStatus": 0, // 任务实例已经完成的状态, 0:已接听，1：拒接，2:无应答，3:主叫号码不可用, 4:空号, 5:关机, 6:占线, 7:停机, 8:未接, 9:主叫欠费
             "duration": 87, // 通话时长
             "chatRound": 18, // 通话轮次
             "startTime": "2018-01-24 20:51:53", // 开始拨打时间
             "endTime": "2018-01-24 20:53:28", // 结束拨打时间
             "callerPhone": "18072749353", // 主叫电话
             "luyinOssUrl": "https://byrobot-test.oss-cn-hangzhou.aliyuncs.com/RobotPhoneCommunicate/540/JYSYDCCHVFYYTMGJKKHJAMHARNNBWEJQ.wav",
             "userLuyinOssUrl": "https://byrobot-test.oss-cn-hangzhou.aliyuncs.com/RobotPhoneCommunicate/540_user.wav",
             "properties": "{}",
             "handlePerson": "房产电销优化版",
             "callType": 1,
             "readStatus": 1,
             "jobName": "buqi新的测试任务",
            "robotDefId": 6,
             "sceneDefId": 11,
             "sceneRecordId": 1,
             "trackResult": null,
             "hangUp": 0,
             "secondaryCallTime": "1970-01-01 13:00:00",
             "secondaryCallTimes": 2,
             "gmtCreate": "2018-01-24 20:51:31",
             "gmtModified": "2018-02-03 18:27:19"
         },
         "taskResult": [ // 任务结果分析
             {
                 "sceneInstanceResultId": 188,
                 "companyId": 1,
                 "sceneInstanceId": 540,
                 "resultName": "预约时间",
                 "resultValue": "2018-01-25 08:00",
                 "resultDesc": null,
                 "analyzeType": null,
                 "gmtCreate": "2018-01-24 20:53:01",
                "gmtModified": "2018-01-24 20:53:01"
             },
             {
                 "sceneInstanceResultId": 189,
                 "companyId": 1,
                 "sceneInstanceId": 540,
                 "resultName": "客户意向等级",
                 "resultValue": "A级(较强)",
                 "resultDesc": "该客户在通话过程中主动询问了产品细节，有进一步了解产品的意愿。",
                 "analyzeType": "BY_ANALYZE_USER_LEVEL",
                 "gmtCreate": "2018-01-24 20:53:28",
                 "gmtModified": "2018-01-31 10:34:55"
             }
         ]
     },
     "resultMsg": "获取成功",
     "errorStackTrace": null
 }
 
 ```
 
###请求：
 
 URL：http://api.byrobot.cn/openapi/v1/task/phoneLogInfo
 
###访问方式：
 
 GET
 
 
###请求参数:
 
 参数名 | 类型 | 是否必须 | 描述 | 实例 
 --------- | ------- |------- | ------ |----------
  callInstanceId| Integer| 是 | 任务实例id| 1 |  
 
###响应：
 
 参数名 | 类型 | 描述 
 --------- | ------- |------
  code|integer | 响应码 |
  data| object | 返回实体 |
  phoneLogs| List | 对话内容 |
  sceneInstanceId| Integer | 任务实例id |
  speaker| String |角色|
  content| String | 内容 |
  aiUnknown| Integer | 是否是ai无法应答的问题，1-是，0-否 |
  luyinOssUrl| String |通话录音|
  callInstanceId| Integer | 任务实例id（每个被叫电话为一个实例） |
  companyId| Integer | 公司id |
  callJobId| Integer |任务id|
  customerId| Integer | 客户id |
  customerTelephone| String | 客户手机 |
  customerName| String | 客户名称 |
  finishStatus| String | 任务实例已经完成的状态, 0:已接听，1：拒接，2:无应答，3:主叫号码不可用, 4:空号, 5:关机, 6:占线, 7:停机, 8:未接, 9:主叫欠费 |
  status| Integer | 任务状态, 0:未开始,1:进行中,2:已完成,4:用户暂停,5:系统暂停,6:已终止 |
  duration| Integer  | 通话时长 |
  chatRound| Integer | 通话轮次 |
  startTime| String | 开始拨打时间 |
  endTime| String | 结束拨打时间 |
  callerPhone| String | 主叫电话 |
  luyinOssUrl| Integer | 通话录音 |
  callType| Integer | 拨打类型 0: 免费试用 1: 任务 2: 用户单独拨打 3: 收费试用 4:Ope后台拨打 100: 人工拨打  |
  readStatus| Integer | 是否已读 0: 未读 1: 已读 |
  robotDefId| String | 关联的机器人id |
  sceneDefId| String | 场景ID | 
  sceneRecordId| List | 关联的录音id | 
  trackResult| List | bug追踪结果 | 
  jobName| List | 任务名称 | 
  hangUp| List | 挂机人, 0: AI 1: 用户 |
  taskResult| String | 任务结果分析 |
  resultMsg| String | 响应说明 |
  errorStackTrace| String | 接口异常说明 |  
