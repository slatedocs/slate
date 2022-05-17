## Invoices

Note: Creating, deleting and updating invoices is not supported.

<!-------------------- GET CUSTOMER INVOICES -------------------->
### Get customer invoices by reseller ID

`GET /invoices/find/:reseller_id/customer_invoices`

Retrieve a list of invoices belonging to the customers of the reseller specified.

```shell
# Retrieve customer invoices list
curl "https://cloudmc_endpoint/rest/invoices/find/efd32752-c6f2-45cf-b494-cc6be8a45845/customer_invoices?includeAllSubOrgs=false&billingCycle=07-2021" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns a JSON structured like this:

```json
{
    "data": [
        {
            "createdDate": "2021-11-22T17:22:49Z",
            "billingCycle": {
                "id": "7c10604c-3045-40ef-9890-1bd5a23d5a7b"
            },
            "organization": {
                "name": "System",
                "id": "c869e848-6fb3-4850-af3d-42c5666f2c78"
            },
            "invoiceId": "X5GDVRKGCY",
            "id": "504735ce-cdc1-4adf-b59c-b4e43d1eefa4",
            "detail": {
                "adjustments": [
                    {
                        "amount": -41650.89,
                        "dailyDeltas": {
                            "2021-10-06": 0.0,
                            "2021-10-07": -1352.01792,
                            "2021-10-08": -899.184845,
                            "2021-10-02": -422.4,
                            "2021-10-03": -422.4,
                            "2021-10-04": -686.35776,
                            "2021-10-05": -2015.18592,
                            "2021-09-30": -422.4,
                            "2021-10-01": -422.4,
                            "2021-09-25": -422.4,
                            "2021-09-28": -422.4,
                            "2021-09-29": -422.4,
                            "2021-09-26": -422.4,
                            "2021-09-27": -422.4
                        },
                        "before": 189322.23,
                        "after": 147671.34,
                        "source": {
                            "endDate": "2021-10-15",
                            "subtype": "",
                            "scope": "ALL_PRODUCTS",
                            "typeString": "PERCENTAGE",
                            "discount": {
                                "applyToNewCustomersOnly": false,
                                "discountedProducts": {},
                                "type": "PERCENTAGE",
                                "packageDiscount": 22.0,
                                "referenceId": "9b245d40-ba94-4e05-af51-89979d37fb29",
                                "subtype": "",
                                "discountedCategories": {},
                                "scope": "ALL_PRODUCTS",
                                "name": {
                                    "en": "discount",
                                    "fr": "escompte"
                                },
                                "id": "9b245d40-ba94-4e05-af51-89979d37fb29",
                                "credit": false,
                                "startDate": "2021-05-08T00:00:00Z"
                            },
                            "discountId": "9b245d40-ba94-4e05-af51-89979d37fb29",
                            "type": "PERCENTAGE",
                            "startDate": "2021-09-15",
                            "referenceId": "9b245d40-ba94-4e05-af51-89979d37fb29"
                        },
                        "type": "PERCENTAGE"
                    },
                    {
                        "amount": 0.0,
                        "dailyDeltas": {
                            "2021-09-25": 0.0
                        },
                        "before": 147671.34,
                        "after": 147671.34,
                        "source": {
                            "endDate": "2021-10-15",
                            "subtype": "",
                            "scope": "ALL_PRODUCTS",
                            "typeString": "CREDIT",
                            "discount": {
                                "applyToNewCustomersOnly": false,
                                "discountedProducts": {},
                                "type": "CREDIT",
                                "packageDiscount": 250000.0,
                                "cutoffDate": "2021-09-27T00:00:00Z",
                                "referenceId": "532067ee-c194-4463-b5a1-a161e5c9388c",
                                "durationDays": 90,
                                "subtype": "",
                                "discountedCategories": {},
                                "scope": "ALL_PRODUCTS",
                                "name": {
                                    "en": "bbbb",
                                    "fr": "bb"
                                },
                                "id": "532067ee-c194-4463-b5a1-a161e5c9388c",
                                "credit": true,
                                "startDate": "2021-05-08T00:00:00Z"
                            },
                            "used": {
                                "packageDiscount": 0.0
                            },
                            "discountId": "532067ee-c194-4463-b5a1-a161e5c9388c",
                            "type": "CREDIT",
                            "startDate": "2021-09-15",
                            "remaining": {
                                "discountedProducts": {},
                                "discountedCategories": {},
                                "packageDiscount": 0.0
                            },
                            "referenceId": "532067ee-c194-4463-b5a1-a161e5c9388c"
                        },
                        "type": "CREDIT"
                    }
                ],
                "adjustmentAggregations": [
                    {
                        "scopedBefore": 189322.23,
                        "scopedAmount": -41650.89,
                        "subtype": "",
                        "before": 251748.98,
                        "cumulativeAmount": -104077.64,
                        "after": 147671.34,
                        "type": "PERCENTAGE",
                        "scopedAfter": 147671.34
                    },
                    {
                        "scopedBefore": 147671.34,
                        "scopedAmount": 0.0,
                        "subtype": "",
                        "before": 147671.34,
                        "cumulativeAmount": 0.0,
                        "after": 147671.34,
                        "type": "CREDIT",
                        "scopedAfter": 147671.34
                    }
                ],
                "endDate": "2021-10-15T00:00:00Z",
                "inclusiveEndDate": "2021-10-14T00:00:00Z",
                "subTotal": 147671.34,
                "dateToSubTotalCost": {
                    "2021-10-06": 34144.890624,
                    "2021-10-07": 32116.48128,
                    "2021-10-08": 21359.336693999998,
                    "2021-10-02": 1497.6,
                    "2021-10-03": 1497.6,
                    "2021-10-04": 12766.995072,
                    "2021-10-05": 33805.234943999996,
                    "2021-09-30": 1497.6,
                    "2021-10-01": 1497.6,
                    "2021-09-25": 1497.6,
                    "2021-09-28": 1497.6,
                    "2021-09-29": 1497.6,
                    "2021-09-26": 1497.6,
                    "2021-09-27": 1497.6
                },
                "dateToTotalCost": {
                    "2021-10-06": 34144.890624,
                    "2021-10-07": 32116.48128,
                    "2021-10-08": 21359.336693999998,
                    "2021-10-02": 1497.6,
                    "2021-10-03": 1497.6,
                    "2021-10-04": 12766.995072,
                    "2021-10-05": 33805.234943999996,
                    "2021-09-30": 1497.6,
                    "2021-10-01": 1497.6,
                    "2021-09-25": 1497.6,
                    "2021-09-28": 1497.6,
                    "2021-09-29": 1497.6,
                    "2021-09-26": 1497.6,
                    "2021-09-27": 1497.6
                },
                "total": 147671.34,
                "currency": "CAD",
                "categories": [
                    {
                        "dateToTotalCost": {
                            "2021-10-06": 34144.890624,
                            "2021-10-07": 32116.48128,
                            "2021-10-08": 21359.336693999998,
                            "2021-10-02": 1497.6,
                            "2021-10-03": 1497.6,
                            "2021-10-04": 12766.995072,
                            "2021-10-05": 33805.234943999996,
                            "2021-09-30": 1497.6,
                            "2021-10-01": 1497.6,
                            "2021-09-25": 1497.6,
                            "2021-09-28": 1497.6,
                            "2021-09-29": 1497.6,
                            "2021-09-26": 1497.6,
                            "2021-09-27": 1497.6
                        },
                        "total": 147671.34,
                        "adjustments": [
                            {
                                "itemId": "950d5a79-f6df-4770-995a-5144e6feb6b0",
                                "amount": -47330.56,
                                "dailyDeltas": {
                                    "2021-10-06": 0.0,
                                    "2021-10-07": -1536.384,
                                    "2021-10-08": -1021.80096,
                                    "2021-10-02": -480.0,
                                    "2021-10-03": -480.0,
                                    "2021-10-04": -779.952,
                                    "2021-10-05": -2289.984,
                                    "2021-09-30": -480.0,
                                    "2021-10-01": -480.0,
                                    "2021-09-25": -480.0,
                                    "2021-09-28": -480.0,
                                    "2021-09-29": -480.0,
                                    "2021-09-26": -480.0,
                                    "2021-09-27": -480.0
                                },
                                "before": 236652.79,
                                "after": 189322.23,
                                "source": {
                                    "endDate": "2021-10-15",
                                    "subtype": "",
                                    "scope": "CATEGORIES",
                                    "typeString": "PERCENTAGE",
                                    "discount": {
                                        "applyToNewCustomersOnly": false,
                                        "discountedProducts": {},
                                        "type": "PERCENTAGE",
                                        "referenceId": "6ee154d1-4318-47bb-bb18-2e605c227889",
                                        "subtype": "",
                                        "discountedCategories": {
                                            "950d5a79-f6df-4770-995a-5144e6feb6b0": 20
                                        },
                                        "scope": "CATEGORIES",
                                        "name": {
                                            "en": "compute-20-percent",
                                            "fr": "compute-20-percent"
                                        },
                                        "id": "6ee154d1-4318-47bb-bb18-2e605c227889",
                                        "credit": false,
                                        "startDate": "2021-05-08T00:00:00Z"
                                    },
                                    "discountId": "6ee154d1-4318-47bb-bb18-2e605c227889",
                                    "type": "PERCENTAGE",
                                    "startDate": "2021-09-15",
                                    "referenceId": "6ee154d1-4318-47bb-bb18-2e605c227889"
                                },
                                "type": "PERCENTAGE"
                            },
                            {
                                "itemId": "950d5a79-f6df-4770-995a-5144e6feb6b0",
                                "amount": -41650.89,
                                "dailyDeltas": {
                                    "2021-10-06": 0.0,
                                    "2021-10-07": -1352.01792,
                                    "2021-10-08": -899.184845,
                                    "2021-10-02": -422.4,
                                    "2021-10-03": -422.4,
                                    "2021-10-04": -686.35776,
                                    "2021-10-05": -2015.18592,
                                    "2021-09-30": -422.4,
                                    "2021-10-01": -422.4,
                                    "2021-09-25": -422.4,
                                    "2021-09-28": -422.4,
                                    "2021-09-29": -422.4,
                                    "2021-09-26": -422.4,
                                    "2021-09-27": -422.4
                                },
                                "before": 189322.23,
                                "after": 147671.34,
                                "source": {
                                    "endDate": "2021-10-15",
                                    "subtype": "",
                                    "scope": "ALL_PRODUCTS",
                                    "typeString": "PERCENTAGE",
                                    "discount": {
                                        "applyToNewCustomersOnly": false,
                                        "discountedProducts": {},
                                        "type": "PERCENTAGE",
                                        "packageDiscount": 22.0,
                                        "referenceId": "9b245d40-ba94-4e05-af51-89979d37fb29",
                                        "subtype": "",
                                        "discountedCategories": {},
                                        "scope": "ALL_PRODUCTS",
                                        "name": {
                                            "en": "discount",
                                            "fr": "escompte"
                                        },
                                        "id": "9b245d40-ba94-4e05-af51-89979d37fb29",
                                        "credit": false,
                                        "startDate": "2021-05-08T00:00:00Z"
                                    },
                                    "discountId": "9b245d40-ba94-4e05-af51-89979d37fb29",
                                    "type": "PERCENTAGE",
                                    "startDate": "2021-09-15",
                                    "referenceId": "9b245d40-ba94-4e05-af51-89979d37fb29"
                                },
                                "type": "PERCENTAGE"
                            }
                        ],
                        "adjustmentAggregations": [
                            {
                                "scopedBefore": 236652.79,
                                "scopedAmount": -88981.45,
                                "subtype": "",
                                "before": 251748.98,
                                "cumulativeAmount": -104077.64,
                                "after": 147671.34,
                                "type": "PERCENTAGE",
                                "scopedAfter": 147671.34
                            }
                        ],
                        "name": {
                            "en": "compute",
                            "fr": "dancer"
                        },
                        "subTotal": 147671.34,
                        "dateToSubTotalCost": {
                            "2021-10-06": 34144.890624,
                            "2021-10-07": 32116.48128,
                            "2021-10-08": 21359.336693999998,
                            "2021-10-02": 1497.6,
                            "2021-10-03": 1497.6,
                            "2021-10-04": 12766.995072,
                            "2021-10-05": 33805.234943999996,
                            "2021-09-30": 1497.6,
                            "2021-10-01": 1497.6,
                            "2021-09-25": 1497.6,
                            "2021-09-28": 1497.6,
                            "2021-09-29": 1497.6,
                            "2021-09-26": 1497.6,
                            "2021-09-27": 1497.6
                        },
                        "categoryId": "950d5a79-f6df-4770-995a-5144e6feb6b0",
                        "products": [
                            {
                                "adjustments": [],
                                "adjustmentAggregations": [
                                    {
                                        "subtype": "",
                                        "before": 49740.6,
                                        "cumulativeAmount": -18702.47,
                                        "after": 31038.13,
                                        "type": "PERCENTAGE"
                                    }
                                ],
                                "productId": "1f656184-df81-47c7-964f-eb9e27743d7b",
                                "usage": 497.406048,
                                "pricingTiers": [],
                                "subTotal": 31038.13,
                                "dateToSubTotalCost": {
                                    "2021-10-06": 0.0,
                                    "2021-10-07": 4793.51808,
                                    "2021-10-08": 3188.018995,
                                    "2021-10-02": 1497.6,
                                    "2021-10-03": 1497.6,
                                    "2021-10-04": 2433.450239999999,
                                    "2021-10-05": 7144.75008,
                                    "2021-09-30": 1497.6,
                                    "2021-10-01": 1497.6,
                                    "2021-09-25": 1497.6,
                                    "2021-09-28": 1497.6,
                                    "2021-09-29": 1497.6,
                                    "2021-09-26": 1497.6,
                                    "2021-09-27": 1497.6
                                },
                                "taxCode": "SW056003",
                                "dateToTotalCost": {
                                    "2021-10-06": 0.0,
                                    "2021-10-07": 4793.51808,
                                    "2021-10-08": 3188.018995,
                                    "2021-10-02": 1497.6,
                                    "2021-10-03": 1497.6,
                                    "2021-10-04": 2433.450239999999,
                                    "2021-10-05": 7144.75008,
                                    "2021-09-30": 1497.6,
                                    "2021-10-01": 1497.6,
                                    "2021-09-25": 1497.6,
                                    "2021-09-28": 1497.6,
                                    "2021-09-29": 1497.6,
                                    "2021-09-26": 1497.6,
                                    "2021-09-27": 1497.6
                                },
                                "total": 31038.13,
                                "unit": {
                                    "unit": "UNIT",
                                    "name": {}
                                },
                                "price": "100.000000",
                                "name": {
                                    "en": "specification",
                                    "fr": "specification"
                                },
                                "sku": "SPEC_PRODUCT",
                                "categoryId": "950d5a79-f6df-4770-995a-5144e6feb6b0"
                            },
                            {
                                "adjustments": [],
                                "adjustmentAggregations": [
                                    {
                                        "subtype": "",
                                        "before": 160493.81,
                                        "cumulativeAmount": -60345.67,
                                        "after": 100148.14,
                                        "type": "PERCENTAGE"
                                    }
                                ],
                                "productId": "3c2bb895-4282-41a1-8db4-2269037dc561",
                                "usage": 8024.690304,
                                "pricingTiers": [],
                                "subTotal": 100148.14,
                                "dateToSubTotalCost": {
                                    "2021-10-06": 29951.640576,
                                    "2021-10-07": 23967.500544,
                                    "2021-10-08": 15939.734353999998,
                                    "2021-10-04": 8630.129664,
                                    "2021-10-05": 21659.129856
                                },
                                "taxCode": "SW056003",
                                "dateToTotalCost": {
                                    "2021-10-06": 29951.640576,
                                    "2021-10-07": 23967.500544,
                                    "2021-10-08": 15939.734353999998,
                                    "2021-10-04": 8630.129664,
                                    "2021-10-05": 21659.129856
                                },
                                "total": 100148.14,
                                "unit": {
                                    "unit": "HOUR",
                                    "name": {}
                                },
                                "price": "20.000000",
                                "name": {
                                    "en": "storage",
                                    "fr": "storage"
                                },
                                "sku": "STORAGE",
                                "categoryId": "950d5a79-f6df-4770-995a-5144e6feb6b0"
                            },
                            {
                                "adjustments": [],
                                "adjustmentAggregations": [
                                    {
                                        "subtype": "",
                                        "before": 11322.18,
                                        "cumulativeAmount": -4257.14,
                                        "after": 7065.04,
                                        "type": "PERCENTAGE"
                                    }
                                ],
                                "productId": "6b94a874-9f85-4a14-9437-d5df30c8191d",
                                "usage": 377.406048,
                                "pricingTiers": [],
                                "subTotal": 7065.04,
                                "dateToSubTotalCost": {
                                    "2021-10-06": 1797.12,
                                    "2021-10-07": 1438.055424,
                                    "2021-10-08": 956.405699,
                                    "2021-10-04": 730.0350719999999,
                                    "2021-10-05": 2143.4250239999997
                                },
                                "taxCode": "SW056003",
                                "dateToTotalCost": {
                                    "2021-10-06": 1797.12,
                                    "2021-10-07": 1438.055424,
                                    "2021-10-08": 956.405699,
                                    "2021-10-04": 730.0350719999999,
                                    "2021-10-05": 2143.4250239999997
                                },
                                "total": 7065.04,
                                "unit": {
                                    "unit": "HOUR",
                                    "name": {}
                                },
                                "price": "30.000000",
                                "name": {
                                    "en": "vm cpu",
                                    "fr": "dancer"
                                },
                                "sku": "VM_CPU",
                                "categoryId": "950d5a79-f6df-4770-995a-5144e6feb6b0"
                            },
                            {
                                "adjustments": [
                                    {
                                        "itemId": "a36933e3-697a-4093-9057-18aed07479ea",
                                        "amount": -15096.19,
                                        "dailyDeltas": {
                                            "2021-10-06": -3839.952,
                                            "2021-10-07": -3072.768,
                                            "2021-10-08": -2043.55392,
                                            "2021-10-04": -1559.904,
                                            "2021-10-05": -4580.016
                                        },
                                        "before": 30192.39,
                                        "after": 15096.2,
                                        "source": {
                                            "endDate": "2021-10-15",
                                            "subtype": "",
                                            "scope": "PRODUCTS",
                                            "typeString": "PERCENTAGE",
                                            "discount": {
                                                "applyToNewCustomersOnly": false,
                                                "discountedProducts": {
                                                    "a36933e3-697a-4093-9057-18aed07479ea": 50
                                                },
                                                "type": "PERCENTAGE",
                                                "referenceId": "455feefb-0270-42ab-b9a1-ce87a430fd99",
                                                "subtype": "",
                                                "discountedCategories": {},
                                                "scope": "PRODUCTS",
                                                "name": {
                                                    "en": "vm-ram-50-percent",
                                                    "fr": "vm-ram-50-percent"
                                                },
                                                "id": "455feefb-0270-42ab-b9a1-ce87a430fd99",
                                                "credit": false,
                                                "startDate": "2021-05-08T00:00:00Z"
                                            },
                                            "discountId": "455feefb-0270-42ab-b9a1-ce87a430fd99",
                                            "type": "PERCENTAGE",
                                            "startDate": "2021-09-15",
                                            "referenceId": "455feefb-0270-42ab-b9a1-ce87a430fd99"
                                        },
                                        "type": "PERCENTAGE"
                                    }
                                ],
                                "adjustmentAggregations": [
                                    {
                                        "scopedBefore": 30192.39,
                                        "scopedAmount": -15096.19,
                                        "subtype": "",
                                        "before": 30192.39,
                                        "cumulativeAmount": -20772.36,
                                        "after": 9420.03,
                                        "type": "PERCENTAGE",
                                        "scopedAfter": 15096.2
                                    }
                                ],
                                "productId": "a36933e3-697a-4093-9057-18aed07479ea",
                                "usage": 754.809696,
                                "pricingTiers": [],
                                "subTotal": 9420.03,
                                "dateToSubTotalCost": {
                                    "2021-10-06": 2396.1300479999995,
                                    "2021-10-07": 1917.407231999999,
                                    "2021-10-08": 1275.1776459999996,
                                    "2021-10-04": 973.380096,
                                    "2021-10-05": 2857.929984
                                },
                                "taxCode": "SW056003",
                                "dateToTotalCost": {
                                    "2021-10-06": 2396.1300479999995,
                                    "2021-10-07": 1917.407231999999,
                                    "2021-10-08": 1275.1776459999996,
                                    "2021-10-04": 973.380096,
                                    "2021-10-05": 2857.929984
                                },
                                "total": 9420.03,
                                "unit": {
                                    "unit": "HOUR",
                                    "name": {}
                                },
                                "price": "40.000000",
                                "name": {
                                    "en": "ram",
                                    "fr": "ram"
                                },
                                "sku": "VM_RAM",
                                "categoryId": "950d5a79-f6df-4770-995a-5144e6feb6b0"
                            }
                        ]
                    }
                ],
                "startDate": "2021-09-15T00:00:00Z"
            },
            "status": "USAGE_PENDING"
        }
    ]
}
```

Optional Query Parameters | &nbsp;
---------- | -----------
`includeAllSubOrgs`<br/>*boolean* | Whether or not to include sub-organizations of sub-organizations or just direct sub-organizations of the reseller.
`billingCycle`<br/>*String* | The cycle which the invoice belongs to. Format is `MM-YYYY`

Attributes | &nbsp;
---- | -----------
`id`<br/>*UUID* | The UUID of the invoice.
`invoiceId`<br/>*string* | The human readable id.
`status`<br/>*enum* | The status of the invoice. Possible values are: USAGE_PENDING, IN_REVIEW, ISSUED, OVERDUE, PAID, VOID.
`createdDate`<br/>*date* | The created date of the invoice.
`draftedDate`<br/>*date* | The date the invoice was drafted. Is null if status is still USAGE_PENDING.
`issuedDate`<br/>*date* | The date the invoice was issued.
`dueDate`<br/>*date* | The date the invoice is due.
`organization.id`<br/>*UUID* | The UUID of the organization the invoice belongs to.
`organization.name`<br/>*string* | The name of the organization the invoice belongs to.
`balance`<br/>*BigDecimal* | The invoice's remaining balance.
`detail`<br/>*Object* | The invoice detail contains a currency and a list of categories. Each category has a list of products.
`detail.currency`<br/>*string* | The short-name of the currency.
`detail.subTotal`<br/>*string* | A string containing the total before taxes and credits.
`detail.total`<br/>*string* | The invoice total after discounts, taxes, and credits.
`detail.startDate`<br/>*string* | An ISO-8601 instant format string representing the start of the invoice detail report.
`detail.endDate`<br/>*string* | An ISO-8601 instant format string representing the end of the invoice detail report.
`detail.adjustments`<br/>*Array[Object]* | The adjustments applied to the invoice. An adjustment tracks the application of a discount, a credit or a tax.
`detail.adjustments.type`<br/>*string* | The type of adjustment. Possible values are: PERCENTAGE, CREDIT, TAX.
`detail.adjustments.amount`<br/>*string* | The adjustment amount applied to the invoice total.
`detail.adjustments.before`<br/>*string* | The invoice total before the adjustment was applied.
`detail.adjustments.after`<br/>*string* | The invoice total after the adjustment was applied.
`detail.adjustments.dailyDeltas`<br/>*Object* | A map of the local date to the change in daily cost due to the adjustment.
`detail.adjustments.source`<br/>*Object* | The model of the adjustment. Can be a discount or a tax model.
`detail.adjustmentAggregations`<br/>*Array[Object]* | The adjustment aggregations. An aggregation summarizes the application of discounts, taxes or credits.
`detail.adjustmentAggregations.type`<br/>*string* | The type of adjustment being aggregated. Possible values are: PERCENTAGE, CREDIT, TAX.
`detail.adjustmentAggregations.subtype`<br/>*string* | The optional type used for sub-aggregations, like tax breakdowns.
`detail.categories.products.adjustmentAggregations.scopedAmount`<br/>*string* | The adjustment amount applied to the product total. Only includes adjustments with the same scope as the item.
`detail.categories.products.adjustmentAggregations.scopedBefore`<br/>*string* | The product total before the adjustments were applied. Only includes adjustments with the same scope as the item.
`detail.adjustmentAggregations.before`<br/>*string* | The invoice total before the adjustments were applied.
`detail.adjustmentAggregations.after`<br/>*string* | The invoice total after the adjustments were applied.
`detail.categories.products.adjustmentAggregations.scopedAfter`<br/>*string* | The product total after the adjustments were applied. Only includes adjustments with the same scope as the item.
`detail.adjustmentAggregations.cumulativeAmount`<br/>*string* | The cumulative adjustment amount applied to the invoice, its categories and their products.
`detail.categories`<br/>*Array[Object]* | An array of category objects. Contains all categories that had usage for the period.
`detail.categories.name`<br/>*Object* | A map of short language codes to their translated category names.
`detail.categories.subTotal`<br/>*string* | A string with the category subtotal, before taxes and credits.
`detail.categories.total`<br/>*string* | A string with the category subtotal, after taxes and credits.
`detail.adjustments`<br/>*Array[Object]* | The adjustments applied to the category. An adjustment tracks the application of a discount, a credit or a tax.
`detail.categories.adjustments.type`<br/>*string* | The type of adjustment. Possible values are: PERCENTAGE, CREDIT, TAX.
`detail.categories.adjustments.itemId`<br/>*UUID* | The category id.
`detail.categories.adjustments.amount`<br/>*string* | The adjustment amount applied to the category total.
`detail.categories.adjustments.before`<br/>*string* | The category total before the adjustment was applied.
`detail.categories.adjustments.after`<br/>*string* | The category total after the adjustment was applied.
`detail.categories.adjustments.dailyDeltas`<br/>*Object* | A map of the local date to the change in daily cost due to the adjustment.
`detail.categories.adjustments.source`<br/>*Object* | The model of the adjustment. Can be a discount or a tax model.
`detail.categories.adjustmentAggregations`<br/>*Array[Object]* | The adjustment aggregations. An aggregation summarizes the application of discounts, taxes or credits.
`detail.categories.adjustmentAggregations.type`<br/>*string* | The type of adjustment being aggregated. Possible values are: PERCENTAGE, CREDIT, TAX.
`detail.categories.adjustmentAggregations.subtype`<br/>*string* | The optional type used for sub-aggregations, like tax breakdowns.
`detail.categories.products.adjustmentAggregations.scopedAmount`<br/>*string* | The adjustment amount applied to the product total. Only includes adjustments with the same scope as the item.
`detail.categories.products.adjustmentAggregations.scopedBefore`<br/>*string* | The product total before the adjustments were applied. Only includes adjustments with the same scope as the item.
`detail.categories.adjustmentAggregations.before`<br/>*string* | The category total before the adjustments were applied.
`detail.categories.adjustmentAggregations.after`<br/>*string* | The category total after the adjustments were applied.
`detail.categories.products.adjustmentAggregations.scopedAfter`<br/>*string* | The product total after the adjustments were applied. Only includes adjustments with the same scope as the item.
`detail.categories.adjustmentAggregations.cumulativeAmount`<br/>*string* | The cumulative adjustment amount applied to the category and its products.
`detail.categories.products`<br/>*Object* | A map of short language codes to their translated category names.
`detail.categories.products.sku`<br/>*string* | A unique string representing the sku for a product.
`detail.categories.products.name`<br/>*Object* | The name object in each language for the product name.
`detail.categories.products.cost`<br/>*string* | A string of the summed up total cost for the product.
`detail.categories.products.usage`<br/>*Object* | A string of the summed up total usage for the product.
`detail.categories.products.price`<br/>*Object* | A string representing the *average* unit price over the period.
`detail.categories.products.subTotal`<br/>*string* | A string with the product subtotal, before taxes and credits.
`detail.categories.products.total`<br/>*string* | A string with the product total, after taxes and credits.
`detail.categories.products.period`<br/>*string* | The period for the product capture. Possible values: HOURS, MONTH.
`detail.categories.products.unit`<br/>*Object* | The unit object of the product.
`detail.categories.products.unit.unit`<br/>*Object* | The unit value of the product.
`detail.categories.products.unit.name`<br/>*Object* | The name of the unit of the product in the required language. Only present when defining custom units.
`detail.categories.products.adjustments`<br/>*Array[Object]* | The adjustments applied to the invoice. An adjustment tracks the application of a discount, a credit or a tax.
`detail.categories.products.adjustments.type`<br/>*string* | The type of adjustment. Possible values are: PERCENTAGE, CREDIT, TAX.
`detail.categories.products.adjustments.itemId`<br/>*UUID* | The product id.
`detail.categories.products.adjustments.amount`<br/>*string* | The adjustment amount applied to the product total.
`detail.categories.products.adjustments.before`<br/>*string* | The product total before the adjustment was applied.
`detail.categories.products.adjustments.after`<br/>*string* | The product total after the adjustment was applied.
`detail.categories.products.adjustments.dailyDeltas`<br/>*Object* | A map of the local date to the change in daily cost due to the adjustment.
`detail.categories.products.adjustments.source`<br/>*Object* | The model of the adjustment. Can be a discount or a tax model.
`detail.categories.products.adjustmentAggregations`<br/>*Array[Object]* | The adjustment aggregations. An aggregation summarizes the application of discounts, taxes or credits.
`detail.categories.products.adjustmentAggregations.type`<br/>*string* | The type of adjustment being aggregated. Possible values are: PERCENTAGE, CREDIT, TAX.
`detail.categories.products.adjustmentAggregations.subtype`<br/>*string* | The optional type used for sub-aggregations, like tax breakdowns.
`detail.categories.products.adjustmentAggregations.scopedAmount`<br/>*string* | The adjustment amount applied to the product total. Only includes adjustments with the same scope as the item.
`detail.categories.products.adjustmentAggregations.scopedBefore`<br/>*string* | The product total before the adjustments were applied. Only includes adjustments with the same scope as the item.
`detail.categories.products.adjustmentAggregations.before`<br/>*string* | The product total before the adjustments were applied.
`detail.categories.products.adjustmentAggregations.scopedAfter`<br/>*string* | The product total after the adjustments were applied. Only includes adjustments with the same scope as the item.
`detail.categories.products.adjustmentAggregations.after`<br/>*string* | The product total after the adjustments were applied.
`detail.categories.products.adjustmentAggregations.cumulativeAmount`<br/>*string* | The adjustment amount applied to the product total.
`deletedAuditEvent`</br>*Object* | An object containing details from the deletion audit event associated to the invoice's organization. Only present if the invoice's organization is deleted.
`deletedAuditEvent.id`</br>*UUID* | The ID for the audit event for the deletion of the invoice's organization.
`deletedAuditEvent.created`</br>*date* | The creation date for the deletion audit event of the invoice's organization.
`deletedAuditEvent.updated`</br>*date* | The last updated date for the deletion audit event of the invoice's organization.
`deletedAuditEvent.eventCode`</br>*string* | Will always be *organizations.delete*. 
`deletedAuditEventCode.userId`</br>*UUID* | The ID of the user that initiated the deletion of the invoice's organization.
`deletedAuditEventCode.userEmail`</br>*UUID* | The email of the user that initiated the deletion of the invoice's organization.

<!-------------------- LIST INVOICES -------------------->
### List invoices of organization

`GET /invoices?organization_id=:organization_id&billingCycle=MM-YYYY`

Retrieve the list of invoices associated with an organization.

```shell
# Retrieve list of invoices of an organization
curl "https://cloudmc_endpoint/rest/invoices?organization_id=289ec5fb-0970-44e3-bca8-777a691e23c7&billingCycle=07-2021" \
   -H "MC-Api-Key: your_api_key"
