## BeneficiaryDTO

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | уникальный идентификатор
name | string | 1..1 | название бенефициара
formId | string | 1..1 | идентификатор формы платежа, соответствующей бенефициару
logoResource | [LogoResource](#logoresource) | 0..1 | url для доступа к логотипу
