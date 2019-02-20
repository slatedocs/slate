# Effective Settings

## The Effective Settings Object

> **Example**

```json
{
  "results": {
    "effective_settings": {
      "general": {
        "settings": {
          "calculate_overtime": "1",
          "clockout_override": 1,
          "clockout_override_hours": 10,
          "clockout_override_notify_admin": 1,
          "clockout_override_notify_mgrs": 0,
          "daily_doubletime": "0",
          "daily_overtime": "0",
          "daily_regular_hours": 8,
          "date_locale": "us",
          "emp_panel": 1,
          "emp_panel_email": "0",
          "emp_panel_passwd": "0",
          "emp_panel_tz": "0",
          "employee_pto_entry": 0,
          "enable_timesheet_notes": "1",
          "hide_working_time": "0",
          "jc_label": "Job",
          "lunch_deduct": 0,
          "lunch_length": 1,
          "lunch_threshold": 9,
          "max_customfielditems": "-1",
          "max_jobcodes": "-1",
          "parent_clockin_display": 0,
          "payroll_end_date": "2018-09-28",
          "payroll_first_end_day": "1",
          "payroll_last_end_day": "16",
          "payroll_month_end_day": "1",
          "payroll_type": "biweekly",
          "pto_entry": 1,
          "pto_overtime": 0,
          "simple_clockin": 0,
          "time_format": 12,
          "timecard_fields": "JOBCODE,134913,143369,143377",
          "timeclock_label": "Time Clock",
          "timesheet_edit_notes_for_all_users": 0,
          "timesheet_notes_notify_admin": 0,
          "timesheet_notes_notify_mgrs": 0,
          "timesheet_notes_required": 0,
          "tz": "America/Denver",
          "week_start": 0,
          "weekly_regular_hours": "40"
        },
        "last_modified": "2019-02-11T17:45:18+00:00"
      },
      "alerts": {
        "settings": {
          "installed": 0
        },
        "last_modified": "2001-01-01T12:00:00+00:00"
      },
      "approvals": {
        "settings": {
          "installed": "1"
        },
        "last_modified": "2019-01-25T20:53:52+00:00"
      },
      "breaks": {
        "settings": {
          "hide_pre_clockout_option": 0
        },
        "last_modified": "2019-01-25T20:53:52+00:00"
      },
      "dcaa": {
        "settings": {
          "installed": 0
        },
        "last_modified": "2001-01-01T12:00:00+00:00"
      },
      "dialin": {
        "settings": {
          "installed": 0
        },
        "last_modified": "2001-01-01T12:00:00+00:00"
      },
      "files": {
        "settings": {
          "installed": "1",
          "files_addon_app_discovery_notification": "1"
        },
        "last_modified": "2019-01-25T20:53:52+00:00"
      },
      "invoicing": {
        "settings": {
          "installed": 0
        },
        "last_modified": "2001-01-01T12:00:00+00:00"
      },
      "location_aware": {
        "settings": {
          "installed": 1,
          "show_location": "1"
        },
        "last_modified": "2019-01-25T20:53:52+00:00"
      },
      "mobile_app_integrations": {
        "settings": {
          "installed": 1,
          "apps": {
            "expensify": {
              "triggers": {
                "TSMTriggerButton": {
                  "id": 553,
                  "active": true,
                  "jobcode_ids": [
                    0
                  ],
                  "android_playstore_uri": "org.me.mobiexpensifyg",
                  "android_call_scheme": "http://mobile.expensify.com/SmartScan",
                  "iphone_appstore_url": "https://itunes.apple.com/us/app/expensify-expense-reports/id471713959",
                  "iphone_call_scheme": "http://mobile.expensify.com",
                  "call_url_host": "SmartScan",
                  "call_uri_format": "tag=%JOBCODE_NAME%&billable=%JOBCODE_BILLABLE%&email=%EMAIL%&callbackURL=%TSHEETS_RETURN_URL%",
                  "callback_uri_format": ""
                }
              }
            }
          }
        },
        "last_modified": "2019-01-25T20:53:52+00:00"
      },
      "mobile_app_settings": {
        "settings": {
          "installed": "1",
          "location_tracking": "off",
          "mandatory_location_services": "0"
        },
        "last_modified": "2019-02-09T18:39:20+00:00"
      },
      "reminders": {
        "settings": {
          "installed": 1
        },
        "last_modified": "2019-01-25T20:53:52+00:00"
      },
      "projects": {
        "settings": {
          "installed": 0
        },
        "last_modified": "2001-01-01T12:00:00+00:00"
      },
      "quickbooks": {
        "settings": {
          "installed": 0
        },
        "last_modified": "2019-01-25T20:53:52+00:00"
      },
      "restapi": {
        "settings": {
          "installed": "1"
        },
        "last_modified": "2019-01-25T20:53:52+00:00"
      },
      "rounding": {
        "settings": {
          "installed": 0
        },
        "last_modified": "2001-01-01T12:00:00+00:00"
      },
      "schedule": {
        "settings": {
          "installed": "1",
          "business_hours_end": "17:00:00",
          "business_hours_start": "08:00:00",
          "drafted_first_schedule_event_occurred": "1",
          "manage_schedule_permission": "company",
          "published_first_schedule_event_occurred": "1",
          "trial_expiration_date": "2018-10-17",
          "view_schedule_permission": "company",
          "learning_step": "7",
          "employee_view": "company",
          "manager_view": "company"
        },
        "last_modified": "2019-02-09T18:03:55+00:00"
      },
      "sms": {
        "settings": {
          "installed": 0
        },
        "last_modified": "2001-01-01T12:00:00+00:00"
      },
      "sounds": {
        "settings": {
          "installed": 0
        },
        "last_modified": "2001-01-01T12:00:00+00:00"
      },
      "customfields": {
        "settings": {
          "maximum_allowed_timesheet_custom_fields": 6,
          "installed": "1"
        },
        "last_modified": "2019-02-10T20:34:10+00:00"
      },
      "time_entry": {
        "settings": {
          "installed": 1,
          "time_entry_method": "timecard",
          "mtc_format_time_display": "hhmm",
          "time_entry": 0,
          "timecard": 1,
          "weekly_timecard": 1,
          "timecard_daily": 0,
          "timesheet_edit": 0,
          "timesheet_map": 1,
          "pto_entry": 1,
          "timesheet_list_date_range_selection": "month",
          "timesheet_list_show_days_with_no_time": 0,
          "timesheet_list_wrap_text": 0,
          "timesheet_list_column_selection": "time,job,location,kiosk,attachments,notes",
          "timesheet_list_bottomless_scroll": 1,
          "mtc_combine_regular_timesheets": "0"
        },
        "last_modified": "2019-01-25T20:53:52+00:00"
      },
      "toodledo": {
        "settings": {
          "installed": 0
        },
        "last_modified": "2001-01-01T12:00:00+00:00"
      },
      "twitter": {
        "settings": {
          "installed": 0
        },
        "last_modified": "2001-01-01T12:00:00+00:00"
      },
      "xero": {
        "settings": {
          "installed": 0
        },
        "last_modified": "2001-01-01T12:00:00+00:00"
      },
      "zenpayroll": {
        "settings": {
          "installed": 0
        },
        "last_modified": "2001-01-01T12:00:00+00:00"
      }
    }
  }
}
```

