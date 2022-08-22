
# Reports

## Get Dashboard Stats

```shell
curl --location --request GET 'https://yourdomain.com/wp-json/fluent-crm/v2/reports/dashboard-stats' \
--header 'Authorization: Basic API_USERNAME:API_PASSWORD'
```

> The above command returns JSON structured like this:

```json
{
    "stats": {
        "total_subscribers": {
            "title": "Total Contacts",
            "count": 114,
            "route": {
                "name": "subscribers"
            }
        },
        "total_campaigns": {
            "title": "Campaigns",
            "count": 18,
            "route": {
                "name": "campaigns"
            }
        },
        "email_sent": {
            "title": "Emails Sent",
            "count": 79,
            "route": {
                "name": "all_emails"
            }
        },
        "tags": {
            "title": "Tags",
            "count": 5,
            "route": {
                "name": "tags"
            }
        },
        "total_templates": {
            "title": "Email Templates",
            "count": ,
            "route": {
                "name": "templates"
            }
        }
    },
    "sales": [
      {
         "title":"Earnings (Today)",
         "content":"&#36;0.00"
      },
      {
         "title":"Earnings (Current Month)",
         "content":"&#36;0.00"
      },
      {
         "title":"Earnings (All Time)",
         "content":"&#36;0.00"
      }
    ],
    "onboarding": {
        "total": 5,
        "completed": 3,
        "steps": [
            {
                "label": "Create a Tag",
                "completed": true,
                "route": {
                    "name": "tags"
                }
            },
            {
                "label": "Import Contacts",
                "completed": true,
                "route": {
                    "name": "subscribers"
                }
            },
            {
                "label": "Create a Campaign",
                "completed": false,
                "route": {
                    "name": "campaigns"
                }
            },
            {
                "label": "Create an Automation",
                "completed": true,
                "route": {
                    "name": "funnels"
                }
            },
            {
                "label": "Create a Form",
                "completed": false,
                "route": {
                    "name": "forms"
                }
            }
        ]
    },
    "quick_links": [
        {
            "title": "View Contacts",
            "url": "https://yourdomain.com/wp-admin/admin.php?page=fluentcrm-admin#/subscribers",
            "icon": "el-icon-user"
        },
        {
            "title": "Contact Segments",
            "url": "https://yourdomain.com/wp-admin/admin.php?page=fluentcrm-admin#/contact-groups/lists",
            "icon": "el-icon-folder"
        },
        {
            "title": "Email Campaigns",
            "url": "https://yourdomain.com/wp-admin/admin.php?page=fluentcrm-admin#/email/campaigns",
            "icon": "el-icon-message"
        },
        {
            "title": "Email Sequences",
            "url": "https://yourdomain.com/wp-admin/admin.php?page=fluentcrm-admin#/email/sequences",
            "icon": "el-icon-alarm-clock"
        },
        {
            "title": "Forms",
            "url": "https://yourdomain.com/wp-admin/admin.php?page=fluentcrm-admin#/forms",
            "icon": "el-icon-document-checked"
        },
        {
            "title": "Automations",
            "url": "https://yourdomain.com/wp-admin/admin.php?page=fluentcrm-admin#/funnels",
            "icon": "el-icon-cold-drink"
        },
        {
            "title": "Settings",
            "url": "https://yourdomain.com/wp-admin/admin.php?page=fluentcrm-admin#/settings",
            "icon": "el-icon-setting"
        },
        {
            "title": "Documentations",
            "url": "https://yourdomain.com/wp-admin/admin.php?page=fluentcrm-admin#/documentation",
            "icon": "el-icon-document"
        }
    ],
    "ff_config": {
        "is_installed": true,
        "create_form_link": "https://yourdomain.com/wp-admin/admin.php?page=fluent_forms#add=1"
    }
}
```

This endpoint returns numbers of total contact, total campaings, total email sent, total tags & total emails templates.

### HTTP Request
`GET https://yourdomain.com/wp-json/fluent-crm/v2/reports/dashboard-stats`

## Get Subscribers Growth Rate

```shell
curl --location --request GET 'https://yourdomain.com/wp-json/fluent-crm/v2/reports/subscribers?date_range[]=2020-02-01&date_range[]=2022-02-10' \
--header 'Authorization: Basic API_USERNAME:API_PASSWORD'
```
> The above command returns JSON structured like this:

```json
{
    "stats": {
        "Feb 2020": 90,
        "Mar 2020": 60,
        "Apr 2020": 34,
        "May 2020": 76,
        "Jun 2020": 98,
        "Jul 2020": 96,
        "Aug 2020": 76,
        "Sep 2020": 87,
        "Oct 2020": 78,
        "Nov 2020": 87,
        "Dec 2020": 65,
        "Jan 2021": 88,
        "Feb 2021": 45,
        "Mar 2021": 56,
        "Apr 2021": 87,
        "May 2021": 105,
        "Jun 2021": 65,
        "Jul 2021": 109,
        "Aug 2021": 67,
        "Sep 2021": 54,
        "Oct 2021": 34,
        "Nov 2021": 79,
        "Dec 2021": 87,
        "Jan 2022": 56,
        "Feb 2022": 88
    }
}
```

