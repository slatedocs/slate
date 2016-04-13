|||
|---|---|
| Managed by | [Categories Resource](/api/stores/v2/categories)

## Properties

| Name | Type | Description |
| --- | --- | --- |
| `id` | `int` | A read-only field containing the unique numeric identifier of this category. |
| `parent_id` | `int` | The ID of the parent category this category belongs to. NOTE: the total number of parent categories cannot exceed seven. |
| `name` | `string` | The name of the category. Must be unique. |
| `description` | `text` | A description for the category |
| `sort_order` | `int` | The sort order of the category |
| `page_title` | `string` | The page title for the category page |
| `meta_keywords` | `text` | Comma separated list of meta keywords to include in the HTML |
| `meta_description` | `text` | A meta description to include |
| `layout_file` | `string` | A valid layout file. Refer to this article on creating category files. |
| `parent_category_list` | `array` | A read-only field containing the ID of this category and the ID of its parent category, if any. |
| `image_file` | `string` | A valid image |
| `is_visible` | `boolean` | Is the category visible? |
| `search_keywords` | `string` | A comma separated list of keywords that can be used to locate this brand |
| `url` | `string` | The context path of this category. |