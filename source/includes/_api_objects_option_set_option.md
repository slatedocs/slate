# Product Option Set Options

|||
|---|---|
| Managed by | [Option Set Options Resource](/api/stores/v2/option_sets/options)

## Option Set Option Object - Properties

| Name | Type | Description |
| --- | --- | --- |
| id | int |
| option_id | int | The id of the option this optionset connects to |
| option_set_id | int |
| display_name | string | The friendly name used for this optionset |
| sort_order | int | The order in which the option is displayed on the product page |
| is_required | boolean | Specifies whether customer is required to enter value for this option before they can add the product to their cart |
| option | resource |
| values | object_array |