This endpoint returns subscribers growth rate.

### HTTP Request

`GET https://yourdomain.com/wp-json/fluent-crm/v2/reports/reports/subscribers`

### URL Parameters

Parameter | Type | Description
--------- | ------|-----------
date_range[] | Date | Accept from date & to date. And date format should be " YYYY-MM-DD ".

***How To Input The Date Range In URL?***

date_range[]=2020-02-01 ``1st date will work for from date.`` <br>
date_range[]=2022-02-10 ``2nd date will work for to date.`` <br>
date_range[]=2020-02-01&date_range[]=2022-02-10 ``Use like this one in the URL``

## Get Email Sending Stats

```shell
curl --location --request GET 'https://yourdomain.com/wp-json/fluent-crm/v2/reports/email-sents?date_range[]=2020-02-01&date_range[]=2022-02-10' \
--header 'Authorization: Basic API_USERNAME:API_PASSWORD'
```
> The above command returns JSON structured like this:

```json
{
    "stats": {
        "2020-03-03": 37,
        "2020-03-04": 54,
        "2020-03-05": 31,
        "2020-03-06": 35,
        "2020-03-07": 21,
        "2020-03-08": 31,
        "2020-03-09": 35,
        "2020-03-10": 43,
        "2020-03-11": 34,
        "2020-03-12": 50,
        "2020-03-13": 30,
        "2020-03-14": 32,
        "2020-03-15": 42,
        "2020-03-16": 32,
        "2020-03-17": 43,
        "2020-03-18": 44,
        "2020-03-19": 49,
        "2020-03-20": 53,
        "2020-03-21": 57,
        "2020-03-22": 49,
        "2020-03-23": 50,
        "2020-03-24": 50,
        "2020-03-25": 43,
        "2020-03-26": 32,
        "2020-03-27": 45,
        "2020-03-28": 53,
        "2020-03-29": 32,
        "2020-03-30": 43,
        "2020-03-31": 44,
        "2020-04-01": 54,
        "2020-04-02": 56,
        "2020-04-03": 32,
        "2020-04-04": 65,
        "2020-04-05": 43,
        "2020-04-06": 54,
        "2020-04-07": 34,
        "2020-04-08": 56,
        "2020-04-09": 54,
        "2020-04-10": 54,
        "2020-04-11": 66,
        "2020-04-12": 54,
        "2020-04-13": 43,
        "2020-04-14": 67,
        "2020-04-15": 54,
        "2020-04-16": 65,
        "2020-04-17": 65,
        "2020-04-18": 54,
        "2020-04-19": 34,
        "2020-04-20": 65,
        "2020-04-21": 68,
        "2020-04-22": 63,
        "2020-04-23": 53,
        "2020-04-24": 38,
        "2020-04-25": 53,
        "2020-04-26": 48,
        "2020-04-27": 64,
        "2020-04-28": 43,
        "2020-04-29": 64
    }
}
```

This endpoint returns email sending rate.

### HTTP Request

`GET https://yourdomain.com/wp-json/fluent-crm/v2/reports/reports/email-sents`

### URL Parameters

Parameter | Type | Description
--------- | ------|-----------
date_range[] | Date | Accept from date & to date. And date format should be " YYYY-MM-DD ".

***How To Input The Date Range In URL?***

date_range[]=2020-02-01 ``1st date will work for from date.`` <br>
date_range[]=2022-02-10 ``2nd date will work for to date.`` <br>
date_range[]=2020-02-01&date_range[]=2022-02-10 ``Use like this one in the URL``

## Get Email Open Stats

```shell
curl --location --request GET 'https://yourdomain.com/wp-json/fluent-crm/v2/reports/email-opens?date_range[]=2020-02-01&date_range[]=2022-02-10' \
--header 'Authorization: Basic API_USERNAME:API_PASSWORD'
```
> The above command returns JSON structured like this:

