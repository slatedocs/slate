---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - http

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

<!-- includes:
  - errors -->

search: true
---

# Introduction

Welcome to the Snappy API! You can use our API to access Snappy API endpoints, which can get information on various trackings, businesses and payments in our database.

We have language bindings in Http! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

# General Setting

## Environment

* Production base url: **https://pages.fm/api/v1**


# Authentication

Snappy uses `access_token` to allow access to the API. You can register a new Snappy's `access_token` by contact admin via hotline  02420.233.555 - 02421.233.555 (HN) and 0886.332.882 - 0886.334.884(HCM)

Snappy expects for the `access_token` to be included in almost API requests to the server as a param that looks like the following:

`Authorization: access_token`

<aside class="notice">
You must replace <code>access_token</code> with your personal access_token.
</aside>

# Geos

## Get Provinces

```http
GET /geo/provinces HTTP/1.1
```

> Response

```json
{
    "data": [
        {
            "id": "101",
            "name": "Hà Nội",
            "name_en": "ha noi"
        },
        {
            "id": "701",
            "name": "Hồ Chí Minh",
            "name_en": "ho chi minh"
        },
        {
            "id": "221",
            "name": "Bắc Giang",
            "name_en": "bac giang"
        },
        {
            "id": "207",
            "name": "Bắc Kạn",
            "name_en": "bac kan"
        },
        {
            "id": "821",
            "name": "Bạc Liêu",
            "name_en": "bac lieu"
        },
        ...
    ]
}
```

This endpoint retrieves all provinces.

### HTTP Request

`GET /geo/provinces`

## Get Districts

```http
GET /geo/districts HTTP/1.1
```

> Response

```json
{
    "data": [
        {
            "id": "10101",
            "name": "Quận Ba Đình",
            "name_en": "ba dinh"
        },
        {
            "id": "10129",
            "name": "Huyện Ba Vì",
            "name_en": "ba vi"
        },
        {
            "id": "10155",
            "name": "Quận Bắc Từ Liêm",
            "name_en": "bac tu liem"
        },
        {
            "id": "10113",
            "name": "Quận Cầu Giấy",
            "name_en": "cau giay"
        },
        {
            "id": "10141",
            "name": "Huyện Chương Mỹ",
            "name_en": "chuong my"
        },
        ...
    ]
}
```

This endpoint retrieves all districts of given province.

### HTTP Request

`GET /geo/districts`

### Query Parameters