```

> The above command returns a JSON structured like this:

```json
{
    "data": [
        {
            "createdDate": "2021-11-22T17:22:49Z",
            "billingCycle": {
                "id": "7c10604c-3045-40ef-9890-1bd5a23d5a7b"
            },
            "organization": {
                "name": "System",
                "id": "c869e848-6fb3-4850-af3d-42c5666f2c78"
            },
            "invoiceId": "X5GDVRKGCY",
            "id": "504735ce-cdc1-4adf-b59c-b4e43d1eefa4",
            "detail": {
                "adjustments": [
                    {
                        "amount": -41650.89,
                        "dailyDeltas": {
                            "2021-10-06": 0.0,
                            "2021-10-07": -1352.01792,
                            "2021-10-08": -899.184845,
                            "2021-10-02": -422.4,
                            "2021-10-03": -422.4,
                            "2021-10-04": -686.35776,
                            "2021-10-05": -2015.18592,
                            "2021-09-30": -422.4,
                            "2021-10-01": -422.4,
                            "2021-09-25": -422.4,
                            "2021-09-28": -422.4,
                            "2021-09-29": -422.4,
                            "2021-09-26": -422.4,
                            "2021-09-27": -422.4
                        },
                        "before": 189322.23,
                        "after": 147671.34,
                        "source": {
                            "endDate": "2021-10-15",
                            "subtype": "",
                            "scope": "ALL_PRODUCTS",
                            "typeString": "PERCENTAGE",
                            "discount": {
                                "applyToNewCustomersOnly": false,
                                "discountedProducts": {},
                                "type": "PERCENTAGE",
                                "packageDiscount": 22.0,
                                "referenceId": "9b245d40-ba94-4e05-af51-89979d37fb29",
                                "subtype": "",
                                "discountedCategories": {},
                                "scope": "ALL_PRODUCTS",
                                "name": {
                                    "en": "discount",
                                    "fr": "escompte"
                                },
                                "id": "9b245d40-ba94-4e05-af51-89979d37fb29",
                                "credit": false,
                                "startDate": "2021-05-08T00:00:00Z"
                            },
                            "discountId": "9b245d40-ba94-4e05-af51-89979d37fb29",
                            "type": "PERCENTAGE",
                            "startDate": "2021-09-15",
                            "referenceId": "9b245d40-ba94-4e05-af51-89979d37fb29"
                        },
                        "type": "PERCENTAGE"
                    },
                    {
                        "amount": 0.0,
                        "dailyDeltas": {
                            "2021-09-25": 0.0
                        },
                        "before": 147671.34,
                        "after": 147671.34,
                        "source": {
                            "endDate": "2021-10-15",
                            "subtype": "",
                            "scope": "ALL_PRODUCTS",
                            "typeString": "CREDIT",
                            "discount": {
                                "applyToNewCustomersOnly": false,
                                "discountedProducts": {},
                                "type": "CREDIT",
                                "packageDiscount": 250000.0,
                                "cutoffDate": "2021-09-27T00:00:00Z",
                                "referenceId": "532067ee-c194-4463-b5a1-a161e5c9388c",
                                "durationDays": 90,
                                "subtype": "",
                                "discountedCategories": {},
                                "scope": "ALL_PRODUCTS",
                                "name": {
                                    "en": "bbbb",
                                    "fr": "bb"
                                },
                                "id": "532067ee-c194-4463-b5a1-a161e5c9388c",
                                "credit": true,
                                "startDate": "2021-05-08T00:00:00Z"
                            },
                            "used": {
                                "packageDiscount": 0.0
                            },
                            "discountId": "532067ee-c194-4463-b5a1-a161e5c9388c",
                            "type": "CREDIT",
                            "startDate": "2021-09-15",
                            "remaining": {
                                "discountedProducts": {},
                                "discountedCategories": {},
                                "packageDiscount": 0.0
                            },
                            "referenceId": "532067ee-c194-4463-b5a1-a161e5c9388c"
                        },
                        "type": "CREDIT"
                    }
                ],
                "adjustmentAggregations": [
                    {
                        "scopedBefore": 189322.23,
                        "scopedAmount": -41650.89,
                        "subtype": "",
                        "before": 251748.98,
                        "cumulativeAmount": -104077.64,
                        "after": 147671.34,
                        "type": "PERCENTAGE",
                        "scopedAfter": 147671.34
                    },
                    {
                        "scopedBefore": 147671.34,
                        "scopedAmount": 0.0,
                        "subtype": "",
                        "before": 147671.34,
                        "cumulativeAmount": 0.0,
                        "after": 147671.34,
                        "type": "CREDIT",
                        "scopedAfter": 147671.34
                    }
                ],
                "endDate": "2021-10-15T00:00:00Z",
                "inclusiveEndDate": "2021-10-14T00:00:00Z",
                "subTotal": 147671.34,
                "dateToSubTotalCost": {
                    "2021-10-06": 34144.890624,
                    "2021-10-07": 32116.48128,
                    "2021-10-08": 21359.336693999998,
                    "2021-10-02": 1497.6,
                    "2021-10-03": 1497.6,
                    "2021-10-04": 12766.995072,
                    "2021-10-05": 33805.234943999996,
                    "2021-09-30": 1497.6,
                    "2021-10-01": 1497.6,
                    "2021-09-25": 1497.6,
                    "2021-09-28": 1497.6,
                    "2021-09-29": 1497.6,
                    "2021-09-26": 1497.6,
                    "2021-09-27": 1497.6
                },
                "dateToTotalCost": {
                    "2021-10-06": 34144.890624,
                    "2021-10-07": 32116.48128,
                    "2021-10-08": 21359.336693999998,
                    "2021-10-02": 1497.6,
                    "2021-10-03": 1497.6,
                    "2021-10-04": 12766.995072,
                    "2021-10-05": 33805.234943999996,
                    "2021-09-30": 1497.6,
                    "2021-10-01": 1497.6,
                    "2021-09-25": 1497.6,
                    "2021-09-28": 1497.6,
                    "2021-09-29": 1497.6,
                    "2021-09-26": 1497.6,
                    "2021-09-27": 1497.6
                },
                "total": 147671.34,
                "currency": "CAD",
                "categories": [
                    {
                        "dateToTotalCost": {
                            "2021-10-06": 34144.890624,
                            "2021-10-07": 32116.48128,
                            "2021-10-08": 21359.336693999998,
                            "2021-10-02": 1497.6,
                            "2021-10-03": 1497.6,
                            "2021-10-04": 12766.995072,
                            "2021-10-05": 33805.234943999996,
                            "2021-09-30": 1497.6,
                            "2021-10-01": 1497.6,
                            "2021-09-25": 1497.6,
                            "2021-09-28": 1497.6,
                            "2021-09-29": 1497.6,
                            "2021-09-26": 1497.6,
                            "2021-09-27": 1497.6
                        },
                        "total": 147671.34,
                        "adjustments": [
                            {
                                "itemId": "950d5a79-f6df-4770-995a-5144e6feb6b0",
                                "amount": -47330.56,
                                "dailyDeltas": {
                                    "2021-10-06": 0.0,
                                    "2021-10-07": -1536.384,
                                    "2021-10-08": -1021.80096,
                                    "2021-10-02": -480.0,
                                    "2021-10-03": -480.0,
                                    "2021-10-04": -779.952,
                                    "2021-10-05": -2289.984,
                                    "2021-09-30": -480.0,
                                    "2021-10-01": -480.0,
                                    "2021-09-25": -480.0,
                                    "2021-09-28": -480.0,
                                    "2021-09-29": -480.0,
                                    "2021-09-26": -480.0,
                                    "2021-09-27": -480.0
                                },
                                "before": 236652.79,
                                "after": 189322.23,
                                "source": {
                                    "endDate": "2021-10-15",
                                    "subtype": "",
                                    "scope": "CATEGORIES",
                                    "typeString": "PERCENTAGE",
                                    "discount": {
                                        "applyToNewCustomersOnly": false,
                                        "discountedProducts": {},
                                        "type": "PERCENTAGE",
                                        "referenceId": "6ee154d1-4318-47bb-bb18-2e605c227889",
                                        "subtype": "",
                                        "discountedCategories": {
                                            "950d5a79-f6df-4770-995a-5144e6feb6b0": 20
                                        },
                                        "scope": "CATEGORIES",
                                        "name": {
                                            "en": "compute-20-percent",
                                            "fr": "compute-20-percent"
                                        },
                                        "id": "6ee154d1-4318-47bb-bb18-2e605c227889",
                                        "credit": false,
                                        "startDate": "2021-05-08T00:00:00Z"
                                    },
                                    "discountId": "6ee154d1-4318-47bb-bb18-2e605c227889",
                                    "type": "PERCENTAGE",
                                    "startDate": "2021-09-15",
                                    "referenceId": "6ee154d1-4318-47bb-bb18-2e605c227889"
                                },
                                "type": "PERCENTAGE"
                            },
                            {
                                "itemId": "950d5a79-f6df-4770-995a-5144e6feb6b0",
                                "amount": -41650.89,
                                "dailyDeltas": {
                                    "2021-10-06": 0.0,
                                    "2021-10-07": -1352.01792,
                                    "2021-10-08": -899.184845,
                                    "2021-10-02": -422.4,
                                    "2021-10-03": -422.4,
                                    "2021-10-04": -686.35776,
                                    "2021-10-05": -2015.18592,
                                    "2021-09-30": -422.4,
                                    "2021-10-01": -422.4,
                                    "2021-09-25": -422.4,
                                    "2021-09-28": -422.4,
                                    "2021-09-29": -422.4,
                                    "2021-09-26": -422.4,
                                    "2021-09-27": -422.4
                                },
                                "before": 189322.23,
                                "after": 147671.34,
                                "source": {
                                    "endDate": "2021-10-15",
                                    "subtype": "",
                                    "scope": "ALL_PRODUCTS",
                                    "typeString": "PERCENTAGE",
                                    "discount": {
                                        "applyToNewCustomersOnly": false,
                                        "discountedProducts": {},
                                        "type": "PERCENTAGE",
                                        "packageDiscount": 22.0,
                                        "referenceId": "9b245d40-ba94-4e05-af51-89979d37fb29",
                                        "subtype": "",
                                        "discountedCategories": {},
                                        "scope": "ALL_PRODUCTS",
                                        "name": {
                                            "en": "discount",
                                            "fr": "escompte"
                                        },
                                        "id": "9b245d40-ba94-4e05-af51-89979d37fb29",
                                        "credit": false,
                                        "startDate": "2021-05-08T00:00:00Z"
                                    },
                                    "discountId": "9b245d40-ba94-4e05-af51-89979d37fb29",
                                    "type": "PERCENTAGE",
                                    "startDate": "2021-09-15",
                                    "referenceId": "9b245d40-ba94-4e05-af51-89979d37fb29"
                                },
                                "type": "PERCENTAGE"
                            }
                        ],
                        "adjustmentAggregations": [
                            {
                                "scopedBefore": 236652.79,
                                "scopedAmount": -88981.45,
                                "subtype": "",
                                "before": 251748.98,
                                "cumulativeAmount": -104077.64,
                                "after": 147671.34,
                                "type": "PERCENTAGE",
                                "scopedAfter": 147671.34
                            }
                        ],
                        "name": {
                            "en": "compute",
                            "fr": "dancer"
                        },
                        "subTotal": 147671.34,
                        "dateToSubTotalCost": {
                            "2021-10-06": 34144.890624,
                            "2021-10-07": 32116.48128,
                            "2021-10-08": 21359.336693999998,
                            "2021-10-02": 1497.6,
                            "2021-10-03": 1497.6,
                            "2021-10-04": 12766.995072,
                            "2021-10-05": 33805.234943999996,
                            "2021-09-30": 1497.6,
                            "2021-10-01": 1497.6,
                            "2021-09-25": 1497.6,
                            "2021-09-28": 1497.6,
                            "2021-09-29": 1497.6,
                            "2021-09-26": 1497.6,
                            "2021-09-27": 1497.6
                        },
                        "categoryId": "950d5a79-f6df-4770-995a-5144e6feb6b0",
                        "products": [
                            {
                                "adjustments": [],
                                "adjustmentAggregations": [
                                    {
                                        "subtype": "",
                                        "before": 49740.6,
                                        "cumulativeAmount": -18702.47,
                                        "after": 31038.13,
                                        "type": "PERCENTAGE"
                                    }
                                ],
                                "productId": "1f656184-df81-47c7-964f-eb9e27743d7b",
                                "usage": 497.406048,
                                "pricingTiers": [],
                                "subTotal": 31038.13,
                                "dateToSubTotalCost": {
                                    "2021-10-06": 0.0,
                                    "2021-10-07": 4793.51808,
                                    "2021-10-08": 3188.018995,
                                    "2021-10-02": 1497.6,
                                    "2021-10-03": 1497.6,
                                    "2021-10-04": 2433.450239999999,
                                    "2021-10-05": 7144.75008,
                                    "2021-09-30": 1497.6,
                                    "2021-10-01": 1497.6,
                                    "2021-09-25": 1497.6,
                                    "2021-09-28": 1497.6,
                                    "2021-09-29": 1497.6,
                                    "2021-09-26": 1497.6,
                                    "2021-09-27": 1497.6
                                },
                                "taxCode": "SW056003",
                                "dateToTotalCost": {
                                    "2021-10-06": 0.0,
                                    "2021-10-07": 4793.51808,
                                    "2021-10-08": 3188.018995,
                                    "2021-10-02": 1497.6,
                                    "2021-10-03": 1497.6,
                                    "2021-10-04": 2433.450239999999,
                                    "2021-10-05": 7144.75008,
                                    "2021-09-30": 1497.6,
                                    "2021-10-01": 1497.6,
                                    "2021-09-25": 1497.6,
                                    "2021-09-28": 1497.6,
                                    "2021-09-29": 1497.6,
                                    "2021-09-26": 1497.6,
                                    "2021-09-27": 1497.6
                                },
                                "total": 31038.13,
                                "unit": {
                                    "unit": "UNIT",
                                    "name": {}
                                },
                                "price": "100.000000",
                                "name": {
                                    "en": "specification",
                                    "fr": "specification"
                                },
                                "sku": "SPEC_PRODUCT",
                                "categoryId": "950d5a79-f6df-4770-995a-5144e6feb6b0"
                            },
                            {
                                "adjustments": [],
                                "adjustmentAggregations": [
                                    {
                                        "subtype": "",
                                        "before": 160493.81,
                                        "cumulativeAmount": -60345.67,
                                        "after": 100148.14,
                                        "type": "PERCENTAGE"
                                    }
                                ],
                                "productId": "3c2bb895-4282-41a1-8db4-2269037dc561",
                                "usage": 8024.690304,
                                "pricingTiers": [],
                                "subTotal": 100148.14,
                                "dateToSubTotalCost": {
                                    "2021-10-06": 29951.640576,
                                    "2021-10-07": 23967.500544,
                                    "2021-10-08": 15939.734353999998,
                                    "2021-10-04": 8630.129664,
                                    "2021-10-05": 21659.129856
                                },
                                "taxCode": "SW056003",
                                "dateToTotalCost": {
                                    "2021-10-06": 29951.640576,
                                    "2021-10-07": 23967.500544,
                                    "2021-10-08": 15939.734353999998,
                                    "2021-10-04": 8630.129664,
                                    "2021-10-05": 21659.129856
                                },
                                "total": 100148.14,
                                "unit": {
                                    "unit": "HOUR",
                                    "name": {}
                                },
                                "price": "20.000000",
                                "name": {
                                    "en": "storage",
                                    "fr": "storage"
                                },
                                "sku": "STORAGE",
                                "categoryId": "950d5a79-f6df-4770-995a-5144e6feb6b0"
                            },
                            {
                                "adjustments": [],
                                "adjustmentAggregations": [
                                    {
                                        "subtype": "",
                                        "before": 11322.18,
                                        "cumulativeAmount": -4257.14,
                                        "after": 7065.04,
                                        "type": "PERCENTAGE"
                                    }
                                ],
                                "productId": "6b94a874-9f85-4a14-9437-d5df30c8191d",
                                "usage": 377.406048,
                                "pricingTiers": [],
                                "subTotal": 7065.04,
                                "dateToSubTotalCost": {
                                    "2021-10-06": 1797.12,
                                    "2021-10-07": 1438.055424,
                                    "2021-10-08": 956.405699,
                                    "2021-10-04": 730.0350719999999,
                                    "2021-10-05": 2143.4250239999997
                                },
                                "taxCode": "SW056003",
                                "dateToTotalCost": {
                                    "2021-10-06": 1797.12,
                                    "2021-10-07": 1438.055424,
                                    "2021-10-08": 956.405699,
                                    "2021-10-04": 730.0350719999999,
                                    "2021-10-05": 2143.4250239999997
                                },
                                "total": 7065.04,
                                "unit": {
                                    "unit": "HOUR",
                                    "name": {}
                                },
                                "price": "30.000000",
                                "name": {
                                    "en": "vm cpu",
                                    "fr": "dancer"
                                },
                                "sku": "VM_CPU",
                                "categoryId": "950d5a79-f6df-4770-995a-5144e6feb6b0"
                            },
                            {
                                "adjustments": [
                                    {
                                        "itemId": "a36933e3-697a-4093-9057-18aed07479ea",
                                        "amount": -15096.19,
                                        "dailyDeltas": {
                                            "2021-10-06": -3839.952,
                                            "2021-10-07": -3072.768,
                                            "2021-10-08": -2043.55392,
                                            "2021-10-04": -1559.904,
                                            "2021-10-05": -4580.016
                                        },
                                        "before": 30192.39,
                                        "after": 15096.2,
                                        "source": {
                                            "endDate": "2021-10-15",
                                            "subtype": "",
                                            "scope": "PRODUCTS",
                                            "typeString": "PERCENTAGE",
                                            "discount": {
                                                "applyToNewCustomersOnly": false,
                                                "discountedProducts": {
                                                    "a36933e3-697a-4093-9057-18aed07479ea": 50
                                                },
                                                "type": "PERCENTAGE",
                                                "referenceId": "455feefb-0270-42ab-b9a1-ce87a430fd99",
                                                "subtype": "",
                                                "discountedCategories": {},
                                                "scope": "PRODUCTS",
                                                "name": {
                                                    "en": "vm-ram-50-percent",
                                                    "fr": "vm-ram-50-percent"
                                                },
                                                "id": "455feefb-0270-42ab-b9a1-ce87a430fd99",
                                                "credit": false,
                                                "startDate": "2021-05-08T00:00:00Z"
                                            },
                                            "discountId": "455feefb-0270-42ab-b9a1-ce87a430fd99",
                                            "type": "PERCENTAGE",
                                            "startDate": "2021-09-15",
                                            "referenceId": "455feefb-0270-42ab-b9a1-ce87a430fd99"
                                        },
                                        "type": "PERCENTAGE"
                                    }
                                ],
                                "adjustmentAggregations": [
                                    {
                                        "scopedBefore": 30192.39,
                                        "scopedAmount": -15096.19,
                                        "subtype": "",
                                        "before": 30192.39,
                                        "cumulativeAmount": -20772.36,
                                        "after": 9420.03,
                                        "type": "PERCENTAGE",
                                        "scopedAfter": 15096.2
                                    }
                                ],
                                "productId": "a36933e3-697a-4093-9057-18aed07479ea",
                                "usage": 754.809696,
                                "pricingTiers": [],
                                "subTotal": 9420.03,
                                "dateToSubTotalCost": {
                                    "2021-10-06": 2396.1300479999995,
                                    "2021-10-07": 1917.407231999999,
                                    "2021-10-08": 1275.1776459999996,
                                    "2021-10-04": 973.380096,
                                    "2021-10-05": 2857.929984
                                },
                                "taxCode": "SW056003",
                                "dateToTotalCost": {
                                    "2021-10-06": 2396.1300479999995,
                                    "2021-10-07": 1917.407231999999,
                                    "2021-10-08": 1275.1776459999996,
                                    "2021-10-04": 973.380096,
                                    "2021-10-05": 2857.929984
                                },
                                "total": 9420.03,
                                "unit": {
                                    "unit": "HOUR",
                                    "name": {}
                                },
                                "price": "40.000000",
                                "name": {
                                    "en": "ram",
                                    "fr": "ram"
                                },
                                "sku": "VM_RAM",
                                "categoryId": "950d5a79-f6df-4770-995a-5144e6feb6b0"
                            }
                        ]
                    }
                ],
                "startDate": "2021-09-15T00:00:00Z"
            },
            "status": "USAGE_PENDING"
        }
    ]
}
```

Optional Query Parameters | &nbsp;
---------- | -----------
`organization_id`<br/>*UUID* | The UUID of the organization the invoice belongs to.
`billingCycle`<br/>*String* | The cycle which the invoice belongs to. Format is `MM-YYYY`

Attributes | &nbsp;
---- | -----------
`id`<br/>*UUID* | The UUID of the invoice.
`invoiceId`<br/>*string* | The human readable id.
`status`<br/>*enum* | The status of the invoice. Possible values are: USAGE_PENDING, IN_REVIEW, ISSUED, OVERDUE, PAID, VOID.
`createdDate`<br/>*date* | The created date of the invoice.
`draftedDate`<br/>*date* | The date the invoice was drafted. Is null if status is still USAGE_PENDING.
`issuedDate`<br/>*date* | The date the invoice was issued.
`dueDate`<br/>*date* | The date the invoice is due.
`organization.id`<br/>*UUID* | The UUID of the organization the invoice belongs to.
`organization.name`<br/>*string* | The name of the organization the invoice belongs to.
`balance`<br/>*BigDecimal* | The invoice's remaining balance.
`detail`<br/>*Object* | The invoice detail contains a currency and a list of categories. Each category has a list of products.
`detail.currency`<br/>*string* | The short-name of the currency.
`detail.subTotal`<br/>*string* | A string containing the total before taxes and credits.
`detail.total`<br/>*string* | The invoice total after discounts, taxes, and credits.
`detail.startDate`<br/>*string* | An ISO-8601 instant format string representing the start of the invoice detail report.
`detail.endDate`<br/>*string* | An ISO-8601 instant format string representing the end of the invoice detail report.
`detail.adjustments`<br/>*Array[Object]* | The adjustments applied to the invoice. An adjustment tracks the application of a discount, a credit or a tax.
`detail.adjustments.type`<br/>*string* | The type of adjustment. Possible values are: PERCENTAGE, CREDIT, TAX.
`detail.adjustments.amount`<br/>*string* | The adjustment amount applied to the invoice total.
`detail.adjustments.before`<br/>*string* | The invoice total before the adjustment was applied.
`detail.adjustments.after`<br/>*string* | The invoice total after the adjustment was applied.
`detail.adjustments.dailyDeltas`<br/>*Object* | A map of the local date to the change in daily cost due to the adjustment.
`detail.adjustments.source`<br/>*Object* | The model of the adjustment. Can be a discount or a tax model.
`detail.adjustmentAggregations`<br/>*Array[Object]* | The adjustment aggregations. An aggregation summarizes the application of discounts, taxes or credits.
`detail.adjustmentAggregations.type`<br/>*string* | The type of adjustment being aggregated. Possible values are: PERCENTAGE, CREDIT, TAX.
`detail.adjustmentAggregations.subtype`<br/>*string* | The optional type used for sub-aggregations, like tax breakdowns.
`detail.categories.products.adjustmentAggregations.scopedAmount`<br/>*string* | The adjustment amount applied to the product total. Only includes adjustments with the same scope as the item.
`detail.categories.products.adjustmentAggregations.scopedBefore`<br/>*string* | The product total before the adjustments were applied. Only includes adjustments with the same scope as the item.
`detail.adjustmentAggregations.before`<br/>*string* | The invoice total before the adjustments were applied.
`detail.adjustmentAggregations.after`<br/>*string* | The invoice total after the adjustments were applied.
`detail.categories.products.adjustmentAggregations.scopedAfter`<br/>*string* | The product total after the adjustments were applied. Only includes adjustments with the same scope as the item.
`detail.adjustmentAggregations.cumulativeAmount`<br/>*string* | The cumulative adjustment amount applied to the invoice, its categories and their products.
`detail.categories`<br/>*Array[Object]* | An array of category objects. Contains all categories that had usage for the period.
`detail.categories.name`<br/>*Object* | A map of short language codes to their translated category names.
`detail.categories.subTotal`<br/>*string* | A string with the category subtotal, before taxes and credits.
`detail.categories.total`<br/>*string* | A string with the category subtotal, after taxes and credits.
`detail.adjustments`<br/>*Array[Object]* | The adjustments applied to the category. An adjustment tracks the application of a discount, a credit or a tax.
`detail.categories.adjustments.type`<br/>*string* | The type of adjustment. Possible values are: PERCENTAGE, CREDIT, TAX.
`detail.categories.adjustments.itemId`<br/>*UUID* | The category id.
`detail.categories.adjustments.amount`<br/>*string* | The adjustment amount applied to the category total.
`detail.categories.adjustments.before`<br/>*string* | The category total before the adjustment was applied.
`detail.categories.adjustments.after`<br/>*string* | The category total after the adjustment was applied.
`detail.categories.adjustments.dailyDeltas`<br/>*Object* | A map of the local date to the change in daily cost due to the adjustment.
`detail.categories.adjustments.source`<br/>*Object* | The model of the adjustment. Can be a discount or a tax model.
`detail.categories.adjustmentAggregations`<br/>*Array[Object]* | The adjustment aggregations. An aggregation summarizes the application of discounts, taxes or credits.
`detail.categories.adjustmentAggregations.type`<br/>*string* | The type of adjustment being aggregated. Possible values are: PERCENTAGE, CREDIT, TAX.
`detail.categories.adjustmentAggregations.subtype`<br/>*string* | The optional type used for sub-aggregations, like tax breakdowns.
`detail.categories.products.adjustmentAggregations.scopedAmount`<br/>*string* | The adjustment amount applied to the product total. Only includes adjustments with the same scope as the item.
`detail.categories.products.adjustmentAggregations.scopedBefore`<br/>*string* | The product total before the adjustments were applied. Only includes adjustments with the same scope as the item.
`detail.categories.adjustmentAggregations.before`<br/>*string* | The category total before the adjustments were applied.
`detail.categories.adjustmentAggregations.after`<br/>*string* | The category total after the adjustments were applied.
`detail.categories.products.adjustmentAggregations.scopedAfter`<br/>*string* | The product total after the adjustments were applied. Only includes adjustments with the same scope as the item.
`detail.categories.adjustmentAggregations.cumulativeAmount`<br/>*string* | The cumulative adjustment amount applied to the category and its products.
`detail.categories.products`<br/>*Object* | A map of short language codes to their translated category names.
`detail.categories.products.sku`<br/>*string* | A unique string representing the sku for a product.
`detail.categories.products.name`<br/>*Object* | The name object in each language for the product name.
`detail.categories.products.cost`<br/>*string* | A string of the summed up total cost for the product.
`detail.categories.products.usage`<br/>*Object* | A string of the summed up total usage for the product.
`detail.categories.products.price`<br/>*Object* | A string representing the *average* unit price over the period.
`detail.categories.products.subTotal`<br/>*string* | A string with the product subtotal, before taxes and credits.
`detail.categories.products.total`<br/>*string* | A string with the product total, after taxes and credits.
`detail.categories.products.period`<br/>*string* | The period for the product capture. Possible values: HOURS, MONTH.
`detail.categories.products.unit`<br/>*Object* | The unit object of the product.
`detail.categories.products.unit.unit`<br/>*Object* | The unit value of the product.
`detail.categories.products.unit.name`<br/>*Object* | The name of the unit of the product in the required language. Only present when defining custom units.
`detail.categories.products.adjustments`<br/>*Array[Object]* | The adjustments applied to the invoice. An adjustment tracks the application of a discount, a credit or a tax.
`detail.categories.products.adjustments.type`<br/>*string* | The type of adjustment. Possible values are: PERCENTAGE, CREDIT, TAX.
`detail.categories.products.adjustments.itemId`<br/>*UUID* | The product id.
`detail.categories.products.adjustments.amount`<br/>*string* | The adjustment amount applied to the product total.
`detail.categories.products.adjustments.before`<br/>*string* | The product total before the adjustment was applied.
`detail.categories.products.adjustments.after`<br/>*string* | The product total after the adjustment was applied.
`detail.categories.products.adjustments.dailyDeltas`<br/>*Object* | A map of the local date to the change in daily cost due to the adjustment.
`detail.categories.products.adjustments.source`<br/>*Object* | The model of the adjustment. Can be a discount or a tax model.
`detail.categories.products.adjustmentAggregations`<br/>*Array[Object]* | The adjustment aggregations. An aggregation summarizes the application of discounts, taxes or credits.
`detail.categories.products.adjustmentAggregations.type`<br/>*string* | The type of adjustment being aggregated. Possible values are: PERCENTAGE, CREDIT, TAX.
`detail.categories.products.adjustmentAggregations.subtype`<br/>*string* | The optional type used for sub-aggregations, like tax breakdowns.
`detail.categories.products.adjustmentAggregations.scopedAmount`<br/>*string* | The adjustment amount applied to the product total. Only includes adjustments with the same scope as the item.
`detail.categories.products.adjustmentAggregations.scopedBefore`<br/>*string* | The product total before the adjustments were applied. Only includes adjustments with the same scope as the item.
`detail.categories.products.adjustmentAggregations.before`<br/>*string* | The product total before the adjustments were applied.
`detail.categories.products.adjustmentAggregations.scopedAfter`<br/>*string* | The product total after the adjustments were applied. Only includes adjustments with the same scope as the item.
`detail.categories.products.adjustmentAggregations.after`<br/>*string* | The product total after the adjustments were applied.
`detail.categories.products.adjustmentAggregations.cumulativeAmount`<br/>*string* | The adjustment amount applied to the product total.

### List invoices of organization as a csv

`GET /invoices?organization_id=:organization_id&billingCycle=MM-YYYY`

Retrieve the list of invoices associated with an organization as a csv report

```shell
# Retrieve list of invoices of an organization
curl "https://cloudmc_endpoint/rest/invoices?organization_id=289ec5fb-0970-44e3-bca8-777a691e23c7&billingCycle=07-2021" \
   -H "MC-Api-Key: your_api_key"
   -H "Accept: text/csv"
