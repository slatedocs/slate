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
cst_enabled | Check whether CST/VAT is enabled or not (part of payment_details)
cst_tax | CST/VAT tax value (part of payment_details)
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

## Get Product

```http
HTTPS/1.1 200 OK
Content-Type: application/json
{
    "id": "5652",
    "slug": "disposable-plastic-container-round-black-500-ml-damati",
    "name": "Disposable Plastic Container Round Black 500 ml | Damati",
    "url": "http://localhost:3000/products/disposable-plastic-container-round-black-500-ml-damati",
    "last_ordered_on": 1455177085,
    "primary_image": {
        "original": "https://bizongo-production.s3.amazonaws.com/uploads/picture/image/13699/1.png",
        "thumb_36": "https://bizongo-production.s3.amazonaws.com/uploads/picture/image/13699/thumb_36_1.png",
        "thumb_64": "https://bizongo-production.s3.amazonaws.com/uploads/picture/image/13699/thumb_64_1.png",
        "thumb_128": "https://bizongo-production.s3.amazonaws.com/uploads/picture/image/13699/thumb_128_1.png",
        "normal_128": "https://bizongo-production.s3.amazonaws.com/uploads/picture/image/13699/normal_128_1.png"
    },
    "images": [
        {
            "original": "https://bizongo-production.s3.amazonaws.com/uploads/picture/image/13699/1.png",
            "thumb_36": "https://bizongo-production.s3.amazonaws.com/uploads/picture/image/13699/thumb_36_1.png",
            "thumb_64": "https://bizongo-production.s3.amazonaws.com/uploads/picture/image/13699/thumb_64_1.png",
            "thumb_128": "https://bizongo-production.s3.amazonaws.com/uploads/picture/image/13699/thumb_128_1.png",
            "normal_128": "https://bizongo-production.s3.amazonaws.com/uploads/picture/image/13699/normal_128_1.png"
        },
        {
            "original": "https://bizongo-production.s3.amazonaws.com/uploads/picture/image/13698/1.jpg",
            "thumb_36": "https://bizongo-production.s3.amazonaws.com/uploads/picture/image/13698/thumb_36_1.jpg",
            "thumb_64": "https://bizongo-production.s3.amazonaws.com/uploads/picture/image/13698/thumb_64_1.jpg",
            "thumb_128": "https://bizongo-production.s3.amazonaws.com/uploads/picture/image/13698/thumb_128_1.jpg",
            "normal_128": "https://bizongo-production.s3.amazonaws.com/uploads/picture/image/13698/normal_128_1.jpg"
        }
    ],
    "discount": "20",
    "sellable": true,
    "created_at": 1441961472,
    "status": "APPROVED",
    "remarks": "",
    "minimum_order_quantity": "500",
    "minimum_order_units": "Pieces",
    "supply_ability_quantity": "no limit",
    "supply_ability_units": "No unit",
    "payment_terms": "NEFT/RTGS",
    "company_name": "Justice League",
    "quoted_price": "On request",
    "quoted_price_units": "No unit",
    "product_specifications": {
        "brand_name": "Damati",
        "tags": "Plastic Containers",
        "category_specifications": [
            [
                "Usage",
                "Used for packing food"
            ],
            [
                "Color",
                "Black"
            ],
            [
                "Model No.",
                "DP-CC-16 oz "
            ],
            [
                "Volume",
                "500ml"
            ],
            [
                "Material",
                "PP"
            ]
        ],
        "other_specifications": [
            [
                "Shape ",
                "Round"
            ]
        ],
        "search_tags": "Food Container, Damati Container"
    },
    "specifications": {
        "brand_name": "Damati",
        "tags": "Plastic Containers",
        "text_fields_specifications": {
          "Usage": {
            "optional": false,
            "value": "10"
          }
        },
        "checkable_specifications": {
          "Color": {
            "options": "Blue, Bronze, Brown, Black",
            "values": "Black",
            "optional": true
          },
          "Material": {
            "options": "Wood, Steel, Stainless Steel, Paper",
            "optional": true
          }
        }
        "other_specifications": {
          "Lid": "Completely Closed"
        }
        "category_specifications": [
            [
                "Usage",
                "Used for packing food"
            ],
            [
                "Color",
                "Black"
            ],
            [
                "Model No.",
                "DP-CC-16 oz "
            ],
            [
                "Volume",
                "500ml"
            ],
            [
                "Material",
                "PP"
            ]
        ],
        "other_specifications": [
            [
                "Shape ",
                "Round"
            ]
        ],
        "search_tags": "Food Container, Damati Container"
    },
    "logistic_details": {
        "delivery_details": "Goods will be dispatched in 3-4 days",
        "packaging_details": "500 Pieces Per Carton",
        "distribution_centers": []
    },
    "detailed_description": "<p class=\"line\" id=\"line-1\">Our motto at <b>Damati</b> is to produce optimal quality through ethical business practices and sound values. With a highly skilled team on board and using only the latest in technology, we constantly strive to achieve excellence.</p><p class=\"line\" id=\"line-15\">We believe that the consumer is king and lay emphasis on catering to every need our clients have – a strategic shift from the product centric approach the company initially employed. Keeping that in mind, our new range of <i>Disposable Plastic, Paper and Multipurpose Packaging</i> products are designed to deliver superlative results to our distributors and consumers.</p>",
    "supplier": {
        "name": "Justice League",
        "business_type": "Manufacturer",
        "verified": true,
        "location": "Gotham City, Daman & Diu, US",
        "address": "Wayne Enterprises Tower",
        "pincode": "160022",
        "avatar": {
            "original": "https://bizongo-production.s3.amazonaws.com/uploads/company/avatar/1547/Justice_League_Logo.png",
            "thumb_250": "https://bizongo-production.s3.amazonaws.com/uploads/company/avatar/1547/profile_250_Justice_League_Logo.png"
        }
    },
    "added_by": {
        "id": "189",
        "name": "Raman ",
        "email": "connect@athenasuperpack.com"
    },
    "sample": {
        "id": 8048,
        "selling_price": 1,
        "tax": 5,
        "selling_price_with_tax": 1,
        "selling_price_per_unit": 1,
        "active": true,
        "sample": true,
        "actual_price_with_tax": 0,
        "seller_price_with_tax": 0,
        "actual_price": 0,
        "seller_price": 0,
        "actual_price_per_unit": 0,
        "seller_price_per_unit": 0,
        "per_unit": true,
        "stock": 999,
        "payable_to_seller": 0,
        "minimum_quantity": 1,
        "maximum_quantity": 100,
        "sku": [
            {
                "id": 14103,
                "name": "Volume",
                "value": "500",
                "unit": "ml"
            },
            {
                "id": 14104,
                "name": "Pack",
                "value": "1",
                "unit": "Piece"
            }
        ],
        "unit": "Piece"
    },
    "child_products": [
        {
            "id": 5762,
            "selling_price": 2500,
            "tax": 5,
            "selling_price_with_tax": 2625,
            "selling_price_per_unit": 5,
            "active": true,
            "sample": false,
            "actual_price_with_tax": 3281,
            "seller_price_with_tax": 2625,
            "actual_price": 3125,
            "seller_price": 2500,
            "actual_price_per_unit": 6.25,
            "seller_price_per_unit": 5,
            "per_unit": true,
            "stock": 90,
            "payable_to_seller": 2415,
            "minimum_quantity": 1,
            "maximum_quantity": 100,
            "sku": [
                {
                    "id": 10162,
                    "name": "Volume",
                    "value": "500",
                    "unit": "ml"
                },
                {
                    "id": 10161,
                    "name": "Pack",
                    "value": "500",
                    "unit": "Pieces"
                }
            ],
            "unit": "Piece"
        },
        {
            "id": 7597,
            "selling_price": 7200,
            "tax": 5,
            "selling_price_with_tax": 7560,
            "selling_price_per_unit": 4.8,
            "active": true,
            "sample": false,
            "actual_price_with_tax": 9450,
            "seller_price_with_tax": 7560,
            "actual_price": 9000,
            "seller_price": 7200,
            "actual_price_per_unit": 6,
            "seller_price_per_unit": 4.8,
            "per_unit": true,
            "stock": 1000,
            "payable_to_seller": 7245,
            "minimum_quantity": 1,
            "maximum_quantity": 1000,
            "sku": [
                {
                    "id": 13190,
                    "name": "Volume",
                    "value": "500",
                    "unit": "ml"
                },
                {
                    "id": 13191,
                    "name": "Pack",
                    "value": "1500",
                    "unit": "Pieces"
                }
            ],
            "unit": "Piece"
        },
        {
            "id": 7989,
            "selling_price": 1250,
            "tax": 5,
            "selling_price_with_tax": 1313,
            "selling_price_per_unit": 5,
            "active": true,
            "sample": false,
            "actual_price_with_tax": 1641,
            "seller_price_with_tax": 1313,
            "actual_price": 1562.5,
            "seller_price": 1250,
            "actual_price_per_unit": 6.25,
            "seller_price_per_unit": 5,
            "per_unit": true,
            "stock": 89,
            "payable_to_seller": 1208,
            "minimum_quantity": 1,
            "maximum_quantity": 100,
            "sku": [
                {
                    "id": 13996,
                    "name": "Volume",
                    "value": "500",
                    "unit": "ml"
                },
                {
                    "id": 13997,
                    "name": "Pack",
                    "value": "250",
                    "unit": "Pieces"
                }
            ],
            "unit": "Piece"
        },
        {
            "id": 8048,
            "selling_price": 1,
            "tax": 5,
            "selling_price_with_tax": 1,
            "selling_price_per_unit": 1,
            "active": true,
            "sample": true,
            "actual_price_with_tax": 0,
            "seller_price_with_tax": 0,
            "actual_price": 0,
            "seller_price": 0,
            "actual_price_per_unit": 0,
            "seller_price_per_unit": 0,
            "per_unit": true,
            "stock": 999,
            "payable_to_seller": 0,
            "minimum_quantity": 1,
            "maximum_quantity": 100,
            "sku": [
                {
                    "id": 14103,
                    "name": "Volume",
                    "value": "500",
                    "unit": "ml"
                },
                {
                    "id": 14104,
                    "name": "Pack",
                    "value": "1",
                    "unit": "Piece"
                }
            ],
            "unit": "Piece"
        }
    ]
}
```

