#信息回调

##通话记录回调

 
###功能说明：
 
 当一次通话完成后，百应机器人会自动调用回调程序向用户配置的回调地址，发送本次通话详情。
 
 如果本次发送由于网络等原因发送失败，机器人会自动发起二次发送。
 
 最多回调10次，每次回调时长按1分钟，2分钟，4分钟，8分钟间隔依次递增，回调成功后，处理方应当返回字符串success在返回的body体中
  
 <aside class="notice">
 请您在对接接口前，务必配置好回调地址。否则回调将无法成功
 </aside>
 
 >入参JOSN实例:
 
  ```
 {
 　　"code":200,
 　　"data":{
 　　　　"dataType":"CALL_INSTANCE_RESULT",
 　　　　"data":{
 　　　　　　"sceneInstance":{
 　　　　　　　　"callInstanceId":5357,
 　　　　　　　　"companyId":241,
 　　　　　　　　"callUserId":233,
 　　　　　　　　"callJobId":281,
 　　　　　　　　"customerId":1673,
 　　　　　　　　"customerTelephone":"17751279857",
 　　　　　　　　"customerName":"曹文浩",
 　　　　　　　　"status":2,
 　　　　　　　　"finishStatus":0,
 　　　　　　　　"duration":5,
 　　　　　　　　"chatRound":1,
 　　　　　　　　"startTime":"2018-04-04 15:03:31",
 　　　　　　　　"endTime":"2018-04-04 15:03:39",
 　　　　　　　　"callerPhone":"057126881685",
 　　　　　　　　"luyinOssUrl":"https://byrobot-test.oss-cn-hangzhou.aliyuncs.com/RobotPhoneCommunicate/5357/HNZVBAMHQUGTEWVMJRBNTVMFQWSVFDEL.wav",
 　　　　　　　　"userLuyinOssUrl":"https://byrobot-test.oss-cn-hangzhou.aliyuncs.com/RobotPhoneCommunicate/5357_user.wav",
 　　　　　　　　"properties":"{}",
 　　　　　　　　"handlePerson":"房产电销精品录音(右琪)@20171226@20180105_20_31_18",
 　　　　　　　　"callType":1,
 　　　　　　　　"readStatus":0,
 　　　　　　　　"jobName":"不弃的测试",
 　　　　　　　　"robotDefId":24,
 　　　　　　　　"sceneDefId":77,
 　　　　　　　　"sceneRecordId":72,
 　　　　　　　　"corpName":"",
 　　　　　　　　"industry":"",
 　　　　　　　　"trackResult":null,
 　　　　　　　　"bugType":null,
 　　　　　　　　"hangUp":1,
 　　　　　　　　"secondaryCallTime":"1970-01-01 09:00:00",
 　　　　　　　　"secondaryCallTimes":2,
 　　　　　　　　"cost":0,
 　　　　　　　　"callbacked":0,
 　　　　　　　　"gmtCreate":"2018-04-04 15:01:40",
 　　　　　　　　"gmtModified":"2018-04-04 15:32:23",
 　　　　　　　　"propertiesMap":{
 　　　　　　　　　　"客户名称":"曹文浩",
 　　　　　　　　　　"联系方式":"17751279857"
 　　　　　　　　}
 　　　　　　},
 　　　　　　"taskResult":[
 　　　　　　　　{
 　　　　　　　　　　"sceneInstanceResultId":955,
 　　　　　　　　　　"companyId":241,
 　　　　　　　　　　"sceneInstanceId":5357,
 　　　　　　　　　　"resultName":"客户意向等级",
 　　　　　　　　　　"resultValue":"C级(很少)",
 　　　　　　　　　　"resultDesc":"该客户只听取了很少的产品介绍就结束了通话。",
 　　　　　　　　　　"analyzeType":"BY_ANALYZE_USER_LEVEL",
 　　　　　　　　　　"gmtCreate":"2018-04-04 15:03:39",
 　　　　　　　　　　"gmtModified":"2018-04-04 15:03:39"
 　　　　　　　　}
 　　　　　　],
 　　　　　　"phoneLog":{
 　　　　　　　　"phoneLogs":[
 　　　　　　　　　　{
 　　　　　　　　　　　　"sceneInstanceLogId":4762,
 　　　　　　　　　　　　"sceneInstanceId":5357,
 　　　　　　　　　　　　"decisionId":455828,
 　　　　　　　　　　　　"speaker":"AI",
 　　　　　　　　　　　　"content":"哎，您好，拱墅区 中大银泰城边上有个首付50万左右的精装公寓你考虑吗？",
 　　　　　　　　　　　　"userMean":null,
 　　　　　　　　　　　　"userMeanDetail":null,
 　　　　　　　　　　　　"aiUnknown":false,
 　　　　　　　　　　　　"startTime":0,
 　　　　　　　　　　　　"endTime":0,
 　　　　　　　　　　　　"gmtCreate":"2018-04-04 15:03:31",
 　　　　　　　　　　　　"gmtModified":"2018-04-04 15:03:31"
 　　　　　　　　　　}
 　　　　　　　　],
 　　　　　　　　"luyinOssUrl":"https://byrobot-test.oss-cn-hangzhou.aliyuncs.com/RobotPhoneCommunicate/5357/HNZVBAMHQUGTEWVMJRBNTVMFQWSVFDEL.wav"
 　　　　　　}
 　　　　}
 　　},
 　　"resultMsg":"成功",
 　　"errorStackTrace":null
 }
 
  ```


