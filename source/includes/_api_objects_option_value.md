# Product Option Values

|||
|---|---|
| Managed by | [Option Values Resource](/api/stores/v2/options/values)

## Product Object Value Object - Properties

| Name | Type | Description |
| --- | --- | --- |
| id | int | A unique, read-only value that identifies this option value. |
| option_id | int | A read-only value identifying the option that this option value is assigned to. |
| label | string | The name of the label. Cannot be the same as the label of another value already assigned to the option. |
| sort_order | int |
| value | text | Acceptable values generally depend on the option type, as defined in the option: "RB": string to be displayed to the customer; "RT": string to be displayed to the customer; "S": string to be displayed to the customer; "P": product ID; "PI": product ID; "CS": hexadecimal color code to create a color option, e.g., "#0f0000", a CSS 2.1 color name, e.g., "blue", or up to three hexadecimal color codes and/or color names separated by a pipe, e.g., "#FF0000|lime|#0000FF", or a URI to an image to create a texture http://store.com/images/myimg.png, or the name of an image file in the store's import folder, e.g., myimg.png. |
| is_default | boolean | Whether or not this value is selected by default. Only one option value can be selected by default for each option. |
