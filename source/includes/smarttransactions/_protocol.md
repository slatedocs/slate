# Protocol

>Request:

```
xml
<sendNotification>
   <notification>
      <details>
         #
         # details
         #
      </details>
      <id>push_id</id>
      <pushContent>
         #
         # pushContent
         #
      </pushContent>
      <recipients>login_1</recipients>
      <recipients>login_2</recipients>
      <timeout>1000</timeout>
   </notification>
</sendNotification>
```

>Response:

```
xml
<sendNotificationResponse xmlns:ns2="http://inbound.sbi.pigeon.idamobile.com/">
   <return>
      <status>OK</status>
      <deliveryStatus>
         <entry>
            <key>login_1</key>
            <value>QUEUED</value>
         </entry>
         <entry>
            <key>login_2</key>
            <value>INVALID_SUBSCRIPTION</value>
         </entry>
      </deliveryStatus>
   </return>
</sendNotificationResponse>
```