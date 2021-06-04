To get real time updates of any lead creation or lead update, support for registering a callback URL is available. 

This URL should be publically accessible and should accept 'POST' request (https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/POST).

The post params posted at any update in a particular leads are as follows 

```json
{
  "channel_name": "agent_app",
  "country_code": "+91",
  "email": null,
  "lead_id": 1402361,
  "lead_status": "Final negotiation",
  "last_status": "Visit done",
  "name": "History ",
  "phone": "+919999999988",
  "source": "facebook",
  "sub_source": "leadgen",
  "action": "lead_update",
  "placement": null,
  "project_name": "santacruz",
  "created_at": 1558080407,
  "cp_data": {
    "id": 5649,
    "name": "Bb",
    "email": null,
    "phone_with_country_code": "+919988555566",
    "phone_country_id": 49,
    "firm_name": "B",
    "rera_id": "V",
    "locality_hash": {},
    "city_hash": {},
    "location_info": [],
    "phone": "+919988555566",
    "country_id": 49
  },
  "rating": null,
  "min_budget": null,
  "max_budget": null,
  "lead_status_reasons": null,
  "booking_details": {
    "area": "5",
    "unit_no": "5",
    "base_price": "5",
    "floor_number": "5",
    "parking_price": "6",
    "apartment_type": "1 RK",
    "floor_rise_price": "8",
    "apartment_type_id": 1
  },
  "booking_docs": [
    {
      "id": 1127,
      "lead_id": 1402447,
      "booking_doc_type": "link",
      "data": "https://eventaudio.s3.amazonaws.com/MTQwMjQ0N19jYW5jZWxsZWRfY2hlcXVlXzE1NTg0MzkxMTUxNzVsb2x6.png",
      "tag": "cancelled_cheque",
      "status_id": 1,
      "created_at": "2019-05-21T17:15:27.628+05:30",
      "updated_at": "2019-05-21T17:15:27.628+05:30"
    },
    {
      "id": 1126,
      "lead_id": 1402447,
      "booking_doc_type": "link",
      "data": "https://eventaudio.s3.amazonaws.com/MTQwMjQ0N19ib29raW5nX2Zvcm1fMTU1ODQzOTEwNzU0MWxvbHo%3D.jpeg",
      "tag": "booking_form",
      "status_id": 1,
      "created_at": "2019-05-21T17:15:27.621+05:30",
      "updated_at": "2019-05-21T17:15:27.621+05:30"
    }
  ],
  "project_id": 1046,
  "claimed_at": 1554524295,
  "agent_email": "tanvi.tyagi@anarock.com",
  "agent_name": "Tanvi Tyagi",
  "project_usp": "some usp",
  "project_description": "some usp",
  "developer": "some developer",
  "city": "Mumbai",
  "latest_event_details": {
    "event_id": 1225388,
    "start_time": 1558091400,
    "end_time": 1558092300,
    "event_type": "f2f"
  },
  "event_details": [
    {
      "event_id": 1225388,
      "start_time": 1558091400,
      "end_time": 1558092300,
      "event_type": "f2f",
      "event_status": "cancelled",
      "event_created_at": 1558080630,
      "event_updated_at": 1558080804,
      "notes": [
        {
          "note_id": 757661,
          "note_type": "text",
          "data": "97004 meeting at today evening at 5:30 p.m. we would like also like to bring his wife along is also interested 2BHK",
          "agent_id": 2150,
          "created_at": 1558080630,
          "updated_at": 1558080630,
          "agent_details": {
            "id": 2150,
            "name": "Tanvi Tyagi",
            "phone": "+917045184793",
            "phone_country_id": 49
          }
        }
      ]
    },
    {
      "event_id": 1225394,
      "start_time": 1558089984,
      "end_time": 1558091784,
      "event_type": "sv",
      "event_status": "cancelled",
      "event_created_at": 1558081027,
      "event_updated_at": 1558355391,
      "notes": [
        {
          "note_id": 757667,
          "note_type": "text",
          "data": "This is a this is a site visit ",
          "agent_id": 2150,
          "created_at": 1558081077,
          "updated_at": 1558081094,
          "agent_details": {
            "id": 2150,
            "name": "Tanvi Tyagi",
            "phone": "+917045184793",
            "phone_country_id": 49
          }
        }
      ]
    }
  ],
  "notes": [
    {
      "note_type": "text",
      "data": "revisit done",
      "created_at": 1558089973,
      "updated_at": 1558089973,
      "agent_id": 562,
      "note_id": 757670,
      "agent_details": {
        "id": 562,
        "name": "Ritesh Kumar",
        "phone": "+917417485713",
        "phone_country_id": 49
      }
    },
    {
      "note_type": "text",
      "data": "site revisit done",
      "created_at": 1558082236,
      "updated_at": 1558082236,
      "agent_id": 2150,
      "note_id": 757668,
      "agent_details": {
        "id": 2150,
        "name": "Tanvi Tyagi",
        "phone": "+917045184793",
        "phone_country_id": 49
      }
    },
    {
      "note_type": "text",
      "data": "Site visit is done now it is also for site visit plan for site visit in couple of hours and also ready for site visit with family on Saturday so that we can you start with letter",
      "created_at": 1558080979,
      "updated_at": 1558080979,
      "agent_id": 2150,
      "note_id": 757666,
      "agent_details": {
        "id": 2150,
        "name": "Tanvi Tyagi",
        "phone": "+917045184793",
        "phone_country_id": 49
      }
    },
    {
      "note_type": "text",
      "data": "Visited an another visitor schedule 2 hours",
      "created_at": 1558080712,
      "updated_at": 1558080712,
      "agent_id": 2150,
      "note_id": 757663,
      "agent_details": {
        "id": 2150,
        "name": "Tanvi Tyagi",
        "phone": "+917045184793",
        "phone_country_id": 49
      }
    },
    {
      "note_type": "text",
      "data": "Meeting is another meeting schedule in 2 hours",
      "created_at": 1558080683,
      "updated_at": 1558080683,
      "agent_id": 2150,
      "note_id": 757662,
      "agent_details": {
        "id": 2150,
        "name": "Tanvi Tyagi",
        "phone": "+917045184793",
        "phone_country_id": 49
      }
    }
  ],
  "calls": [
    {
      "action": "incoming",
      "agent_details": {
        "id": 2150,
        "name": "Tanvi Tyagi",
        "phone": "+917045184793",
        "phone_country_id": 49
      },
      "call_number": "+919999999988",
      "duration_in_sec": 0,
      "end_time": 1558080720,
      "first_leg_status": "completed",
      "from": "+917045184793",
      "id": 2380,
      "inserted_at": 1558080727,
      "recording_url": null,
      "second_leg_status": "failed",
      "start_time": 1558080720,
      "to": "+919999999988",
      "updated_at": 1558080727
    }
  ],
  "extra_details": {
    "duplicate_lead_id": 906498,
    "gender": "male",
    "is_nri": true,
    "address": "vb",
    "max_age": 45,
    "min_age": 40,
    "industry": "Government and Public Administration",
    "ethnicity": "Bengali",
    "occupation": "Professional",
    "designation": "G",
    "company_name": "J",
    "possession_in": [
      1,
      2,
      3,
      4,
      5,
      6
    ],
    "referral_data": {
      "name": "Vb",
      "phone": "99999999999"
    },
    "office_city_id": 326,
    "mode_of_payment": "Loan",
    "annual_income_max": 30000000,
    "annual_income_min": 20000000,
    "purpose_of_purchase": "Self Use",
    "current_apartment_type": 1,
    "current_residence_type": "Family Owned"
  },
  "dispositions": [
    {
      "id": 121,
      "agent_name": "name",
      "disposition_type": "followup",
      "created_at": 1558080727
    }
  ],
  "status_changes": {
    "moved_to_new": 1558080727,
    "moved_to_claimed": 1558080727,
    "moved_to_interested": 1558080727,
    "moved_to_meeting_done": 1558080727,
    "moved_to_visit_done": 1558080727,
    "moved_to_final_negotiation": 1558080727,
    "moved_to_booking_done": 1558080727,
    "moved_to_failed": 1558080727,
    "moved_to_junk": 1558080727,
    "moved_to_in_transfer": 1558080727,
    "moved_to_in_call_center": 1558080727,
    "moved_to_linked": 1558080727,
    "moved_to_fresh": 1558080727,
    "status_before_cc": "Interested"
  }
}
```

