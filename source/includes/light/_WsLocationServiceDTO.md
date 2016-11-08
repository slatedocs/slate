## WsLocationServiceDTO

```xml
<services type="WsLocationServiceDTO">
   <description nil="true"/>
   <id>6aaccc31-b6d0-48af-bb04-d4c07d884df6</id>
   <logicalId>chf</logicalId>
   <name>i18n{"ru":"Операции с Швейцарским франком","en":"Swiss Franc operations"}</name>
   <parentId>currency</parentId>
</services>
<services type="WsLocationServiceDTO">
   <description>parent</description>
   <id>159b3b82-8391-44c0-8448-d7e1f0f344d1</id>
   <logicalId>currency</logicalId>
   <name>i18n{"ru":"Операции с наличными","en":"Cash operations"}</name>
   <parentId nil="true"/>
</services>
```

> Логический построитель фильтра на основе Service

```json
{  "parentId" : "Наименование раздела № 1",
   "elements" : [
      {  "name" : "Эленента № 1 в разделе № 1"  },
      {  "name" : "Эленента № 2 в разделе № 1"  }
   ]
}
```

Сервисы позволяют настроить более гибкий фильтр по точкам на карте

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | идентификатор
name | string | 1..1 | наименование
description | string | 0..1 | логическая принадлежность
logicalId | string | 1..1 | логический идентификатор
parentId | string | 0..1 | родительский логический блок
