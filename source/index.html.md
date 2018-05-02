---
title: API Reference

includes:
  - errors
  - company
  - task
  - ObtainTask
  - CallBack
search: true
---

# 介绍
百应机器人API文档

这是百应机器人API文档，具体查看详情每个API接口调用说明；

如果有问题，欢迎联系我们客服，技术支持

公司官网地址 ：[www.byrobot.cn/](https://www.byrobot.cn/)
 
# 认证    

> 认证密钥样例

```java
  APP_KEY = "WtSMaJWdODxVotvy";
  APP_SECRET = "aXSFnnZbHCVnowXJSROZyJPRMguz1Q";    
```

API认证采用HMACSha1加密算法进行机密，使用时间戳、APP_KEY、APP_SECRET共同生成一个密钥。

目前已有完成JAVA版的样例，具体实现请下载SDK查阅。


> 请在API样例`byrobot-openapi-demo`中替换为自己的APP_Key和APP_SECRET.

百应为确保您的账户和信息安全，请在开发对接程序前联系百应技术支持注册接口调用专属密钥。

<aside class="notice">
您必须替换对接密钥 <code>APP_KEY 和 APP_SECRET </code>在您的对接程序中 
</aside>

# 开发引导

## 调用说明

百应机器人API是使用HTTP并遵循REST原则设计的Web服务接口；

您可以使用几乎任何客户端和任何编程语言与REST API进行交互。

通过发送简单的HTTP请求就可以轻松接入使用。

## 统一请求格式

URL格式：

<code>/{resource}/{function}</code>

说明： 

{resource}为资源名，通常对应一类API

{function}为该资源提供的操作方法

请求响应的结果为json格式

>比如查询公司列表的url为：
  
```请求URL样例  
<code>http://openapi/v1/company </code> 表示调用company（公司列表）的get方法，并且返回json格式的字符串。

我们目前已经提供的接口，请参考API。 

```

HTTP头信息:

<code>Accept:application/json;charset=utf-8</code>

<code>Content-Type:application/x-www-form-urlencoded;charset=utf-8</code>

说明：

请求方式(Method)：统一用POST方式
编码：UTF-8
最佳实践：

请使用发短信接口
可以自动匹配模板，开发更简单
请设置好IP白名单
IP白名单可以有效提高账户安全性
请补充完整您的账户资料信息
包括设置余额提醒阈值、联系人和紧急联系人的联系方式等账户信息，方便我们提供更好的服务
>

##SDK下载

本页面提供Java的SDK下载。

SDK包内有部分使用说明，各接口的详细使用说明请浏览各API详情页。

如百应未提供您使用语言的SDK，您可以根据API文档开发接口

语言 | GitHub地址 
--------- | ------- 
JAVA | [GitHub地址](https://github.com/indata-public/byrobot-openapi-demo) 


##流程图:

 ![](images/OMS1.png)
 
##流程说明

###第一部分:

主要是获取公司相关信息，为创建任务提供数据。

这里一共三个接口分别查询到：公司Id，主叫话术列表，机器人话术Id。

###第二部分:

核心业务部分，主要是任务的创建，启动，停止等操作。

首先创建任务（添加第一部分查询到的公司信息），接着向任务中导入客户信息；

开启任务后可以选择暂停任务或停止任务；

在任务进行中，每一次通话结束都会调用通话回调接口，将本次通话详情发送到指定回调地址。

###第三部分:

任务运行结束，调用任务回调接口，将本次任务信息发送到指定回调地址。

###第四部分:

主要是查询任务相关信息。
 
##枚举类型说明

### 电话卡类型Enum
 
code    | desc 
--------- | ------- 
0 | 手机 
1 | 阿里云固话 
2 | 无主叫固话

### 任务类型Enum
 
code    | desc 
--------- | ------- 
1 | 定时启动任务
2 | 手动启动任务 


### 外呼类型Enum
原类型
外呼类型，0-sim卡（默认）, 1-固话, 2-无主叫
没有找到枚举类
 
code    | desc 
--------- | ------- 
 | 定时启动任务
2 | 手动启动任务 

### 是否发送短信Enum
 
code    | desc 
--------- | ------- 
0 | 否
1 | 是 



### 任务状态Enum
 
code    | desc 
--------- | ------- 
0| 未开始
1| 进行中
2| 已完成
3| 可运行
4| 用户暂停
5| 系统暂停
6| 已终止
7| 排队中
8| AI到期

### 任务实例状态Enum
 
code    | desc 
--------- | ------- 
0| 未开始
1| 进行中
2| 已完成
3| 二次拨打调度中


### 任务实例已完成状态Enum
code   | desc
----|-----
0| 已接听
1| 拒接
2| 无法接通
3| 主叫号码不可用
4| 空号
5| 关机
6| 占线
7| 停机
8| 未接
9| 主叫欠费

### 呼叫类型Enum
code   | desc
----|-----
0|免费试用
1|任务
2|用户单独拨打
3|收费试用
4|Ope后台拨打
5|大屏试用
100|客服人工拨打




