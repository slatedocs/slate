# Customer Groups

Grouping of customers who share the same level of access and discounts at a store

|||
|---|---|
| **Managed by** | [Customer Groups Resource](/api/stores/v2/customer_groups)

## Customer Group - Properties

| Name | Type | Description |
| --- | --- | --- |
| id | int |
| name | string | Name of the group |
| is_default | boolean | Determines whether new customers are assigned to this group by default |
| category_access | object | Determines which categories customers in this group have access to view and order products from. type is an enum specifying the method of category access applied to customers in this group: all: customers can access all categories specific: customers can access a specific list of categories none: customers are prevented from viewing any of the categories in this group categories is an array of category ids and should only be supplied if type is specific. |
| discount_rules | object_array | A collection of discount rules which are automatically applied for customers who are members of the group. All discount rules have the following properties: type is an enum specifying the type of discount rule: all: a store-wide rule (applies to everything) product: a rule applying to a specific product category: a rule applying to a specific category method is an enum which specifies a price modifying strategy: price modify the price by the given amount percent modify the price by the given percentage fixed modify the price with a fixed discount amount is a decimal which specifies the value applied to the price modifier product and category rules also require a product_id or category_id field, respectively. |
