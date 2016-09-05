## BeneficiaryCategoryDTO

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | идентификатор категории бенефициара
name | string | 1..1 | название категории бенефициара
beneficiaries | [BeneficiaryDTO](#beneficiarydto) | 1..1 | список бенефициаров, входящих в категорию
logoResource | [LogoResource](#logoresource) | 0..1 | url для доступа к логотипу
