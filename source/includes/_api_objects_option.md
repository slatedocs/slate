|||
|---|---|
| Managed by | [Options Resource](/api/stores/v2/options)


## Properties

| Name | Type | Description |
| --- | --- | --- |
| `id` | `int` |
| `name` | `string` | The name of the option. Must be unique. |
| `display_name` | `string` | Friendly name displayed to the customer |
| `type` | `string` | The type of option (N, D, MT, C, F, T, RB, RT, S, P, PI, CS) N - Numbers only text D - Date MT - Multiline text C - Checkbox F - File T - Text RB - Radio list RT - Rectangle list S - Select box P - Product list PI - Product list with images CS - Swatch |
| `values` | `resource` |