###访问方式：
 
 POST
 
 
###请求参数:
 
 参数名 | 类型  | 描述  
 --------- | ------- | ------ 
  dataType| String | 回调类型 |
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
  breakEndTime| String | 暂时停止结束时间 |
  status| Integer | 任务状态, 0:未开始,1:进行中,2:已完成,4:用户暂停,5:系统暂停,6:已终止 |
  duration| Integer  | 通话时长 |
  chatRound| Integer | 通话轮次 |
  startTime| String | 开始拨打时间 |
  endTime| String | 结束拨打时间 |
  callerPhone| String | 主叫电话 |
  luyinOssUrl| Integer | 通话录音 |
  callType| Integer | 拨打类型 0: 免费试用 1: 任务 2: 用户单独拨打 3: 收费试用 4:Ope后台拨打 100: 人工拨打 |
  readStatus| Integer | 是否已读 0: 未读 1: 已读 |
  robotDefId| String | 关联的机器人id |
  sceneDefId| String | 场景ID | 
  sceneRecordId| List | 关联的录音id | 
  trackResult| List | bug追踪结果 | 
  jobName| List | 任务名称 | 
  hangUp| List | 挂机人, 0: AI 1: 用户 |
  taskResult| String | 任务结果分析 |
  

 
 
###响应：
 
 参数名 | 类型 | 描述 
 --------- | ------- |------
  code|integer | 响应码 |
  data| object | 返回实体 |
  resultMsg| String | 响应说明 |
  errorStackTrace| String | 接口异常说明 |

##任务完成详情回调

 
###功能说明：
 
 当一次任务完成后，百应机器人会自动调用回调程序向用户配置的回调地址，发送本次任务详情。
 
 如果本次发送由于网络等原因发送失败，机器人会自动发起二次发送。
 
 最多回调10次，每次回调时长按1分钟，2分钟，4分钟，8分钟间隔依次递增，回调成功后，处理方应当返回字符串success在返回的body体中
  
 <aside class="notice">
 请您在对接接口前，务必配置好回调地址。否则回调将无法成功
 </aside>
 
 >入参JOSN实例:
 
  ```
 {
 	"code": 200,
 	"data": {
 		"dataType": "JOB_INFO_RESULT",
 		"data": {
 			"callJobId": 535,
 			"companyId": 243,
 			"jobName": "测试-问题学习",
 			"jobType": 2,
 			"startDate": "2018-04-25",
 			"endDate": "2018-04-25",
 			"workingStartTime": "09:00:00",
 			"workingEndTime": "20:00:00",
 			"breakStartTime": null,
 			"breakEndTime": null,
 			"status": 2,
 			"callType": 1,
 			"robotDefId": 278,
 			"sceneDefId": 283,
 			"sceneRecordId": 280,
 			"remark": "",
 			"smsType": 0,
 			"smsCondition": null,
 			"smsTemplateId": null,
 			"userId": 241,
 			"userName": "步婉",
 			"ip": "172.16.67.104",
 			"hostName": "byrobot-daily",
 			"version": 1,
 			"secondaryStartTime": "09:00:00",
 			"jobIsDelete": false,
 			"gmtCreate": "2018-04-25 11:11:45",
 			"gmtModified": "2018-04-25 11:17:19"
 		}
 	},
 	"resultMsg": "执行成功",
 	"errorStackTrace": null
 }
 
  ```


###访问方式：
 
 POST
 
 
###请求参数:
 
 参数名 | 类型  | 描述  
 --------- | ------- | ------ 
  dataType| String | 回调类型 |
  callJobId| List | 任务id |
  companyId| Integer | 公司id |
  jobName| String |任务名称|
  jobType| Integer | 任务类型：1-定时，2-手动 |
  startDate| String | 任务开始时间 |
  endDate| String |任务结束时间|
  workingStartTime| String | 可拨打起始时间 |
  workingEndTime| String | 可拨打结束时间 |
  breakStartTime| Integer |午休起始时间|
  breakEndTime| Integer | 午休结束时间 |
  status| String | 状态, 0: 未开始，1: 进行中，2: 已完成，3: 可运行，4: 用户暂停，5-系统暂停，6-已终止 |
  callType| Integer | 外呼方式:0-手机号,1-固话,2-无主叫 |
  robotDefId| Integer |关联的机器人id|
  sceneDefId| Integer | 场景id |
  sceneRecordId| Integer |关联的录音id|
  remark| String  | 备注 |
  smsType| Integer | 是否发送挂机短信：0-否，1-是 |
  smsCondition| String | 发送挂机短信条件，json格式 |
  smsTemplateId| String | 发送挂机短信的模板 |
  userId| Integer | 创建人id |
  userName| String | 创建人名称 |
  ip| Integer |任务执行IP|
  hostName| Integer |任务执行主机|
  version| Integer | 锁版本号 |
  secondaryStartTime| String | 二次启动job的时间 | 
  jobIsDelete| Boolean | job是否已经删除 false：没有删除 true：已经删除 | 

  

 
 
###响应：
 
 参数名 | 类型 | 描述 
 --------- | ------- |------
  code|integer | 响应码 |
  data| object | 返回实体 |
  resultMsg| String | 响应说明 |
  errorStackTrace| String | 接口异常说明 |