``` rating``` can have values as `Hot`, `Cold`, `Warm`

```latest_event_details``` will contain the latest event which has been changed by the agent, it can have following 3 values 
- ```followup``` (for followups),
- ```sv``` (for site visit),
- ```f2f``` (for Face to Face )

```action``` can have the following values
- ```call_logged``` when a new call is done on a particular lead
- ```lead_updated``` when a property on lead is updated
- ```status_update``` when status of the lead is updated
- ```agent_update``` when current agent on the lead is updated
- ```status_and_agent_update``` when agent and status both are updated
- ```disposition_created``` when call center has done an activity on a lead
- ```event_update``` when an event is updated on a lead
- ```inquiry_created``` new inquiry created on a lead
- ```note_creation``` a new note is added on a lead


```lead_status``` can have the following values 
- `New` (Any lead that is just created or cannot be resolved because it's duplicate. This is the first status for a lead in the system)
- `Fresh` - Any lead that is available in the pool for all the agents to Claim \n
- `Claimed` - When a particular lead is claimed by an agent \n
- `Interested` - When marked as interested by an agent \n
- `Meeting done` - When a F2F event has been completed  or the agent moved to meeting done \n
- `Visit done` - When a Site Visit event has been completed or the agent moves to meeting done or lead is captured via `Site Digitalization` (to get this impletemented contact Anarock PoC) \n
- `Final negotitaion` - When a visit is marked as Final Negotiation by Agent \n
- `Booking done` - When moved into Booking Done \n
- `Failed` - When marked as Failed
- `Junk` - When marked as Junk 
- `In Call Center` - When lead is sent to call center

```disposition_type``` can have the the following values ```"failed", "follow_up", "fresh", "junk", "patch_out", "not_contacted", "call_back"```




Note: All object arrays in the payload are sorted with latest first, eg. calls, events, notes dispositions are sorted as latest first.


### Few Examples of the hooks about consuming hooks on various actiosn

#### Lead is in call center bucket call duration is more than 60 sec and not moved to Junk & Failed 
```
action === `disposition_created`

lead_status === `In Call Center`

dispositions[0].disposition_type === `followup`

calls[0].duration_in_sec > 60
```
#### Lead was in call center bucket and transfer to sales team( Through patch out or send to fresh)
```
action === `disposition_created`

dispositions[0].disposition_type === `fresh` || dispositions[0].disposition_type === `patch_out`
```

#### Lead is in call center bucket call duration is more than 60 sec and move to failed.
```
action === `status_update` || action === `status_and_agent_update`

lead_status === `Failed` || lead_status === `Junk`

last_status === `In Call Center`

dispositions[0].disposition_type === `failed` || dispositions[0].disposition_type === `junk`
```

#### Lead is in Sales team bucket and Site visit event as completed/done  by the sales team with sales manager
```
action === `event_update`

[`Visit done`].indexOf(lead_status) !== -1

latest_event_details.event_type === `sv`
```

#### Lead is in Sales team bucket and lead status change to booking done with sales manager
```
action === `status_update`

lead_status === `Booking done`
```

### Lead is in Sales team bucket and lead status change to failed with sales manager
```
action === `status_update`

lead_status === `Failed` || lead_status === `Junk`

last_status !== `In Call Center`
```



  

