# 任务相关接口

## 停止任务

```Java
String baseUrl = "http://api.byrobot.cn";
String url = baseUrl + "/openapi/v1/task/stop";
Map<String, Integer> map = new HashMap<>();
map.put("taskId", 65);
String json = JSON.toJSONString(map);
String result = IndataHttpUtils.sendPOST(url, json, "AppKey", "AppSecret");
System.out.println(result);
```
> 请求参数:

```json
{
     "taskId":11
}
```

> 返回结果示例:

```json
{
    "code": 200,
    "data": null,
    "resultMsg": "停止成功",
    "errorStackTrace": null
}
```

停止电话任务

### HTTP Request

`POST /openapi/v1/task/stop`

### 请求参数解释说明:

字段 | 类型 | 描述
--------- | ----------- | -----------
taskId | Integer | 电话任务的主键id


## 启动任务

```Java
String baseUrl = "http://api.byrobot.cn";
String url = baseUrl + "/openapi/v1/task/start";
Map<String, Integer> map = new HashMap<>();
map.put("taskId", 11);
String json = JSON.toJSONString(map);
String result = IndataHttpUtils.sendPOST(url, json, "AppKey", "AppSecret");
System.out.println(result);
```
> 请求参数:

```json
{
     "taskId":11
}
```

> 返回结果示例:

```json
{
    "code": 200,
    "data": null,
    "resultMsg": "启动成功",
    "errorStackTrace": null
}
```
启动电话任务

### HTTP Request

`POST /openapi/v1/task/start`

### 请求参数解释说明:

字段 | 类型 | 描述
--------- | ----------- | -----------
taskId | Integer | 电话任务的主键id



## 暂停任务

```Java
String baseUrl = "http://api.byrobot.cn";
String url = baseUrl + "/openapi/v1/task/pause";
Map<String, Integer> map = new HashMap<>();
map.put("taskId", 11);
String json = JSON.toJSONString(map);
String result = IndataHttpUtils.sendPOST(url, json, "AppKey", "AppSecret");
System.out.println(result);
```
> 请求参数:

```json
{
     "taskId":11
}
```

> 返回结果示例:

```json
{
    "code": 200,
    "data": null,
    "resultMsg": "启动成功",
    "errorStackTrace": null
}
```

暂停电话任务

### HTTP Request

`POST /openapi/v1/task/pause`

### 请求参数解释说明:

字段 | 类型 | 描述
--------- | ----------- | -----------
taskId | Integer | 电话任务的主键id



## 创建任务

```Java
String baseUrl = "http://api.byrobot.cn";
String url = baseUrl + "/openapi/v1/task/createTask";
CreateTaskVO createTaskVO = new CreateTaskVO();
createTaskVO.setCompanyId(1);
createTaskVO.setTaskName("流程测试任务04");
createTaskVO.setTaskType(2);
List<Integer> userPhoneIds = new ArrayList<>();
userPhoneIds.add(13);
createTaskVO.setUserPhoneIds(userPhoneIds);
createTaskVO.setRobotDefId(11);
createTaskVO.setSceneDefId(29);
createTaskVO.setSceneRecordId(21);
createTaskVO.setRemark("流程测试任务03");
String json = JSON.toJSONString(createTaskVO);
String result = IndataHttpUtils.sendPOST(url, json, "AppKey", "AppSecret");
System.out.println(result);
```
> 请求参数:

```json
{
    "companyId" : 1, 
    "taskName" : "测试任务", 
    "taskType" : 2, 
    "startDate" : "2017-10-19", 
    "workingStartTime" : "08:00", 
    "workingEndTime" : "22:00", 
    "userPhoneIds" : [1], 
    "robotDefId" : 1, 
    "sceneDefId" : 1, 
    "sceneRecordId" : 7, 
    "remark" : "创建任务" 
}
```

> 返回结果示例:

```json
{
    "code": 200,
    "data": 67,
    "resultMsg": "操作成功",
    "errorStackTrace": null
}
```

创建电话任务

### HTTP Request

`POST /openapi/v1/task/createTask`

### 请求参数解释说明:

字段 | 类型 | 描述
--------- | ----------- | -----------
companyId | Integer | 管理的公司id
taskName | String | 任务名称
taskType | Integer | 任务类型, 1-定时,2-手动
startDate | String | 任务开始日期
workingStartTime | String | 可拨打开始时间
workingEndTime | String | 可拨打结束时间
userPhoneIds | List | 主叫电话号码id列表，详见获取公司的主叫电话接口
robotDefId | Integer |  机器人id
sceneDefId | Integer | 场景id
sceneRecordId | Integer | 录音id
remark | String | 任务的备注




## 导入客户