```

The response is a list of priced products, with the first line as a header, for the given organization and billing cycle.

The format of the response is a CSV with `,` used as the delimiter.

```csv
organization,custom_field_1,custom_field_2,category,sku,usage,unit,currency,total_before_tax,tax_code,total_tax,tax_name1,tax_amount1,tax_name2,tax_amount2,invoice_number,status,due_date,credit_card_transaction_id,billing_start_date,billing_end_date,
AcmeCorp,null,null,Networking,BANDWIDTH,0.0043,GIGABYTE,USD,$0.00,SW056003,$0.00,QUEBEC QST/TVQ,$0.00,CANADA GST/TPS,$0.00,NFROFNGWHU,IN_REVIEW,null,null,9/20/21,10/20/21,
AcmeCorp,null,null,Compute,CCM-1M02,295.935,GIGABYTE,USD,$21.90,SW056003,$3.28,QUEBEC QST/TVQ,$2.18,CANADA GST/TPS,$1.10,NFROFNGWHU,IN_REVIEW,null,null,9/20/21,10/20/21,%         
```

**Query Parameters**

Optional | &nbsp;
---------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------
`billingCycle`<br/>*String*  | The cycle which the invoice belongs to. Format is `MM-YYYY`. Defaults to the latest billing cycle.
`organization_id`<br/>*UUID* | The reseller for which you're building the report. If not passed will default to the calling user's organization.
`language`<br/>*UUID*        | Language to use for the report fields (but not the headers). Expected values are "en" (English), "fr" (French) or "es" (Spanish). Defaults to "en".

Report Attributes | &nbsp;
----------------- | ------
`organization`<br/>*String* | The organization name.
`custom_field_1`<br/>*String* | The organization custom field (ex: account ID). Configured in the reseller billing settings. <b>There can be more than one custom field<b>.
`category`<br/>*String* | The product category.
`sku`<br/>*String* | The SKU of the product.
`usage`<br/>*String* | The total usage of the product.
`unit`<br/>*String* | The name of the unit of the product.
`currency`<br/>*String* | The short-name of the currency.
`total_before_tax`<br/>*String* | The total cost before taxes are applied.
`tax_code`<br/>*String* | The code of the tax.
`total_tax`<br/>*String* | The total tax.
`tax_name1`<br/>*String* | The name of the tax. Depends on the `tax_code`, reseller billing address and customer billing address. <b>There can be more than one tax name<b>.
`tax_amount1`<br/>*String* | The amount of the tax. Depends on the `tax_code`, reseller billing address and customer billing address. <b>There can be more than one tax amount<b>.
`invoice_number`<br/>*String* | The human-readable number of the invoice.
`status`<br/>*String* | The status of the invoice. Possible values are: USAGE_PENDING, IN_REVIEW, ISSUED, OVERDUE, PAID, VOID.
`due_date`<br/>*String* | The date the invoice is due.
`credit_card_transaction_id`<br/>*String* | The confirmation number returned from the payment provider for the invoice.
`billing_start_date`<br/>*String* | The billing start date of the invoice.
`billing_end_date`<br/>*String* | The billing end date of the invoice.

<!-------------------- APPROVE INVOICE -------------------->
### Approve invoice

`PUT /invoices/:invoice_id/approve`

Manually approve an invoice in the 'IN_REVIEW' state and issue the invoice to the customer by email. If the invoice is already in the 'ISSUED' state, an empty response will be returned and an email will not be sent. If the invoice is in any other state, an error will be thrown.

```shell
# Approve a draft invoice
curl -X PUT "https://cloudmc_endpoint/rest/invoices/20e9b8d8-b1cb-4462-b6e8-fbb8416b2cbb/approve" \
   -H "MC-Api-Key: your_api_key"