```json
{
    "stats": {
        "2020-03-03": 37,
        "2020-03-04": 54,
        "2020-03-05": 31,
        "2020-03-06": 35,
        "2020-03-07": 21,
        "2020-03-08": 31,
        "2020-03-09": 35,
        "2020-03-10": 43,
        "2020-03-11": 34,
        "2020-03-12": 50,
        "2020-03-13": 30,
        "2020-03-14": 32,
        "2020-03-15": 42,
        "2020-03-16": 32,
        "2020-03-17": 43,
        "2020-03-18": 44,
        "2020-03-19": 49,
        "2020-03-20": 53,
        "2020-03-21": 57,
        "2020-03-22": 49,
        "2020-03-23": 50,
        "2020-03-24": 50,
        "2020-03-25": 43,
        "2020-03-26": 32,
        "2020-03-27": 45,
        "2020-03-28": 53,
        "2020-03-29": 32,
        "2020-03-30": 43,
        "2020-03-31": 44,
        "2020-04-01": 54,
        "2020-04-02": 56,
        "2020-04-03": 32,
        "2020-04-04": 65,
        "2020-04-05": 43,
        "2020-04-06": 54,
        "2020-04-07": 34,
        "2020-04-08": 56,
        "2020-04-09": 54,
        "2020-04-10": 54,
        "2020-04-11": 66,
        "2020-04-12": 54,
        "2020-04-13": 43,
        "2020-04-14": 67,
        "2020-04-15": 54,
        "2020-04-16": 65,
        "2020-04-17": 65,
        "2020-04-18": 54,
        "2020-04-19": 34,
        "2020-04-20": 65,
        "2020-04-21": 68,
        "2020-04-22": 63,
        "2020-04-23": 53,
        "2020-04-24": 38,
        "2020-04-25": 53,
        "2020-04-26": 48,
        "2020-04-27": 64,
        "2020-04-28": 43,
        "2020-04-29": 64
    }
}
```

This endpoint returns email sending rate.

### HTTP Request

`GET https://yourdomain.com/wp-json/fluent-crm/v2/reports/reports/email-opens`

### URL Parameters

Parameter | Type | Description
--------- | ------|-----------
date_range[] | Date | Accept from date & to date. And date format should be " YYYY-MM-DD ".

***How To Input The Date Range In URL?***

date_range[]=2020-02-01 ``1st date will work for from date.`` <br>
date_range[]=2022-02-10 ``2nd date will work for to date.`` <br>
date_range[]=2020-02-01&date_range[]=2022-02-10 ``Use like this one in the URL``

## Get Email Link Click Stats

```shell
curl --location --request GET 'https://yourdomain.com/wp-json/fluent-crm/v2/reports/email-clicks?date_range[]=2020-02-01&date_range[]=2022-02-10' \
--header 'Authorization: Basic API_USERNAME:API_PASSWORD'
```
> The above command returns JSON structured like this:

```json
{
    "stats": {
        "2020-03-03": 37,
        "2020-03-04": 54,
        "2020-03-05": 31,
        "2020-03-06": 35,
        "2020-03-07": 21,
        "2020-03-08": 31,
        "2020-03-09": 35,
        "2020-03-10": 43,
        "2020-03-11": 34,
        "2020-03-12": 50,
        "2020-03-13": 30,
        "2020-03-14": 32,
        "2020-03-15": 42,
        "2020-03-16": 32,
        "2020-03-17": 43,
        "2020-03-18": 44,
        "2020-03-19": 49,
        "2020-03-20": 53,
        "2020-03-21": 57,
        "2020-03-22": 49,
        "2020-03-23": 50,
        "2020-03-24": 50,
        "2020-03-25": 43,
        "2020-03-26": 32,
        "2020-03-27": 45,
        "2020-03-28": 53,
        "2020-03-29": 32,
        "2020-03-30": 43,
        "2020-03-31": 44,
        "2020-04-01": 54,
        "2020-04-02": 56,
        "2020-04-03": 32,
        "2020-04-04": 65,
        "2020-04-05": 43,
        "2020-04-06": 54,
        "2020-04-07": 34,
        "2020-04-08": 56,
        "2020-04-09": 54,
        "2020-04-10": 54,
        "2020-04-11": 66,
        "2020-04-12": 54,
        "2020-04-13": 43,
        "2020-04-14": 67,
        "2020-04-15": 54,
        "2020-04-16": 65,
        "2020-04-17": 65,
        "2020-04-18": 54,
        "2020-04-19": 34,
        "2020-04-20": 65,
        "2020-04-21": 68,
        "2020-04-22": 63,
        "2020-04-23": 53,
        "2020-04-24": 38,
        "2020-04-25": 53,
        "2020-04-26": 48,
        "2020-04-27": 64,
        "2020-04-28": 43,
        "2020-04-29": 64
    }
}
```

This endpoint returns email sending rate.

### HTTP Request

`GET https://yourdomain.com/wp-json/fluent-crm/v2/reports/reports/email-clicks`

### URL Parameters

Parameter | Type | Description
--------- | ------|-----------
date_range[] | Date | Accept from date & to date. And date format should be " YYYY-MM-DD ".

***How To Input The Date Range In URL?***

date_range[]=2020-02-01 ``1st date will work for from date.`` <br>
date_range[]=2022-02-10 ``2nd date will work for to date.`` <br>
date_range[]=2020-02-01&date_range[]=2022-02-10 ``Use like this one in the URL``