```Java
String baseUrl = "http://api.byrobot.cn";
String url = baseUrl + "/openapi/v1/task/importTaskCustomer";
ImportTaskCustomerVO importTaskCustomerVO = neImportTaskCustomerVO();
importTaskCustomerVO.setCompanyId(1);
importTaskCustomerVO.setTaskId(71);
List<CustomerInfoExtVO> customerInfoList = neCopyOnWriteArrayList<>();
CustomerInfoExtVO customerInfoExtVO = new CustomerInfoExtVO();
customerInfoExtVO.setName("繁华");
customerInfoExtVO.setPhone("18011122333");
customerInfoList.add(customerInfoExtVO);
importTaskCustomerVO.setCustomerInfoList(customerInfoList);
String json = JSON.toJSONString(importTaskCustomerVO);
String result = IndataHttpUtils.sendPOST(url, json, "AppKey", "AppSecret");
System.out.println(result);
```
> 请求参数:

```json
{
  "companyId" : 1, 
  "taskId" : 67, 
  "customerInfoList" : [
    	{
    		"name" : "张三", 
    		"phone" : "13333333333" 
    	},
    	{
    		"name" : "李四",
    		"phone" : "15555555555"
    	}
  ]
}
```

向任务中导入客户

### HTTP Request

`POST /openapi/v1/task/importTaskCustomer`

### 请求参数解释说明:

字段 | 类型 | 描述
--------- | ----------- | -----------
companyId | Integer | 管理的公司id
taskId | Integer | 任务id
customerInfoList | List | 客户列表的集合
name | String |  客户名称
phone | String | 客户手机


## 获取一个通话的详情

```Java
String baseUrl = "http://api.byrobot.cn";
String url = baseUrl + "/openapi/v1/task/phoneLogInfo?callInstanceId=695";
String result = IndataHttpUtils.sendGet(url, "AppKey", "AppSecret");
System.out.print(result);
```

> 返回结果示例:

