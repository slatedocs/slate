## TemplateDTO

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | идентификатор шаблона
name | string | 1..1 | название шаблона
form | [FormDTO](#formdto) | 1..1 | соответствующая шаблону форма
filledForm | [FilledFormDTO](#filledformdto) | 1..1 | соответствующая шаблону заполненная форма
logoResource | [LogoResource](#logoresource) | 0..1 | url для доступа к логотипу
