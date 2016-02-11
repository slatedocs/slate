# Products

## Attributes

Parameter | Description
--------- | -----------
product_name | Name of product
created_at | The Date when product is created
keywords | Product keywords defined during category creation
detailed_description | Detailed Description about the product usually rendered as a paragraph
logistic_details | Contains logistic details of the product
logistic_details[delivery_charges] | Delivery charges for the product (part of logistic_details)
delivery_details | Delivery descriptions for the product (part of logistic_details)
packaging_details | Packaging descriptions for the product (part of logistic_details)
minimum_order_quantity | Minimum order that the seller or Bizongo can supply
minimum_order_units | Units for Minimum order
supply_ability_quantity | Maximum order that the seller or Bizongo can supply
supply_ability_units | Units for Maximum order
quoted_price | Product Quoted price for a specific unit
quoted_price_units | Unit for product quoted price
payment_details | Details about payment
cst_vat_enabled | Check whether CST/VAT is enabled or not (part of payment_details)
cst_vat_tax | CST/VAT tax value (part of payment_details)
excise_tax_enabled | Check whether excise is enabled or not (part of payment_details)
excise_tax | Excise tax value (part of payment_details)
specifications | Specifications for the product
brand_name | Brand Name for the product
text_fields_specifications | Specifications of the product represented as text-boxes
checkable_specifications | Specifications of the product represented as multiple check-fields
dropdown_specifications | Specifications of the product represented as dropdown-box
other_specifications | Specification added by the user or admin and is not predefined
sellable | Deciding factor for whether the product is bulk or sellable
category_id |  Category id for the product category

## Auto-Populated New Product

> To get predefined specifications for a product use this code:

```http
GET /api/products/new?category_id=$['Product_Category_id']&product_name=$['Your_Product_name'] HTTP/1.1
Host: bizongo.in
Content-Type: application/json
Authorization: Token token="USER AUTH TOKEN"
```
> Variables `Product_Category_id` and `Your_Product_name` contains values for category id and name of the product. `User Auth Token` is the auth token value returned to user on sign in. This is success response returned for a sample product searched in `Crates` category with auto-populated values.

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
  "keyword": {
    "values": "Multi Purpose Crates, Fruit & Vegetable Crates",
    "options": "Multi Purpose Crates, Dairy Crates, Fruit & Vegetable Crates, Dairy Crates"
  },
  "specifications": {
    "text_fields_specifications": {
      "Capacity": {
        "optional": false,
        "value": "10"
      }
    },
    "checkable_specifications": {
      "Color": {
        "options": "Blue, Bronze, Brown",
        "values": "Blue, Brown",
        "optional": true
      },
      "Material": {
        "options": "Wood, Steel, Stainless Steel, Paper",
        "optional": true
      }
    },
    "dropdown_specifications": {
      "Original": {
        "options": "yes, no",
        "value": "yes",
        "optional": true
      }
    }
  }
}
```

Bizongo uses the auth-token to allow access to the new product API and sends back an response which tells us about the specification for the product to be added. This api also returns auto-populated values of product if product is present in search. These specifications have already been defined by the admin they are either optional or required based on `optional` parameter.

Bizongo expects the header `Authorization` to be present in the following 'format'

`Authorization: Token token=User Auth Token`

## Create a Product

> To create a product refer this sample code:

```http
POST  /api/products HTTP/1.1
Host: bizongo.in
Authorization: Token token="USER AUTH TOKEN"
Content-Type: application/json
{
  "product": {
    "name": "300X400 Crates"
    "created_at": "1/02/2016",
    "keyword": "Multi Purpose Crates, Fruit & Vegetable Crates",
    "specifications": {
      "category_specifications": {
        "Capacity": "10",
        "Material": "Wood",
        "Color": "Blue, Bronze"
      },
      "other_specifications": {
        "Lid": "Completely Closed"
      }   
    },
    "brand_name": "Aristo",
    "minimum_order_quantity": "100",
    "minimum_order_units": "Pieces",
    "supply_ability_quantity": "10000",
    "supply_ability_units": "Pieces",
    "quoted_price": "1000",
    "quoted_price_units": "Piece",
    "logistic_details": {
      "delivery_details": "Delivered all over India",
      "packaging_details": "Packaged in single day"
    },
    "sellable": false,
    "payment_details": {
      "cst_vat_enabled": true,
      "cst_vat_tax": "5",
      "excise_tax_enabled": "true",
      "excise_tax": "10"
    },  
    "detailed_description" : "Extremely sensitive",
    "product_images" : ["1", "2", "3"]
  },
  "category_id": "2",   
}
```

> `USER AUTH TOKEN` is the auth token value returned to user on sign in. This is a success response on creation of the product.


```http
HTTP/1.1 201 CREATED
Content-Type: application/json
{
  "product_id" : "47"
}
```
Bizongo uses the auth-token to allow access to the create product API. This api requests product details and on successfully creating the product returns product_id.

Bizongo expects the header `Authorization` to be present in the following 'format'

`Authorization: Token token=User Auth Token`