```

> The above command returns a JSON structured like this:

```json
{
    "data": [
        {
            "draftedDate": "2021-11-19T17:14:44Z",
            "createdDate": "2021-11-19T17:14:44Z",
            "billingCycle": {
                "id": "bf5d38ba-74f4-459a-be5f-2fd771cf0a68"
            },
            "organization": {
                "customFields": {},
                "name": "System",
                "id": "c869e848-6fb3-4850-af3d-42c5666f2c78"
            },
            "invoiceId": "ZASBNWS5IH",
            "id": "150006dd-697c-4021-82ab-483f5a132c2c",
            "detail": {
                "adjustments": [
                    {
                        "amount": -28891.86,
                        "dailyDeltas": {
                            "2021-08-11": 2111.974656,
                            "2021-08-10": 2111.974656,
                            "2021-08-13": 2111.974656,
                            "2021-08-12": 4223.949312,
                            "2021-08-04": 4223.949312,
                            "2021-08-14": 2111.974656,
                            "2021-08-06": 2111.974656,
                            "2021-08-05": 0.0,
                            "2021-08-08": 2111.974656,
                            "2021-08-07": 2111.974656,
                            "2021-08-09": 2111.974656
                        },
                        "before": 131326.62,
                        "after": 102434.76,
                        "source": {
                            "endDate": "2021-08-15",
                            "subtype": "",
                            "scope": "ALL_PRODUCTS",
                            "typeString": "PERCENTAGE",
                            "discount": {
                                "applyToNewCustomersOnly": false,
                                "discountedProducts": {},
                                "type": "PERCENTAGE",
                                "packageDiscount": 22.0,
                                "referenceId": "9b245d40-ba94-4e05-af51-89979d37fb29",
                                "subtype": "",
                                "discountedCategories": {},
                                "scope": "ALL_PRODUCTS",
                                "name": {
                                    "en": "discount",
                                    "fr": "escompte"
                                },
                                "id": "9b245d40-ba94-4e05-af51-89979d37fb29",
                                "credit": false,
                                "startDate": "2021-05-08T00:00:00Z"
                            },
                            "discountId": "9b245d40-ba94-4e05-af51-89979d37fb29",
                            "type": "PERCENTAGE",
                            "startDate": "2021-08-04",
                            "referenceId": "9b245d40-ba94-4e05-af51-89979d37fb29"
                        },
                        "type": "PERCENTAGE"
                    },
                    {
                        "amount": -101934.76,
                        "dailyDeltas": {
                            "2021-08-11": 8536.230144,
                            "2021-08-10": 8536.230144,
                            "2021-08-13": 8536.230144,
                            "2021-08-12": 17072.460288,
                            "2021-08-04": 16572.460288,
                            "2021-08-14": 8536.230144,
                            "2021-08-06": 8536.230144,
                            "2021-08-05": 0.0,
                            "2021-08-08": 8536.230144,
                            "2021-08-07": 8536.230144,
                            "2021-08-09": 8536.230144
                        },
                        "before": 101934.76,
                        "after": 0.0,
                        "source": {
                            "endDate": "2021-08-15",
                            "subtype": "",
                            "scope": "ALL_PRODUCTS",
                            "typeString": "CREDIT",
                            "discount": {
                                "applyToNewCustomersOnly": false,
                                "discountedProducts": {},
                                "type": "CREDIT",
                                "packageDiscount": 250000.0,
                                "cutoffDate": "2021-09-27T00:00:00Z",
                                "referenceId": "532067ee-c194-4463-b5a1-a161e5c9388c",
                                "durationDays": 90,
                                "subtype": "",
                                "discountedCategories": {},
                                "scope": "ALL_PRODUCTS",
                                "name": {
                                    "en": "3 month credit",
                                    "fr": "3 month credit fr"
                                },
                                "id": "532067ee-c194-4463-b5a1-a161e5c9388c",
                                "credit": true,
                                "startDate": "2021-05-08T00:00:00Z"
                            },
                            "used": {
                                "packageDiscount": -101934.76
                            },
                            "discountId": "532067ee-c194-4463-b5a1-a161e5c9388c",
                            "type": "CREDIT",
                            "startDate": "2021-08-04",
                            "remaining": {
                                "discountedProducts": {},
                                "discountedCategories": {},
                                "packageDiscount": 250000.0
                            },
                            "referenceId": "532067ee-c194-4463-b5a1-a161e5c9388c"
                        },
                        "type": "CREDIT"
                    }
                ],
                "adjustmentAggregations": [
                    {
                        "scopedBefore": 131326.62,
                        "scopedAmount": -28891.86,
                        "subtype": "",
                        "before": 175678.27,
                        "cumulativeAmount": -73243.51,
                        "after": 102434.76,
                        "type": "PERCENTAGE",
                        "scopedAfter": 102434.76
                    },
                    {
                        "scopedBefore": 101934.76,
                        "scopedAmount": -101934.76,
                        "subtype": "",
                        "before": 102434.76,
                        "cumulativeAmount": -102434.76,
                        "after": 0.0,
                        "type": "CREDIT",
                        "scopedAfter": 0.0
                    }
                ],
                "endDate": "2021-08-15T00:00:00Z",
                "inclusiveEndDate": "2021-08-14T00:00:00Z",
                "subTotal": 102434.76,
                "dateToSubTotalCost": {
                    "2021-08-11": 8536.230144,
                    "2021-08-10": 8536.230144,
                    "2021-08-13": 8536.230144,
                    "2021-08-12": 17072.460288,
                    "2021-08-04": 17072.460288,
                    "2021-08-14": 8536.230144,
                    "2021-08-06": 8536.230144,
                    "2021-08-05": 0.0,
                    "2021-08-08": 8536.230144,
                    "2021-08-07": 8536.230144,
                    "2021-08-09": 8536.230144
                },
                "dateToTotalCost": {
                    "2021-08-11": 0.0,
                    "2021-08-10": 0.0,
                    "2021-08-13": 0.0,
                    "2021-08-12": 0.0,
                    "2021-08-04": 0.0,
                    "2021-08-14": 0.0,
                    "2021-08-06": 0.0,
                    "2021-08-05": 0.0,
                    "2021-08-08": 0.0,
                    "2021-08-07": 0.0,
                    "2021-08-09": 0.0
                },
                "total": 0.0,
                "currency": "CAD",
                "categories": [
                    {
                        "dateToTotalCost": {
                            "2021-08-11": 8536.230144,
                            "2021-08-10": 8536.230144,
                            "2021-08-13": 8536.230144,
                            "2021-08-12": 17072.460288,
                            "2021-08-04": 16572.460288,
                            "2021-08-14": 8536.230144,
                            "2021-08-06": 8536.230144,
                            "2021-08-05": 0.0,
                            "2021-08-08": 8536.230144,
                            "2021-08-07": 8536.230144,
                            "2021-08-09": 8536.230144
                        },
                        "total": 101934.76,
                        "adjustments": [
                            {
                                "itemId": "950d5a79-f6df-4770-995a-5144e6feb6b0",
                                "amount": -32831.65,
                                "dailyDeltas": {
                                    "2021-08-11": 2399.9712,
                                    "2021-08-10": 2399.9712,
                                    "2021-08-13": 2399.9712,
                                    "2021-08-12": 4799.9424,
                                    "2021-08-04": 4799.9424,
                                    "2021-08-14": 2399.9712,
                                    "2021-08-06": 2399.9712,
                                    "2021-08-05": 0.0,
                                    "2021-08-08": 2399.9712,
                                    "2021-08-07": 2399.9712,
                                    "2021-08-09": 2399.9712
                                },
                                "before": 164158.27,
                                "after": 131326.62,
                                "source": {
                                    "endDate": "2021-08-15",
                                    "subtype": "",
                                    "scope": "CATEGORIES",
                                    "typeString": "PERCENTAGE",
                                    "discount": {
                                        "applyToNewCustomersOnly": false,
                                        "discountedProducts": {},
                                        "type": "PERCENTAGE",
                                        "referenceId": "6ee154d1-4318-47bb-bb18-2e605c227889",
                                        "subtype": "",
                                        "discountedCategories": {
                                            "950d5a79-f6df-4770-995a-5144e6feb6b0": 20
                                        },
                                        "scope": "CATEGORIES",
                                        "name": {
                                            "en": "compute-20-percent",
                                            "fr": "compute-20-percent"
                                        },
                                        "id": "6ee154d1-4318-47bb-bb18-2e605c227889",
                                        "credit": false,
                                        "startDate": "2021-05-08T00:00:00Z"
                                    },
                                    "discountId": "6ee154d1-4318-47bb-bb18-2e605c227889",
                                    "type": "PERCENTAGE",
                                    "startDate": "2021-08-04",
                                    "referenceId": "6ee154d1-4318-47bb-bb18-2e605c227889"
                                },
                                "type": "PERCENTAGE"
                            },
                            {
                                "itemId": "950d5a79-f6df-4770-995a-5144e6feb6b0",
                                "amount": -28891.86,
                                "dailyDeltas": {
                                    "2021-08-11": 2111.974656,
                                    "2021-08-10": 2111.974656,
                                    "2021-08-13": 2111.974656,
                                    "2021-08-12": 4223.949312,
                                    "2021-08-04": 4223.949312,
                                    "2021-08-14": 2111.974656,
                                    "2021-08-06": 2111.974656,
                                    "2021-08-05": 0.0,
                                    "2021-08-08": 2111.974656,
                                    "2021-08-07": 2111.974656,
                                    "2021-08-09": 2111.974656
                                },
                                "before": 131326.62,
                                "after": 102434.76,
                                "source": {
                                    "endDate": "2021-08-15",
                                    "subtype": "",
                                    "scope": "ALL_PRODUCTS",
                                    "typeString": "PERCENTAGE",
                                    "discount": {
                                        "applyToNewCustomersOnly": false,
                                        "discountedProducts": {},
                                        "type": "PERCENTAGE",
                                        "packageDiscount": 22.0,
                                        "referenceId": "9b245d40-ba94-4e05-af51-89979d37fb29",
                                        "subtype": "",
                                        "discountedCategories": {},
                                        "scope": "ALL_PRODUCTS",
                                        "name": {
                                            "en": "discount",
                                            "fr": "escompte"
                                        },
                                        "id": "9b245d40-ba94-4e05-af51-89979d37fb29",
                                        "credit": false,
                                        "startDate": "2021-05-08T00:00:00Z"
                                    },
                                    "discountId": "9b245d40-ba94-4e05-af51-89979d37fb29",
                                    "type": "PERCENTAGE",
                                    "startDate": "2021-08-04",
                                    "referenceId": "9b245d40-ba94-4e05-af51-89979d37fb29"
                                },
                                "type": "PERCENTAGE"
                            },
                            {
                                "itemId": "950d5a79-f6df-4770-995a-5144e6feb6b0",
                                "amount": -500.0,
                                "dailyDeltas": {
                                    "2021-08-04": 500.0
                                },
                                "before": 102434.76,
                                "after": 101934.76,
                                "source": {
                                    "endDate": "2021-08-15",
                                    "subtype": "",
                                    "scope": "CATEGORIES",
                                    "typeString": "CREDIT",
                                    "discount": {
                                        "applyToNewCustomersOnly": false,
                                        "discountedProducts": {},
                                        "type": "CREDIT",
                                        "referenceId": "85d5fc06-142a-4e04-9a27-2bf08b3c1be0",
                                        "durationDays": 600,
                                        "subtype": "",
                                        "discountedCategories": {
                                            "950d5a79-f6df-4770-995a-5144e6feb6b0": 500
                                        },
                                        "scope": "CATEGORIES",
                                        "name": {
                                            "en": "compute-500-bucks",
                                            "fr": "compute-500-bucks"
                                        },
                                        "id": "85d5fc06-142a-4e04-9a27-2bf08b3c1be0",
                                        "credit": true,
                                        "startDate": "2021-05-08T00:00:00Z"
                                    },
                                    "used": {
                                        "discountedCategories": {
                                            "950d5a79-f6df-4770-995a-5144e6feb6b0": -500.0
                                        }
                                    },
                                    "discountId": "85d5fc06-142a-4e04-9a27-2bf08b3c1be0",
                                    "type": "CREDIT",
                                    "startDate": "2021-08-04",
                                    "remaining": {
                                        "discountedProducts": {},
                                        "discountedCategories": {
                                            "950d5a79-f6df-4770-995a-5144e6feb6b0": 500
                                        }
                                    },
                                    "referenceId": "85d5fc06-142a-4e04-9a27-2bf08b3c1be0"
                                },
                                "type": "CREDIT"
                            }
                        ],
                        "adjustmentAggregations": [
                            {
                                "scopedBefore": 164158.27,
                                "scopedAmount": -61723.51,
                                "subtype": "",
                                "before": 175678.27,
                                "cumulativeAmount": -73243.51,
                                "after": 102434.76,
                                "type": "PERCENTAGE",
                                "scopedAfter": 102434.76
                            },
                            {
                                "scopedBefore": 102434.76,
                                "scopedAmount": -500.0,
                                "subtype": "",
                                "before": 102434.76,
                                "cumulativeAmount": -500.0,
                                "after": 101934.76,
                                "type": "CREDIT",
                                "scopedAfter": 101934.76
                            }
                        ],
                        "name": {
                            "en": "compute",
                            "fr": "compute"
                        },
                        "subTotal": 102434.76,
                        "dateToSubTotalCost": {
                            "2021-08-11": 8536.230144,
                            "2021-08-10": 8536.230144,
                            "2021-08-13": 8536.230144,
                            "2021-08-12": 17072.460288,
                            "2021-08-04": 17072.460288,
                            "2021-08-14": 8536.230144,
                            "2021-08-06": 8536.230144,
                            "2021-08-05": 0.0,
                            "2021-08-08": 8536.230144,
                            "2021-08-07": 8536.230144,
                            "2021-08-09": 8536.230144
                        },
                        "categoryId": "950d5a79-f6df-4770-995a-5144e6feb6b0",
                        "products": [
                            {
                                "adjustments": [],
                                "adjustmentAggregations": [
                                    {
                                        "subtype": "",
                                        "before": 143998.27,
                                        "cumulativeAmount": -54143.35,
                                        "after": 89854.92,
                                        "type": "PERCENTAGE"
                                    }
                                ],
                                "productId": "3c2bb895-4282-41a1-8db4-2269037dc561",
                                "usage": 7199.9136,
                                "pricingTiers": [],
                                "subTotal": 89854.92,
                                "dateToSubTotalCost": {
                                    "2021-08-11": 7487.910144,
                                    "2021-08-10": 7487.910144,
                                    "2021-08-13": 7487.910144,
                                    "2021-08-12": 14975.820288,
                                    "2021-08-04": 14975.820288,
                                    "2021-08-14": 7487.910144,
                                    "2021-08-06": 7487.910144,
                                    "2021-08-05": 0.0,
                                    "2021-08-08": 7487.910144,
                                    "2021-08-07": 7487.910144,
                                    "2021-08-09": 7487.910144
                                },
                                "taxCode": "SW056003",
                                "dateToTotalCost": {
                                    "2021-08-11": 7487.910144,
                                    "2021-08-10": 7487.910144,
                                    "2021-08-13": 7487.910144,
                                    "2021-08-12": 14975.820288,
                                    "2021-08-04": 14975.820288,
                                    "2021-08-14": 7487.910144,
                                    "2021-08-06": 7487.910144,
                                    "2021-08-05": 0.0,
                                    "2021-08-08": 7487.910144,
                                    "2021-08-07": 7487.910144,
                                    "2021-08-09": 7487.910144
                                },
                                "total": 89854.92,
                                "unit": {
                                    "unit": "HOUR",
                                    "name": {}
                                },
                                "price": "20.000000",
                                "name": {
                                    "en": "storage",
                                    "fr": "storage"
                                },
                                "sku": "STORAGE",
                                "categoryId": "950d5a79-f6df-4770-995a-5144e6feb6b0"
                            },
                            {
                                "adjustments": [],
                                "adjustmentAggregations": [
                                    {
                                        "subtype": "",
                                        "before": 8640.0,
                                        "cumulativeAmount": -3248.64,
                                        "after": 5391.36,
                                        "type": "PERCENTAGE"
                                    }
                                ],
                                "productId": "6b94a874-9f85-4a14-9437-d5df30c8191d",
                                "usage": 288.0,
                                "pricingTiers": [],
                                "subTotal": 5391.36,
                                "dateToSubTotalCost": {
                                    "2021-08-11": 449.28,
                                    "2021-08-10": 449.28,
                                    "2021-08-13": 449.28,
                                    "2021-08-12": 898.56,
                                    "2021-08-04": 898.56,
                                    "2021-08-14": 449.28,
                                    "2021-08-06": 449.28,
                                    "2021-08-05": 0.0,
                                    "2021-08-08": 449.28,
                                    "2021-08-07": 449.28,
                                    "2021-08-09": 449.28
                                },
                                "taxCode": "SW056003",
                                "dateToTotalCost": {
                                    "2021-08-11": 449.28,
                                    "2021-08-10": 449.28,
                                    "2021-08-13": 449.28,
                                    "2021-08-12": 898.56,
                                    "2021-08-04": 898.56,
                                    "2021-08-14": 449.28,
                                    "2021-08-06": 449.28,
                                    "2021-08-05": 0.0,
                                    "2021-08-08": 449.28,
                                    "2021-08-07": 449.28,
                                    "2021-08-09": 449.28
                                },
                                "total": 5391.36,
                                "unit": {
                                    "unit": "HOUR",
                                    "name": {}
                                },
                                "price": "30.000000",
                                "name": {
                                    "en": "vm cpu",
                                    "fr": "vm cpu"
                                },
                                "sku": "VM_CPU",
                                "categoryId": "950d5a79-f6df-4770-995a-5144e6feb6b0"
                            },
                            {
                                "adjustments": [
                                    {
                                        "itemId": "a36933e3-697a-4093-9057-18aed07479ea",
                                        "amount": -11520.0,
                                        "dailyDeltas": {
                                            "2021-08-11": 960.0,
                                            "2021-08-10": 960.0,
                                            "2021-08-13": 960.0,
                                            "2021-08-12": 1920.0,
                                            "2021-08-04": 1920.0,
                                            "2021-08-14": 960.0,
                                            "2021-08-06": 960.0,
                                            "2021-08-05": 0.0,
                                            "2021-08-08": 960.0,
                                            "2021-08-07": 960.0,
                                            "2021-08-09": 960.0
                                        },
                                        "before": 23040.0,
                                        "after": 11520.0,
                                        "source": {
                                            "endDate": "2021-08-15",
                                            "subtype": "",
                                            "scope": "PRODUCTS",
                                            "typeString": "PERCENTAGE",
                                            "discount": {
                                                "applyToNewCustomersOnly": false,
                                                "discountedProducts": {
                                                    "a36933e3-697a-4093-9057-18aed07479ea": 50
                                                },
                                                "type": "PERCENTAGE",
                                                "referenceId": "455feefb-0270-42ab-b9a1-ce87a430fd99",
                                                "subtype": "",
                                                "discountedCategories": {},
                                                "scope": "PRODUCTS",
                                                "name": {
                                                    "en": "vm-ram-50-percent",
                                                    "fr": "vm-ram-50-percent"
                                                },
                                                "id": "455feefb-0270-42ab-b9a1-ce87a430fd99",
                                                "credit": false,
                                                "startDate": "2021-05-08T00:00:00Z"
                                            },
                                            "discountId": "455feefb-0270-42ab-b9a1-ce87a430fd99",
                                            "type": "PERCENTAGE",
                                            "startDate": "2021-08-04",
                                            "referenceId": "455feefb-0270-42ab-b9a1-ce87a430fd99"
                                        },
                                        "type": "PERCENTAGE"
                                    }
                                ],
                                "adjustmentAggregations": [
                                    {
                                        "scopedBefore": 23040.0,
                                        "scopedAmount": -11520.0,
                                        "subtype": "",
                                        "before": 23040.0,
                                        "cumulativeAmount": -15851.52,
                                        "after": 7188.48,
                                        "type": "PERCENTAGE",
                                        "scopedAfter": 11520.0
                                    }
                                ],
                                "productId": "a36933e3-697a-4093-9057-18aed07479ea",
                                "usage": 576.0,
                                "pricingTiers": [],
                                "subTotal": 7188.48,
                                "dateToSubTotalCost": {
                                    "2021-08-11": 599.04,
                                    "2021-08-10": 599.04,
                                    "2021-08-13": 599.04,
                                    "2021-08-12": 1198.08,
                                    "2021-08-04": 1198.08,
                                    "2021-08-14": 599.04,
                                    "2021-08-06": 599.04,
                                    "2021-08-05": 0.0,
                                    "2021-08-08": 599.04,
                                    "2021-08-07": 599.04,
                                    "2021-08-09": 599.04
                                },
                                "taxCode": "SW056003",
                                "dateToTotalCost": {
                                    "2021-08-11": 599.04,
                                    "2021-08-10": 599.04,
                                    "2021-08-13": 599.04,
                                    "2021-08-12": 1198.08,
                                    "2021-08-04": 1198.08,
                                    "2021-08-14": 599.04,
                                    "2021-08-06": 599.04,
                                    "2021-08-05": 0.0,
                                    "2021-08-08": 599.04,
                                    "2021-08-07": 599.04,
                                    "2021-08-09": 599.04
                                },
                                "total": 7188.48,
                                "unit": {
                                    "unit": "HOUR",
                                    "name": {}
                                },
                                "price": "40.000000",
                                "name": {
                                    "en": "ram",
                                    "fr": "ram"
                                },
                                "sku": "VM_RAM",
                                "categoryId": "950d5a79-f6df-4770-995a-5144e6feb6b0"
                            }
                        ]
                    }
                ],
                "startDate": "2021-08-04T00:00:00Z"
            },
            "status": "ISSUED"
        }
    ]
}
```

Attributes | &nbsp;
---- | -----------
`id`<br/>*UUID* | The UUID of the invoice.
`invoiceId`<br/>*string* | The human readable id.
`status`<br/>*enum* | The status of the invoice. Possible values are: USAGE_PENDING, IN_REVIEW, ISSUED, OVERDUE, PAID, VOID.
`createdDate`<br/>*date* | The created date of the invoice.
`draftedDate`<br/>*date* | The date the invoice was drafted. Is null if status is still USAGE_PENDING.
`issuedDate`<br/>*date* | The date the invoice was issued.
`dueDate`<br/>*date* | The date the invoice is due.
`organization.id`<br/>*UUID* | The UUID of the organization the invoice belongs to.
`organization.name`<br/>*string* | The name of the organization the invoice belongs to.
`balance`<br/>*BigDecimal* | The invoice's remaining balance.
`detail`<br/>*Object* | The invoice detail contains a currency and a list of categories. Each category has a list of products.
`detail.currency`<br/>*string* | The short-name of the currency.
`detail.subTotal`<br/>*string* | A string containing the total before taxes and credits.
`detail.total`<br/>*string* | The invoice total after discounts, taxes, and credits.
`detail.startDate`<br/>*string* | An ISO-8601 instant format string representing the start of the invoice detail report.
`detail.endDate`<br/>*string* | An ISO-8601 instant format string representing the end of the invoice detail report.
`detail.adjustments`<br/>*Array[Object]* | The adjustments applied to the invoice. An adjustment tracks the application of a discount, a credit or a tax.
`detail.adjustments.type`<br/>*string* | The type of adjustment. Possible values are: PERCENTAGE, CREDIT, TAX.
`detail.adjustments.amount`<br/>*string* | The adjustment amount applied to the invoice total.
`detail.adjustments.before`<br/>*string* | The invoice total before the adjustment was applied.
`detail.adjustments.after`<br/>*string* | The invoice total after the adjustment was applied.
`detail.adjustments.dailyDeltas`<br/>*Object* | A map of the local date to the change in daily cost due to the adjustment.
`detail.adjustments.source`<br/>*Object* | The model of the adjustment. Can be a discount or a tax model.
`detail.adjustmentAggregations`<br/>*Array[Object]* | The adjustment aggregations. An aggregation summarizes the application of discounts, taxes or credits.
`detail.adjustmentAggregations.type`<br/>*string* | The type of adjustment being aggregated. Possible values are: PERCENTAGE, CREDIT, TAX.
`detail.adjustmentAggregations.subtype`<br/>*string* | The optional type used for sub-aggregations, like tax breakdowns.
`detail.categories.products.adjustmentAggregations.scopedAmount`<br/>*string* | The adjustment amount applied to the product total. Only includes adjustments with the same scope as the item.
`detail.categories.products.adjustmentAggregations.scopedBefore`<br/>*string* | The product total before the adjustments were applied. Only includes adjustments with the same scope as the item.
`detail.adjustmentAggregations.before`<br/>*string* | The invoice total before the adjustments were applied.
`detail.adjustmentAggregations.after`<br/>*string* | The invoice total after the adjustments were applied.
`detail.categories.products.adjustmentAggregations.scopedAfter`<br/>*string* | The product total after the adjustments were applied. Only includes adjustments with the same scope as the item.
`detail.adjustmentAggregations.cumulativeAmount`<br/>*string* | The cumulative adjustment amount applied to the invoice, its categories and their products.
`detail.categories`<br/>*Array[Object]* | An array of category objects. Contains all categories that had usage for the period.
`detail.categories.name`<br/>*Object* | A map of short language codes to their translated category names.
`detail.categories.subTotal`<br/>*string* | A string with the category subtotal, before taxes and credits.
`detail.categories.total`<br/>*string* | A string with the category subtotal, after taxes and credits.
`detail.adjustments`<br/>*Array[Object]* | The adjustments applied to the category. An adjustment tracks the application of a discount, a credit or a tax.
`detail.categories.adjustments.type`<br/>*string* | The type of adjustment. Possible values are: PERCENTAGE, CREDIT, TAX.
`detail.categories.adjustments.itemId`<br/>*UUID* | The category id.
`detail.categories.adjustments.amount`<br/>*string* | The adjustment amount applied to the category total.
`detail.categories.adjustments.before`<br/>*string* | The category total before the adjustment was applied.
`detail.categories.adjustments.after`<br/>*string* | The category total after the adjustment was applied.
`detail.categories.adjustments.dailyDeltas`<br/>*Object* | A map of the local date to the change in daily cost due to the adjustment.
`detail.categories.adjustments.source`<br/>*Object* | The model of the adjustment. Can be a discount or a tax model.
`detail.categories.adjustmentAggregations`<br/>*Array[Object]* | The adjustment aggregations. An aggregation summarizes the application of discounts, taxes or credits.
`detail.categories.adjustmentAggregations.type`<br/>*string* | The type of adjustment being aggregated. Possible values are: PERCENTAGE, CREDIT, TAX.
`detail.categories.adjustmentAggregations.subtype`<br/>*string* | The optional type used for sub-aggregations, like tax breakdowns.
`detail.categories.products.adjustmentAggregations.scopedAmount`<br/>*string* | The adjustment amount applied to the product total. Only includes adjustments with the same scope as the item.
`detail.categories.products.adjustmentAggregations.scopedBefore`<br/>*string* | The product total before the adjustments were applied. Only includes adjustments with the same scope as the item.
`detail.categories.adjustmentAggregations.before`<br/>*string* | The category total before the adjustments were applied.
`detail.categories.adjustmentAggregations.after`<br/>*string* | The category total after the adjustments were applied.
`detail.categories.products.adjustmentAggregations.scopedAfter`<br/>*string* | The product total after the adjustments were applied. Only includes adjustments with the same scope as the item.
`detail.categories.adjustmentAggregations.cumulativeAmount`<br/>*string* | The cumulative adjustment amount applied to the category and its products.
`detail.categories.products`<br/>*Object* | A map of short language codes to their translated category names.
`detail.categories.products.sku`<br/>*string* | A unique string representing the sku for a product.
`detail.categories.products.name`<br/>*Object* | The name object in each language for the product name.
`detail.categories.products.cost`<br/>*string* | A string of the summed up total cost for the product.
`detail.categories.products.usage`<br/>*Object* | A string of the summed up total usage for the product.
`detail.categories.products.price`<br/>*Object* | A string representing the *average* unit price over the period.
`detail.categories.products.subTotal`<br/>*string* | A string with the product subtotal, before taxes and credits.
`detail.categories.products.total`<br/>*string* | A string with the product total, after taxes and credits.
`detail.categories.products.period`<br/>*string* | The period for the product capture. Possible values: HOURS, MONTH.
`detail.categories.products.unit`<br/>*Object* | The unit object of the product.
`detail.categories.products.unit.unit`<br/>*Object* | The unit value of the product.
`detail.categories.products.unit.name`<br/>*Object* | The name of the unit of the product in the required language. Only present when defining custom units.
`detail.categories.products.adjustments`<br/>*Array[Object]* | The adjustments applied to the invoice. An adjustment tracks the application of a discount, a credit or a tax.
`detail.categories.products.adjustments.type`<br/>*string* | The type of adjustment. Possible values are: PERCENTAGE, CREDIT, TAX.
`detail.categories.products.adjustments.itemId`<br/>*UUID* | The product id.
`detail.categories.products.adjustments.amount`<br/>*string* | The adjustment amount applied to the product total.
`detail.categories.products.adjustments.before`<br/>*string* | The product total before the adjustment was applied.
`detail.categories.products.adjustments.after`<br/>*string* | The product total after the adjustment was applied.
`detail.categories.products.adjustments.dailyDeltas`<br/>*Object* | A map of the local date to the change in daily cost due to the adjustment.
`detail.categories.products.adjustments.source`<br/>*Object* | The model of the adjustment. Can be a discount or a tax model.
`detail.categories.products.adjustmentAggregations`<br/>*Array[Object]* | The adjustment aggregations. An aggregation summarizes the application of discounts, taxes or credits.
`detail.categories.products.adjustmentAggregations.type`<br/>*string* | The type of adjustment being aggregated. Possible values are: PERCENTAGE, CREDIT, TAX.
`detail.categories.products.adjustmentAggregations.subtype`<br/>*string* | The optional type used for sub-aggregations, like tax breakdowns.
`detail.categories.products.adjustmentAggregations.scopedAmount`<br/>*string* | The adjustment amount applied to the product total. Only includes adjustments with the same scope as the item.
`detail.categories.products.adjustmentAggregations.scopedBefore`<br/>*string* | The product total before the adjustments were applied. Only includes adjustments with the same scope as the item.
`detail.categories.products.adjustmentAggregations.before`<br/>*string* | The product total before the adjustments were applied.
`detail.categories.products.adjustmentAggregations.scopedAfter`<br/>*string* | The product total after the adjustments were applied. Only includes adjustments with the same scope as the item.
`detail.categories.products.adjustmentAggregations.after`<br/>*string* | The product total after the adjustments were applied.
`detail.categories.products.adjustmentAggregations.cumulativeAmount`<br/>*string* | The adjustment amount applied to the product total.

<!-------------------- DOWNLOAD INVOICE -------------------->
### Download invoice

`GET /invoices/download?invoice_id=:invoice_id`

Download an invoice as a PDF file.

```shell
# Download an invoice
curl  -X GET 'https://cloudmc_endpoint/rest/invoices/download?invoice_id=3f7b7cca-d440-4c70-8ea7-ff23fe88b152' \
  -H 'MC-Api-Key: your_api_key'
