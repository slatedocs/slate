---
title: iDa Mobile API

language_tabs:
  - xml : WSDL

toc_footers:
  - <a href='http://www.idamob.ru'>@ copyright iDa Mobile 2016</a>

includes:

search: false
---

# API Documents

>request:

~~~xml
<getRequest>
    <request>
        <id>id</id>
        <param_01>param</param_01>
        <param_02>param</param_02>
    </request>
</getRequest>
~~~

>response:

~~~xml
<getResponse>
    <return>
        <param_01 type="type">
            <currency>RUB</currency>
            <fxAmount>100</fxAmount>
        </param_01>
        <lastUpdateTime>2015-08-25T21:13:08.000+03:00</lastUpdateTime>
    </return>
</getResponse>
~~~

>log:

~~~text
19-09-2016_15:59:44 [https-jsse-nio-9443-exec-10] DEBUG - PRO=>Bank [get] GetDTO(id=id, param_01=param, param_02=param)
19-09-2016_15:59:45 [https-jsse-nio-9443-exec-10] ERROR - org.apache.axis2.AxisFault: Read timed out
~~~

[![image](button_pro.svg "iDa Pro API")](https://doc.idamob.ru/pro)
[![image](button_light.svg "iDa Light API")](https://doc.idamob.ru/light)
[![image](button_pigeon.svg "iDa PiGeon API")](https://doc.idamob.ru/pigeon)
[![image](button_st.svg "iDa SmartTransactions API")](https://doc.idamob.ru/smarttransactions)
[![image](button_vh.svg "iDa Version History")](https://doc.idamob.ru/history)
