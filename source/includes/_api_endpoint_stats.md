## Stats
This endpoint is useful for downloading a full statistical table.

```php
<?php
use Mautic\MauticApi;
use Mautic\Auth\ApiAuth;

// ...
$initAuth = new ApiAuth();
$auth     = $initAuth->newAuth($settings);
$apiUrl   = "https://your-mautic.com";
$api      = new MauticApi();
$statsApi = $api->newApi("stats", $auth, $apiUrl);
```

### Get Available Stat Tables
```php
<?php

//...
$tables = $statsApi->get();
```
```json
{
  "availableTables": [
    "asset_downloads",
    "audit_log",
    "campaign_lead_event_log",
    "campaign_leads",
    "channel_url_trackables",
    "companies_leads",
    "dynamic_content_lead_data",
    "dynamic_content_stats",
    "email_stat_replies",
    "email_stats",
    "email_stats_devices",
    "focus_stats",
    "form_submissions",
    "ip_addresses",
    "lead_categories",
    "lead_companies_change_log",
    "lead_devices",
    "lead_donotcontact",
    "lead_event_log",
    "lead_frequencyrules",
    "lead_lists_leads",
    "lead_points_change_log",
    "lead_stages_change_log",
    "lead_utmtags",
    "page_hits",
    "page_redirects",
    "plugin_citrix_events",
    "point_lead_action_log",
    "point_lead_event_log",
    "push_notification_stats",
    "sms_message_stats",
    "stage_lead_action_log",
    "tweet_stats",
    "video_hits",
    "webhook_logs"
  ],
  "tableColumns": {
    "asset_downloads": [
      "asset_id",
      "code",
      "date_download",
      "email_id",
      "id",
      "ip_id",
      "lead_id",
      "referer",
      "source",
      "source_id",
      "tracking_id"
    ],
    "audit_log": [
      "action",
      "bundle",
      "date_added",
      "details",
      "id",
      "ip_address",
      "object",
      "object_id",
      "user_id",
      "user_name"
    ],
    "campaign_lead_event_log": [
      "campaign_id",
      "channel",
      "channel_id",
      "date_triggered",
      "event_id",
      "id",
      "ip_id",
      "is_scheduled",
      "lead_id",
      "metadata",
      "non_action_path_taken",
      "rotation",
      "system_triggered",
      "trigger_date"
    ],
    "campaign_leads": [
      "campaign_id",
      "date_added",
      "date_last_exited",
      "lead_id",
      "manually_added",
      "manually_removed",
      "rotation"
    ],
    "channel_url_trackables": [
      "channel",
      "channel_id",
      "hits",
      "redirect_id",
      "unique_hits"
    ],
    "companies_leads": [
      "company_id",
      "date_added",
      "is_primary",
      "lead_id",
      "manually_added",
      "manually_removed"
    ],
    "dynamic_content_lead_data": [
      "date_added",
      "dynamic_content_id",
      "id",
      "lead_id",
      "slot"
    ],
    "dynamic_content_stats": [
      "date_sent",
      "dynamic_content_id",
      "id",
      "last_sent",
      "lead_id",
      "sent_count",
      "sent_details",
      "source",
      "source_id",
      "tokens"
    ],
    "email_stat_replies": [
      "date_replied",
      "id",
      "message_id",
      "stat_id"
    ],
    "email_stats": [
      "copy_id",
      "date_read",
      "date_sent",
      "email_address",
      "email_id",
      "id",
      "ip_id",
      "is_failed",
      "is_read",
      "last_opened",
      "lead_id",
      "list_id",
      "open_count",
      "open_details",
      "retry_count",
      "source",
      "source_id",
      "tokens",
      "tracking_hash",
      "viewed_in_browser"
    ],
    "email_stats_devices": [
      "date_opened",
      "device_id",
      "id",
      "ip_id",
      "stat_id"
    ],
    "focus_stats": [
      "date_added",
      "focus_id",
      "id",
      "lead_id",
      "type",
      "type_id"
    ],
    "form_submissions": [
      "date_submitted",
      "form_id",
      "id",
      "ip_id",
      "lead_id",
      "page_id",
      "referer",
      "tracking_id"
    ],
    "ip_addresses": [
      "id",
      "ip_address",
      "ip_details"
    ],
    "lead_categories": [
      "category_id",
      "date_added",
      "id",
      "lead_id",
      "manually_added",
      "manually_removed"
    ],
    "lead_companies_change_log": [
      "action_name",
      "company_id",
      "date_added",
      "event_name",
      "id",
      "lead_id",
      "type"
    ],
    "lead_devices": [
      "client_info",
      "date_added",
      "device",
      "device_brand",
      "device_fingerprint",
      "device_model",
      "device_os_name",
      "device_os_platform",
      "device_os_shortname",
      "device_os_version",
      "id",
      "lead_id",
      "tracking_id"
    ],
    "lead_donotcontact": [
      "channel",
      "channel_id",
      "comments",
      "date_added",
      "id",
      "lead_id",
      "reason"
    ],
    "lead_event_log": [
      "action",
      "bundle",
      "date_added",
      "id",
      "lead_id",
      "object",
      "object_id",
      "properties",
      "user_id",
      "user_name"
    ],
    "lead_frequencyrules": [
      "channel",
      "date_added",
      "frequency_number",
      "frequency_time",
      "id",
      "lead_id",
      "pause_from_date",
      "pause_to_date",
      "preferred_channel"
    ],
    "lead_lists_leads": [
      "date_added",
      "leadlist_id",
      "lead_id",
      "manually_added",
      "manually_removed"
    ],
    "lead_points_change_log": [
      "action_name",
      "date_added",
      "delta",
      "event_name",
      "id",
      "ip_id",
      "lead_id",
      "type"
    ],
    "lead_stages_change_log": [
      "action_name",
      "date_added",
      "event_name",
      "id",
      "lead_id",
      "stage_id"
    ],
    "lead_utmtags": [
      "date_added",
      "id",
      "lead_id",
      "query",
      "referer",
      "remote_host",
      "url",
      "user_agent",
      "utm_campaign",
      "utm_content",
      "utm_medium",
      "utm_source",
      "utm_term"
    ],
    "page_hits": [
      "browser_languages",
      "city",
      "code",
      "country",
      "date_hit",
      "date_left",
      "device_id",
      "email_id",
      "id",
      "ip_id",
      "isp",
      "lead_id",
      "organization",
      "page_id",
      "page_language",
      "query",
      "redirect_id",
      "referer",
      "region",
      "remote_host",
      "source",
      "source_id",
      "tracking_id",
      "url",
      "url_title",
      "user_agent"
    ],
    "page_redirects": [
      "checked_out",
      "checked_out_by",
      "checked_out_by_user",
      "created_by",
      "created_by_user",
      "date_added",
      "date_modified",
      "hits",
      "id",
      "is_published",
      "modified_by",
      "modified_by_user",
      "redirect_id",
      "unique_hits",
      "url"
    ],
    "plugin_citrix_events": [
      "email",
      "event_date",
      "event_desc",
      "event_name",
      "event_type",
      "id",
      "lead_id",
      "product"
    ],
    "point_lead_action_log": [
      "date_fired",
      "ip_id",
      "lead_id",
      "point_id"
    ],
    "point_lead_event_log": [
      "date_fired",
      "event_id",
      "ip_id",
      "lead_id"
    ],
    "push_notification_stats": [
      "click_count",
      "click_details",
      "date_clicked",
      "date_read",
      "date_sent",
      "id",
      "ip_id",
      "is_clicked",
      "last_clicked",
      "lead_id",
      "list_id",
      "notification_id",
      "retry_count",
      "source",
      "source_id",
      "tokens",
      "tracking_hash"
    ],
    "sms_message_stats": [
      "date_sent",
      "id",
      "ip_id",
      "lead_id",
      "list_id",
      "sms_id",
      "source",
      "source_id",
      "tokens",
      "tracking_hash"
    ],
    "stage_lead_action_log": [
      "date_fired",
      "ip_id",
      "lead_id",
      "stage_id"
    ],
    "tweet_stats": [
      "date_sent",
      "favorite_count",
      "handle",
      "id",
      "is_failed",
      "lead_id",
      "response_details",
      "retry_count",
      "retweet_count",
      "source",
      "source_id",
      "tweet_id",
      "twitter_tweet_id"
    ],
    "video_hits": [
      "browser_languages",
      "channel",
      "channel_id",
      "city",
      "code",
      "country",
      "date_hit",
      "date_left",
      "duration",
      "guid",
      "id",
      "ip_id",
      "isp",
      "lead_id",
      "organization",
      "page_language",
      "query",
      "referer",
      "region",
      "remote_host",
      "time_watched",
      "url",
      "user_agent"
    ],
    "webhook_logs": [
      "date_added",
      "id",
      "note",
      "runtime",
      "status_code",
      "webhook_id"
    ]
  }
}
```