```

| Required | &nbsp; |
| --- | --- |
| `invoice_id`<br/>*UUID* | The id of the invoice. |


<!-------------------- FLAG INVOICE -------------------->

`POST /invoices/:invoiceId/flag`

Flag an invoice with a message to prevent the invoice from being automatically issued to the customer. 

As with other invoices that are not in the hands of the customer, pricing configuration changes can be made to regenerate the invoice.
If the configuration changes made impact the invoice, it will be voided and a new invoice will be generated. If the invoice was previously flagged, the new invoice will still have the same flag and will need to be manually approved to issue it to the customer.


```shell
# Approve a draft invoice
curl -X POST "https://cloudmc_endpoint/rest/invoices/20e9b8d8-b1cb-4462-b6e8-fbb8416b2cbb/flag" \
   -H "MC-Api-Key: your_api_key"
```

| Required | &nbsp; |
| --- | --- |
| `invoiceId`<br/>*UUID* | The id of the invoice to be flagged |
| `message`<br/>*String* | A 280 character message about why this invoice needed to be flagged. 


> Request body example:

```json
{
   "message": "The prices charged to this customer are incorrect. We should perform a pricing change and ensure the invoice is regenerated."
}
```

> The above command return JSON structured like this:
```json
{
	"data": {
		"createdAt": "2022-04-08T12:40:33Z",
		"invoice": {
			"id": "0bf4b212-816b-4c6d-9466-47abeb0a0826"
		},
		"message": "The prices charged to this customer are incorrect. We should perform a pricing change and ensure the invoice is regenerated.",
		"user": {
			"firstName": "Jason",
			"lastName": "Dias",
			"id": "f117f36e-902e-41fb-b7b2-0a6a73be5396",
			"email": "jdias@cloudops.com"
		}
	}
}
```