## Find Product

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
      "text_fields_specifications": {
        "Capacity": "10"
      },
      "checkable_specifications": {
        "Color": "Blue, Bronze"
      },
      "dropdown_specifications": {
        "Material": "Wood"
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
      "cst_enabled": true,
      "cst_tax": "5",
      "excise_enabled": true,
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

##  a product

```http
GET /api/products/$['product_id'] HTTP/1.1
Host: bizongo.in
Authorization: Token token="USER AUTH TOKEN"
```

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
  "name": "300X400 Crates"
  "created_at": "1/02/2016",
  "keyword": "Multi Purpose Crates, Fruit & Vegetable Crates",
  "specifications": {
    "text_fields_specifications": {
      "Capacity": "10"
    },
    "checkable_specifications": {
      "Color": "Blue, Bronze"
    },
    "dropdown_specifications": {
      "Material": "Wood"
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
    "cst_enabled": true,
    "cst_tax": "5",
    "excise_enabled": "true",
    "excise_tax": "10"
  },  
  "detailed_description" : "Extremely sensitive",
  "primary_image": {
  "id": "10",  
  "original": "https://bizongo-staging-2.s3.amazonaws.com/uploads/picture/image/333/11022016063647.jpeg",
  "thumb_36": "https://bizongo-staging-2.s3.amazonaws.com/uploads/picture/image/333/thumb_36_11022016063647.jpeg",
  "thumb_64": "https://bizongo-staging-2.s3.amazonaws.com/uploads/picture/image/333/thumb_64_11022016063647.jpeg",
  "thumb_128": "https://bizongo-staging-2.s3.amazonaws.com/uploads/picture/image/333/thumb_128_11022016063647.jpeg",
  "normal_128": "https://bizongo-staging-2.s3.amazonaws.com/uploads/picture/image/333/normal_128_11022016063647.jpeg"
  },
  "images": [{
    "id": "10",
    "original": "https://bizongo-staging-2.s3.amazonaws.com/uploads/company/avatar/6/UK_Creative_462809583.jpg"
    "thumb_36": "https://bizongo-staging-2.s3.amazonaws.com/uploads/picture/image/333/thumb_36_11022016063647.jpeg",
    "thumb_64": "https://bizongo-staging-2.s3.amazonaws.com/uploads/picture/image/333/thumb_64_11022016063647.jpeg",
    "thumb_128": "https://bizongo-staging-2.s3.amazonaws.com/uploads/picture/image/333/thumb_128_11022016063647.jpeg",  
    "normal_128": "https://bizongo-staging-2.s3.amazonaws.com/uploads/picture/image/333/normal_128_11022016063647.jpeg"
  },
  {
    "id": "11",
    "original": "https://bizongo-staging-2.s3.amazonaws.com/uploads/picture/image/335/11022016063658.jpeg",
    "thumb_36": "https://bizongo-staging-2.s3.amazonaws.com/uploads/picture/image/335/thumb_36_11022016063658.jpeg",
    "thumb_64": "https://bizongo-staging-2.s3.amazonaws.com/uploads/picture/image/335/thumb_64_11022016063658.jpeg",
    "thumb_128": "https://bizongo-staging-2.s3.amazonaws.com/uploads/picture/image/335/thumb_128_11022016063658.jpeg",
    "normal_128": "https://bizongo-staging-2.s3.amazonaws.com/uploads/picture/image/335/normal_128_11022016063658.jpeg"
  }]
}  
```

## Update a Product

```http
PUT /api/products/$['product_id'] HTTP/1.1
Host: bizongo.in
Authorization: Token token="USER AUTH TOKEN"
Content-Type: application/json
{
  "name": "300X400 Crates"
  "created_at": "1/02/2016",
  "keyword": "Multi Purpose Crates, Dairy Crates",
  "specifications": {
    "text_fields_specifications": {
      "Capacity": "30"
    },
    "checkable_specifications": {
      "Color": "Blue, Yellow"
    },
    "dropdown_specifications": {
      "Material": "Plastic"
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
    "cst_enabled": true,
    "cst_tax": "5",
    "excise_enabled": "true",
    "excise_tax": "10"
  },  
  "detailed_description" : "Extremely sensitive",
  "product_images" : ["1", "2", "3"]
}
```

```http
HTTP/1.1 200 OK
Host: bizongo.in
Authorization: Token token="USER AUTH TOKEN"
```
