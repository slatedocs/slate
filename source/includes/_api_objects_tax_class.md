# Tax Class

The tax_class object contains the ID and name of the tax class used to calculate tax for stores using manually created tax classes. NOTE: Data inside the tax_class object of a store configured to use automatic taxes is ignored during tax calculations.

|||
|---|---|
| Managed by | [Tax Classes Resource](/api/stores/v2/tax_classes)

## Properties

| Name | Type | Description |
| --- | --- | --- |
| id | int | The unique numerical ID of the tax class. A read-only value which is automatically assigned and increments sequentially. |
| name | string | The name of the tax class. 
