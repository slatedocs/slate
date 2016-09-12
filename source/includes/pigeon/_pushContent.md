## pushContent

```xml
<pushContent>
    <badge>0</badge>
   <details>
      <entry>
         <key>target</key>
         <value>nil</value>
      </entry>
   </details>
   <sound>default</sound>
   <text>Текст для отображения в шторке телефона</text>
   <type>UNIVERSAL</type>
</pushContent>
```

Дополнительные детали по пушу или экран ошибки

key | type | status | comment
--- | --- | :---: | ---:
badge | int | 1..1 | бэйджик на иконке App с количеством сообщений. перезаписывается при каждом новом пуше
sound | string | 0..1 | по умолчанию default
text | string | 1..1 | текст для пуша в шторке мобильного
type | [pushType](#pushtype) | 1..1 | тип сообщения
target | string | 1..1 | в зависимости от типа пуша передается id формы, точки, код подтверждения… или nil

<aside class="error">Размер данной части сообщения не должен превышать 256B в протовном случае сервер Apple не примет</aside>