```json
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
            "companyId": 1, // 任务名称
            "callJobId": 31, // 任务id
            "customerId": 55, // 客户id
            "customerTelephone": "17751279857", // 客户手机
            "customerName": "不弃", // 客户名称
            "status": 2,  // 任务实例状态, 0: 未开始，1: 进行中，2: 已完成，3: 二次拨打调度中
            "finishStatus": 0, // 任务实例已经完成的状态, 0:已接听，1：拒接，2:无应答，3:占线, 4:停机，5：空号
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

获取一个通话的详情

### HTTP Request

`GET /openapi/v1/task/phoneLogInfo`

### 请求参数解释说明:
字段 | 类型 | 描述
--------- | ----------- | -----------
callInstanceId | Integer | 任务实例id




## 获取任务列表

```Java
String baseUrl = "http://api.byrobot.cn";
String url = baseUrl + "/openapi/v1/task/getTasks?companyId=1";
String result = IndataHttpUtils.sendGet(url, "AppKey", "AppSecret");
System.out.print(result);
```

> 返回结果示例:

```json
{
    "code": 200,
    "data": {
        "pageNum": 2, // 第几页
        "pageSize": 2, // 每页页面大小
        "size": 2,
        "orderBy": null,
        "startRow": 3,
        "endRow": 4,
        "total": 46, // 数据总条数
        "pages": 23, // 页面总数
        "list": [
            {
                "callJobId": 66, // 任务id
                "jobName": "撒的发生", // 任务名称
                "jobType": 2, // 任务类型，1-定时，2-手动
                "startDate": "2017-10-25", // 任务开始时间
                "workingStartTime": "09:00:00", // 可拨打开始时间
                "workingEndTime": "21:00:00", // 可拨打结束时间
                "status": 2, // 任务状态, 0:未开始,1:进行中,2:已完成,4:用户暂停,5:系统暂停,6:已终止,7:排队中
                "sceneDefId": 1, // 场景id
                "remark": "", // 任务注释
                "totalCount": null, // 任务拨打的号码总数
                "doneCount": null, // 任务已完成拨打的号码总数
                "calledCount": null,  // 任务已完成呼通的号码总数
                "rejectedCount": null,  // 任务呼叫被拒接的号码总数
                "unavailableCount": null, // 任务呼叫无法接通的号码总数
                "fromUnavailableCount": null, // 任务主叫号码不可用的号码总数
                "callPhones": null // 主叫电话号码列表，格式和getPhones返回结果相同
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

获取一个公司的电话任务列表

### HTTP Request

`GET /openapi/v1/task/getTasks`

### 请求参数解释说明:

字段 | 类型 | 描述
--------- | ----------- | -----------
companyId | Integer | 公司id
pageNum | Integer | 第几页,选填,默认1
pageSize | Integer | 页面大小,选填,默认10
taskName | String | 任务名称,选填
createDate | String | 创建日期，格式yyyy-MM-dd,选填
status | Integer | 任务状态,选填 - 0:未开始,1:进行中,2:已完成,4:用户暂停,5:系统暂停,6:已终止,7:排队中



## 获取任务详情

```Java
String baseUrl = "http://api.byrobot.cn";
String url = baseUrl + "/openapi/v1/task/getTaskDetail?companyId=1&taskId=66";
String result = IndataHttpUtils.sendGet(url, "AppKey", "AppSecret");
System.out.print(result);
```

> 返回结果示例:

```json
{
    "code": 200,
    "data": {
        "callJobId": 19, // 任务id
        "jobName": "testJob", // 任务名称
        "jobType": 2, // 任务类型，1-定时，2-手动
        "startDate": "2017-10-19", // 任务开始时间
        "workingStartTime": "08:00:00", // 可拨打开始时间
        "workingEndTime": "22:00:00", // 可拨打结束时间
        "status": 2, // 任务状态, 0:未开始,1:进行中,2:已完成,4:用户暂停,5:系统暂停,6:已终止,7:排队中
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
               }
           ]
       }
    },
    "resultMsg": "操作成功",
    "errorStackTrace": null
}
```

获取一个公司某个电话任务的详情

### HTTP Request

`GET /openapi/v1/task/getTaskDetail`

### 请求参数解释说明:

字段 | 类型 | 描述
--------- | ----------- | -----------
companyId | Integer | 公司id
taskId | Integer | 任务id




## 获取未开始的电话列表

```Java
String baseUrl = "http://api.byrobot.cn";
String url = baseUrl + "/openapi/v1/task/notDialedCustomerList?taskId=67";
String result = IndataHttpUtils.sendGet(url, "AppKey", "AppSecret");
System.out.print(result);
```

> 返回结果示例:

```json
{
    "code": 200,
    "data": [
        {
            "callInstanceId": 1
            "customerTelephone": "18888888888",
            "customerName": "张三",
            "status": 2,
            "startTime": "2017-10-17 12:53:03",
            "callerPhone": null
        }
    ],
    "resultMsg": "操作成功",
    "errorStackTrace": null
}
返回参数：
customerTelephone：用户电话
customerName：用户名称
status：通话状态
startTime：通话时间
callerPhone：主叫号码
```

获取未开始的电话列表

### HTTP Request

`GET /openapi/v1/task/notDialedCustomerList`

### 请求参数解释说明:

字段 | 类型 | 描述
--------- | ----------- | -----------
pageNum | Integer | 第几页(默认为1) 选填
pageSize | Integer | 显示数量/页（默认为10） 选填
taskId | Integer | 任务id


## 获取已经完成任务电话号码

```Java
String baseUrl = "http://api.byrobot.cn";
String url = baseUrl + "/openapi/v1/task/queryDoneTaskPhones";
DialedPhoneQueryVO dialedPhoneQueryVO = new DialedPhoneQueryVO();
dialedPhoneQueryVO.setCallJobId(66);
dialedPhoneQueryVO.setDurationLeft(10);
dialedPhoneQueryVO.setDurationRight(59);
dialedPhoneQueryVO.setChatRoundLeft(0);
dialedPhoneQueryVO.setChatRoundRight(9);
dialedPhoneQueryVO.setFinishStatus(0);
List<NameValueBO> resultQueryList = new ArrayList<>();
NameValueBO nameValueBO = new NameValueBO();
nameValueBO.setName("客户意向等级");
nameValueBO.setValue("B级(一般)");
resultQueryList.add(nameValueBO);
dialedPhoneQueryVO.setResultQueryList(resultQueryList);
String json = JSON.toJSONString(dialedPhoneQueryVO);
String result = IndataHttpUtils.sendPOST(url, json, "AppKey", "AppSecret");
System.out.println(result);
```
> 请求参数:

```json
{
	"callJobId" : 62, 
	"durationLeft" : 0, 
	"durationRight" : 100, 
	"chatRoundLeft":0, 
	"chatRoundRight":10, 
	"finishStatus" : 1, 
	"resultQueryList" : [ 
		{
			"name" : "客户意向等级",
			"value" : "A级(较强)"
		}
	]
}
```

> 返回结果示例:

```json
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
                "finishStatus": 0, // 任务实例已经完成的状态, 0:已接听，1：拒接，2:无应答，3:占线, 4:停机，5：空号
                "duration": "27秒", // 通话时长
                "chatRound": 0, // 通话轮次
                "startTime": "2017-10-25 11:32:54", // 开始拨打时间
                "endTime": "2017-10-25 11:33:22", // 结束拨打时间
                "callerPhone": "15868457106", // 主叫电话
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

获取已经完成任务电话号码

### HTTP Request

`POST /openapi/v1/task/queryDoneTaskPhones`

### 请求参数解释说明:

字段 | 类型 | 描述
--------- | ----------- | -----------
callJobId | Integer | 电话任务的主键id
durationLeft | Integer | 通话时长左值
durationRight | Integer | 通话时长右值
chatRoundLeft | Integer | 通话轮次左值
chatRoundRight | Integer | 通话时长右值
finishStatus | Integer | 0-已接听,1-拒接,2-无法接通,3-主叫号码不可用
resultQueryList | List | 支持按分析结果作为条件
name | String | 分析结果名称
value | String | 分析结果值