Parameter | Required | Type    | Default | Description
--------- | ------- | ------- | ------- | -----------
province_id | true | string | | Province id of districts you want to retrieve. Get province id in api [GET /geo/provinces](#get-provinces)

## Get Communes

```http
GET /geo/communes HTTP/1.1
```

> Response

```json
{
    "data": [
        {
            "id": "1010115",
            "name": "Phường Cống Vị",
            "name_en": "cong vi"
        },
        {
            "id": "1010109",
            "name": "Phường Điện Biên",
            "name_en": "dien bien"
        },
        {
            "id": "1010113",
            "name": "Phường Đội Cấn",
            "name_en": "doi can"
        },
        {
            "id": "1010119",
            "name": "Phường Giảng Võ",
            "name_en": "giang vo"
        },
        {
            "id": "1010111",
            "name": "Phường Kim Mã",
            "name_en": "kim ma"
        },
        ...
    ]
}
```

This endpoint retrieves all communes of given district.

### HTTP Request

`GET /geo/communes`

### Query Parameters

Parameter | Required | Type    | Default | Description
--------- | ------- | ------- | ------- | -----------
district_id | true | string | | District id of communes you want to retrieve. Get district id in api [GET /geo/districts](#get-districts)

# Businesses

## Get All Businesses

```http
GET /snappy/users/me?access_token=<access_token> HTTP/1.1
```

> Response

```json
{
    "businesses": [
        {
            "addresses": [
                {
                    "address": "Số 1 ABC",
                    "commune_id": null,
                    "district_id": "10101",
                    "full_address": "SG1 - Số 1 ABC, Quận Ba Đình, Hà Nội",
                    "id": "82019ce2-088d-4cb1-8e8a-c6255d12ce6c",
                    "is_default": true,
                    "phone_number": "+84937123123",
                    "province_id": "101",
                    "zipcode": null
                }
            ],
            "business_payments": [],
            "id": 63,
            "inserted_at": "2018-04-17T15:07:49",
            "is_default": true,
            "is_owner": true,
            "last_payment_at": null,
            "name": "SG1",
            "owner_id": "14d4a1a1-ea42-4164-805d-e240f2561f71",
            "owner_name": "SG1",
            "packages": [],
            "payment_methods": [],
            "phone_number": "0937123123",
            "remaining_balance": 0,
            "total_balance": 0,
            "tracking_count": 3,
            "unique_name": "S61",
            "updated_at": "2018-04-17T15:14:26"
        }
    ],
    "data": {
        "email": "user37@gmail.com",
        "fb_id": null,
        "id": "14d4a1a1-ea42-4164-805d-e240f2561f71",
        "name": "SG1",
        "phone_number": "+84937123123"
    },
    "me": {
        "fb_id": null,
        "uid": "14d4a1a1-ea42-4164-805d-e240f2561f71"
    },
    "success": true,
    "uid": "14d4a1a1-ea42-4164-805d-e240f2561f71"
}
```

This endpoint retrieves all businesses and basic user info.

### HTTP Request

`GET /snappy/users/me`

### Query Parameters

Parameter | Required | Type    | Default | Description
--------- | ------- | ------- | ------- | -----------
access_token | true | string | | Your personal acess_token

## Get a Specific Business

```http
GET /snappy/businesses/<ID>?access_token=<access_token> HTTP/1.1
```

> Response

```json
{
    "business": {
        "addresses": [
            {
                "address": "Số 1 ABC",
                "commune_id": null,
                "district_id": "10101",
                "full_address": "SG1 - Số 1 ABC, Quận Ba Đình, Hà Nội",
                "id": "82019ce2-088d-4cb1-8e8a-c6255d12ce6c",
                "is_default": true,
                "phone_number": "+84937123123",
                "province_id": "101",
                "zipcode": null
            }
        ],
        "business_payments": [],
        "coupons": [],
        "id": 63,
        "inserted_at": "2018-04-17T15:07:49",
        "is_default": true,
        "is_owner": true,
        "last_payment_at": null,
        "name": "SG1",
        "owner_id": "14d4a1a1-ea42-4164-805d-e240f2561f71",
        "owner_name": "SG1",
        "packages": [],
        "payment_methods": [],
        "phone_number": "0937123123",
        "remaining_balance": 0,
        "total_balance": 0,
        "tracking_count": 3,
        "unique_name": "S61",
        "updated_at": "2018-04-17T15:14:26"
    },
    "success": true
}
```

This endpoint retrieves a specific business.

### HTTP Request

`GET /snappy/businesses/<ID>`

### URL Parameters

Parameter | Required | Type    | Default | Description
--------- | ------- | ------- | ------- | -----------
access_token | true | string | | Your personal acess_token
ID | true | integer | | The ID of the business to retrieve

# Trackings

## Get Services

```http
GET /snappy/trackings/get_services HTTP/1.1
```

> Response

```json
{
    "services": [
        {
            "name": "expedited",
            "name_vi": "Chuyển phát nhanh"
        },
        {
            "disabled": true,
            "name": "standard",
            "name_vi": "Tiêu chuẩn"
        }
    ],
    "success": true
}
```

```json
{
    "services": [
        {
            "name": "same_day",
            "name_vi": "Trong ngày"
        },
        {
            "disabled": true,
            "name": "next_day",
            "name_vi": "Ngày tiếp theo"
        }
    ],
    "success": true
}
```

This endpoint retrieves services.

### HTTP Request

`GET /snappy/trackings/get_services`

### URL Parameters

Parameter | Required | Type    | Default | Description
--------- | ------- | ------- | ------- | -----------
sender_district_id | true | string | | Id of sender's district
receiver_district_id | true | string | | Id of receiver's district
receiver_commune_id | false | string | | Id of receiver's commune

## Get Trackings

```http
GET /snappy/trackings?access_token=<access_token> HTTP/1.1
```

> Response

```json
{
    "success": true,
    "trackings_data": {
        "page_number": 1,
        "page_size": 50,
        "total_entries": 1,
        "total_pages": 1,
        "trackings": [
            {
                "addition_services": [],
                "balance_adjustment": 0,
                "business": {
                    "id": 63,
                    "name": "SG1",
                    "owner": {
                        "fb_id": null,
                        "name": "SG1"
                    },
                    "phone_number": "+84937123123"
                },
                "business_id": 63,
                "creator": {
                    "fb_id": null,
                    "name": "SG1"
                },
                "creator_id": "14d4a1a1-ea42-4164-805d-e240f2561f71",
                "current_status": "Đã khởi tạo",
                "current_status_en": "request_received",
                "custom_id": "S61180417003",
                "customer_tracking_id": null,
                "department": {
                    "address": "127/19 Hoàng Hoa Thám, Phường 13, Tân Bình",
                    "district_name": "Quận Tân Bình",
                    "phone_number": "0886.332.882",
                    "province_name": "Hồ Chí Minh",
                    "second_phone_number": "0886.334.884"
                },
                "from": {
                    "address": "Số 1 ABC",
                    "commune_id": null,
                    "district_id": "10101",
                    "full_address": "SG1 - Số 1 ABC, Quận Ba Đình, Hà Nội",
                    "id": "82019ce2-088d-4cb1-8e8a-c6255d12ce6c",
                    "name": "SG1",
                    "phone_number": "+84937123123",
                    "province_id": "101"
                },
                "id": "E80008124",
                "inserted_at": "2018-04-17T16:55:03",
                "last_update": {
                    "location": "SG1 - Số 1 ABC, Quận Ba Đình, Hà Nội",
                    "note": "Khởi tạo vận đơn",
                    "status": "Đã khởi tạo",
                    "status_color": "#AD7E05",
                    "updated_at": "2018-04-18T09:21:40"
                },
                "logs": [],
                "package_info": {
                    "items": [
                        {
                            "name": "sp 1",
                            "quantity": 2,
                            "selected": "false",
                            "weight": 100
                        },
                        {
                            "name": "sp 2",
                            "quantity": 1,
                            "weight": 200
                        }
                    ],
                    "snippet": "2 x 100g sp 1, 1 x 200g sp 2",
                    "total_weight": 400
                },
                "services": {
                    "cod_service": {
                        "amount": 500000,
                        "cost": 0,
                        "is_save_log_cod": false,
                        "use_cod": true
                    },
                    "insurance_cost": 0,
                    "is_allow_checking_good": false,
                    "is_allow_try_out": false,
                    "is_receiver_pay": false,
                    "is_save_log_insurance_cost": false,
                    "is_save_log_return": false,
                    "is_save_log_shipping_cost": false,
                    "is_save_log_shipping_cost_of_shop": false,
                    "name": "expedited",
                    "name_vi": "Chuyển phát nhanh",
                    "shipping_cost": 30000,
                    "shipping_cost_of_shop": 0
                },
                "short_id": 812,
                "status_color": "#AD7E05",
                "to": {
                    "address": "12 test",
                    "commune_id": "7010101",
                    "district_id": "70101",
                    "full_address": "Phường Tân Định, Quận 1, Hồ Chí Minh",
                    "id": null,
                    "name": "test",
                    "phone_number": "095555555",
                    "province_id": "701"
                },
                "updated_at": "2018-04-18T09:21:40",
                "updates": [
                    {
                        "location": "SG1 - Số 1 ABC, Quận Ba Đình, Hà Nội",
                        "note": "Khởi tạo vận đơn",
                        "status": "Đã khởi tạo",
                        "status_color": "#AD7E05",
                        "updated_at": "2018-04-18T09:21:40"
                    }
                ]
            }
        ]
    }
}
```

This endpoint retrieves all trackings into your business.

### HTTP Request

`GET /snappy/trackings`

### Query Parameters

Parameter | Required | Type    | Default | Description
--------- | ------- | ------- | ------- | -----------
access_token | true | string | | Your personal acess_token
business_id | true | integer | | Id one business in list businesses you get in api [GET /user/me](#get-all-businesses)
page | false | integer | 1 | Page number
start_date | false | integer | | Start date `timestamp`
end_date | false | integer | | End date `timestamp`
sort_by | false | string | inserted_at | If `sort_by`= `"updated_at"` trackings will sort by `updated_at` instead of default sort by `inserted_at`
filter_by_status | false | string | | One or more status of trackings separate by `,`
filter_inner_outer | false | integer | | `1` is inner, `2` is outer in same province and `3` is outer
creator_id | false | string | | id of creator `UUID`
keyword | false | string | | keyword for search by address, phone number, tracking id, ...

## Create tracking

```http
POST /snappy/trackings/create?access_token=<access_token> HTTP/1.1
Content-Type: application/json
```

> Sample params

```json
{
    "access_token": "eyJ1aWQiOiIxNGQ0YTFhMS1lYTQyLTQxNjQtODA1ZC1lMjQwZjI1NjFmNzEiLCJpYXQiOj",
    "business_id": 63,
    "business_address_id": "82019ce2-088d-4cb1-8e8a-c6255d12ce6c",
    "receiver_name": "test",
    "receiver_phone_number": "0955555555",
    "receiver_address": "12 test",
    "receiver_province_id": "701",
    "receiver_district_id": "70101",
    "receiver_commune_id": "7010101",
    "items": [
        {
            "name": "sp 1",
            "weight": 100,
            "quantity": 1
        },
        {
            "name": "sp 2",
            "weight": 200,
            "quantity": 2
        }
    ],
    "service_name": "expedited",
    "cod": 500000
}
```

> Response if success

```json
{
    "message": "Vận đơn đã được khởi tạo thành công",
    "success": true,
    "tracking": {
        "addition_services": [],
        "balance_adjustment": 0,
        "business": {
            "id": 63,
            "name": "SG1",
            "owner": {
                "fb_id": null,
                "name": "SG1"
            },
            "phone_number": "+84937123123"
        },
        "business_id": 63,
        "creator": {
            "fb_id": null,
            "name": "SG1"
        },
        "creator_id": "14d4a1a1-ea42-4164-805d-e240f2561f71",
        "current_status": "Đã khởi tạo",
        "current_status_en": "request_received",
        "custom_id": "S61180418001",
        "customer_tracking_id": null,
        "department": {
            "address": "127/19 Hoàng Hoa Thám, Phường 13, Tân Bình",
            "district_name": "Quận Tân Bình",
            "phone_number": "0886.332.882",
            "province_name": "Hồ Chí Minh",
            "second_phone_number": "0886.334.884"
        },
        "from": {
            "address": "Số 1 ABC",
            "commune_id": null,
            "district_id": "10101",
            "full_address": "SG1 - Số 1 ABC, Quận Ba Đình, Hà Nội",
            "id": "82019ce2-088d-4cb1-8e8a-c6255d12ce6c",
            "name": "SG1",
            "phone_number": "+84937123123",
            "province_id": "101"
        },
        "id": "E80008142",
        "inserted_at": "2018-04-18T15:42:56",
        "last_update": {
            "location": "SG1 - Số 1 ABC, Quận Ba Đình, Hà Nội",
            "note": "Khởi tạo vận đơn",
            "status": "Đã khởi tạo",
            "status_color": "#AD7E05",
            "updated_at": "2018-04-18T15:42:56"
        },
        "logs": [],
        "package_info": {
            "items": [
                {
                    "name": "sp 1",
                    "quantity": 2,
                    "weight": 100
                }
            ],
            "snippet": "2 x 100g sp 1",
            "total_weight": 200
        },
        "services": {
            "cod_service": {
                "amount": 500000,
                "cost": 0,
                "is_save_log_cod": false,
                "use_cod": true
            },
            "insurance_cost": 0,
            "is_allow_checking_good": false,
            "is_allow_try_out": false,
            "is_receiver_pay": false,
            "is_save_log_insurance_cost": false,
            "is_save_log_return": false,
            "is_save_log_shipping_cost": false,
            "is_save_log_shipping_cost_of_shop": false,
            "name": "expedited",
            "name_vi": "Chuyển phát nhanh",
            "shipping_cost": 30000,
            "shipping_cost_of_shop": 0
        },
        "short_id": 814,
        "status_color": "#AD7E05",
        "to": {
            "address": "12 test",
            "commune_id": "7010101",
            "district_id": "70101",
            "full_address": "Phường Tân Định, Quận 1, Hồ Chí Minh",
            "id": null,
            "name": "test",
            "phone_number": "095555555",
            "province_id": "701"
        },
        "updated_at": "2018-04-18T15:42:56",
        "updates": [
            {
                "location": "SG1 - Số 1 ABC, Quận Ba Đình, Hà Nội",
                "note": "Khởi tạo vận đơn",
                "status": "Đã khởi tạo",
                "status_color": "#AD7E05",
                "updated_at": "2018-04-18T15:42:56"
            }
        ]
    }
}
```

This endpoint create a tracking into your business.

### HTTP Request

`POST /snappy/trackings/create`

### Query Parameters

Parameter | Required | Type    | Default | Description
--------- | ------- | ------- | ------- | -----------
access_token | true | string | | Your personal acess_token
business_id | true | integer | | Id of a business in list businesses. Get in api [GET /user/me](#get-all-businesses)
business_address_id | true | string | | Id `UUID` of one of business address. Get in api [GET /businesses/<ID>](#get-a-specific-business)
receiver_name | true | string | | Name of receiver
receiver_phone_number | true | string | | Phone number of receiver
receiver_address | true | string | | Address of receiver
receiver_province_id | true | string | | Id of receiver's province. Get in api [GET /geo/provinces](#get-provinces)
receiver_district_id | true | string | | Id of receiver's district. Get in api [GET /geo/districts](#get-districts)
receiver_commune_id | false | string | | Id of receiver's commune. Get in api [GET /geo/communes](#get-communes)
items | true | array | | List of items in tracking package
service_name | false | string | | Name of service. Get in api [GET /snappy/trackings/get_services](#get-services)
cod | true | integer | | Amount of cod or values of all items in package
note | false | string | `Khởi tạo vận đơn` | Note of each status in tracking
customer_tracking_id | false | string |  | The custom id of customer
is_receiver_pay | false | boolean | false | If `true` all cost of the tracking will be paid by the receiver
is_allow_checking_good | false | boolean | false | If `true` means to allow the receiver to see the product
is_allow_try_out | false | boolean | false | If `true` means to allow the receiver to try the product

Params `items`

Parameter | Required | Type    | Default | Description
--------- | ------- | ------- | ------- | -----------
name | true | string | | Name of item or product
weight | true | integer | | Weight of item or product
quantity | true | integer | | Quantity of item or product