#### HTTP Request

`GET /stats`

#### Response

`Expected Response Code: 200`

See JSON code example.

**Stats Properties**

Name|Type|Description
----|----|-----------
availableTables|array|List of available tables which can be used in this endpoint
stats|array|An empty array of stats, because no table was defined

### Get Stats from a table
```php
<?php
// Example setup variables:
$table = 'asset_downloads';
$start = 0;
$limit = 50;
$order = array(
    array(
      'col' => 'id',
      'dir' => 'asc'
    )
);
$where = array(
    array(
      'col' => 'id',
      'expr' => 'gt',
      'val' => 3,
    )
);

$stats = $statsApi->get($table, $start, $limit, $order, $where);
```

```json
{
  "stats":[
    {
      "id":"1",
      "asset_id":"1",
      "ip_id":"1",
      "lead_id":"31",
      "date_download":"2016-06-30 08:51:22",
      "code":"200",
      "tracking_id":"b3259e7709f35b7428b7bffcbb3d1d713ac1526c"
    },
    [...]
  ]
}
```

#### HTTP Request

`GET /stats/TABLE`

**Request Properties**

Name|Type|Description
----|----|-----------
start|int|Which row to start on
limit|int|How many rows to return
order|array|An array of arrays which contain ordering (example above)
where|array|An array of arrays which contain where conditions (example above). As the `expr` param can be used most of the methods from [DBAL Doctrine where methods](http://www.doctrine-project.org/api/dbal/2.3/class-Doctrine.DBAL.Query.Expression.ExpressionBuilder.html).

If using cURL, a query parameter may look something like `where%5B0%5D%5Bcol%5D=id&where%5B0%5D%5Bexpr%5D=eq&where%5B0%5D%5Bval%5D=3` which is the equivalent to the following:

<pre class="inline">
array(
    array(
        'col'  => 'id',
        'expr' => 'eq',
        'val'  => 3,
    )
);
</pre>

#### Response

`Expected Response Code: 200`

See JSON code example.

**Stats Properties**

Different for every table. It simply returns rows or requested table.