All combined, cascaded settings that apply to a given user are contained in the effective settings object.

The effective settings object consists of a series of sections. Each section contains a `settings` and a `last_modified` property. The `settings` property is a list of key/value pairs. The `last_modified` property is an ISO 8601-formatted timestamp. It gets updated any time a key/value pair within a section has changed.

Below is a list of the possible section headings.

|       |             |
| ----- | ----------- |
| **general** | General application settings |
| **alerts** | Settings for the Alerts Add-On |
| **approvals** | Settings for the Approvals Add-On |
| **breaks** | Settings for the Breaks Add-On |
| **dcaa** | Settings for the DCAA Compliance Add-On |
| **dialin** | Settings for the Dial-in Add-On |
| **files** | Settings for the Files Add-On |
| **invoicing** | Settings for the Invoicing Add-On |
| **location_aware** | Settings for the Location Aware Add-On |
| **mobile_app_integrations** | Settings for the Mobile App Integrations Add-On |
| **mobile_app_settings** | Settings for the Mobile App Settings Add-On |
| **reminders** | Settings for the Reminders Add-On |
| **projects** | Settings for the Projects Add-On |
| **quickbooks** | Settings for the Quickbooks Integration Add-On |
| **restapi** | Settings for the TSheets Rest API Add-On |
| **rounding** | Settings for the Timesheet Rounding Add-On |
| **schedule** | Settings for the Schedule Add-On |
| **sms** | Settings for the Text Messaging Add-On |
| **sounds** | Settings for the Sounds Add-On |
| **customfields** | Settings for the Advanced Tracking Add-On |
| **time_entry** | Settings for the Time Card Selector Add-On |
| **toodledo** | Settings for the Toodledo Add-On |
| **twitter** | Settings for the Twitter Add-On |
| **xero** | Settings for the Xero Integration Add-On |
| **zenpayroll** | Settings for the Zen Payroll Integration Add-On |

 <aside class="notice">
For all sections except <code>general</code>, if not installed, the only setting will be <code>installed</code> with a value of <i>0</i>. If installed, all applicable settings will be available.
</aside>

