To get real time updates of any lead creation or lead update, support for registering a callback URL is available. 

This URL should be publically accessible and should accept 'POST' request (https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/POST).

The post params posted at any update in a particular leads are as follows 

```json
 {
  "channel_name":"agent_app",
  "country_code":"+91",
  "email":null,
  "is_duplicate":null,
  "lead_id":1402361,
  "lead_status":"Final negotiation",
  "name":"History ",
  "phone":"+919999999988",
  "placement":null,
  "project_name":"santacruz",
  "cp_data":{
    "id":5649,
    "name":"Bb",
    "email":null,
    "phone_with_country_code":"+919988555566",
    "phone_country_id":49,
    "firm_name":"B",
    "rera_id":"V",
    "locality_hash":{

    },
    "city_hash":{

    },
    "location_info":[

    ],
    "phone":"+919988555566",
    "country_id":49
  },
  "rating":null,
  "min_budget":null,
  "max_budget":null,
  "lead_status_reasons":null,
  "extra_details":{
    "cp_id":5649,
    "referral_data":{

    }
  },
  "booking_details":{
    "area":"5",
    "unit_no":"5",
    "base_price":"5",
    "floor_number":"5",
    "parking_price":"6",
    "apartment_type":"1 RK",
    "floor_rise_price":"8",
    "apartment_type_id":1
  },
  "booking_docs":[
    {
      "id":1127,
      "lead_id":1402447,
      "booking_doc_type":"link",
      "data":"https://eventaudio.s3.amazonaws.com/MTQwMjQ0N19jYW5jZWxsZWRfY2hlcXVlXzE1NTg0MzkxMTUxNzVsb2x6.png",
      "tag":"cancelled_cheque",
      "status_id":1,
      "created_at":"2019-05-21T17:15:27.628+05:30",
      "updated_at":"2019-05-21T17:15:27.628+05:30"
    },
    {
      "id":1126,
      "lead_id":1402447,
      "booking_doc_type":"link",
      "data":"https://eventaudio.s3.amazonaws.com/MTQwMjQ0N19ib29raW5nX2Zvcm1fMTU1ODQzOTEwNzU0MWxvbHo%3D.jpeg",
      "tag":"booking_form",
      "status_id":1,
      "created_at":"2019-05-21T17:15:27.621+05:30",
      "updated_at":"2019-05-21T17:15:27.621+05:30"
    }
  ],
  "project_id":1046,
  "created_at":1558080407,
  "claimed_at":1554524295,
  "agent_email":"tanvi.tyagi@anarock.com",
  "latest_event_details":{
    "event_id":1225388,
    "start_time":1558091400,
    "end_time":1558092300,
    "event_type":"f2f"
  },
  "event_details":[
    {
      "event_id":1225388,
      "start_time":1558091400,
      "end_time":1558092300,
      "event_type":"f2f",
      "event_status":"cancelled",
      "event_created_at":1558080630,
      "event_updated_at":1558080804,
      "notes":[
        {
          "note_id":757661,
          "note_type":"text",
          "data":"97004 meeting at today evening at 5:30 p.m. we would like also like to bring his wife along is also interested 2BHK",
          "agent_id":2150,
          "created_at":1558080630,
          "updated_at":1558080630,
          "agent_details":{
            "id":2150,
            "name":"Tanvi Tyagi",
            "phone":"+917045184793",
            "phone_country_id":49
          }
        }
      ]
    },
    {
      "event_id":1225394,
      "start_time":1558089984,
      "end_time":1558091784,
      "event_type":"sv",
      "event_status":"cancelled",
      "event_created_at":1558081027,
      "event_updated_at":1558355391,
      "notes":[
        {
          "note_id":757667,
          "note_type":"text",
          "data":"This is a this is a site visit ",
          "agent_id":2150,
          "created_at":1558081077,
          "updated_at":1558081094,
          "agent_details":{
            "id":2150,
            "name":"Tanvi Tyagi",
            "phone":"+917045184793",
            "phone_country_id":49
          }
        }
      ]
    }
  ],
  "notes":[
    {
      "note_type":"text",
      "data":"revisit done",
      "created_at":1558089973.0,
      "updated_at":1558089973.0,
      "agent_id":562,
      "note_id":757670,
      "agent_details":{
        "id":562,
        "name":"Ritesh Kumar",
        "phone":"+917417485713",
        "phone_country_id":49
      }
    },
    {
      "note_type":"text",
      "data":"site revisit done",
      "created_at":1558082236.0,
      "updated_at":1558082236.0,
      "agent_id":2150,
      "note_id":757668,
      "agent_details":{
        "id":2150,
        "name":"Tanvi Tyagi",
        "phone":"+917045184793",
        "phone_country_id":49
      }
    },
    {
      "note_type":"text",
      "data":"Site visit is done now it is also for site visit plan for site visit in couple of hours and also ready for site visit with family on Saturday so that we can you start with letter",
      "created_at":1558080979.0,
      "updated_at":1558080979.0,
      "agent_id":2150,
      "note_id":757666,
      "agent_details":{
        "id":2150,
        "name":"Tanvi Tyagi",
        "phone":"+917045184793",
        "phone_country_id":49
      }
    },
    {
      "note_type":"text",
      "data":"Visited an another visitor schedule 2 hours",
      "created_at":1558080712.0,
      "updated_at":1558080712.0,
      "agent_id":2150,
      "note_id":757663,
      "agent_details":{
        "id":2150,
        "name":"Tanvi Tyagi",
        "phone":"+917045184793",
        "phone_country_id":49
      }
    },
    {
      "note_type":"text",
      "data":"Meeting is another meeting schedule in 2 hours",
      "created_at":1558080683.0,
      "updated_at":1558080683.0,
      "agent_id":2150,
      "note_id":757662,
      "agent_details":{
        "id":2150,
        "name":"Tanvi Tyagi",
        "phone":"+917045184793",
        "phone_country_id":49
      }
    }
  ],
  "calls":[
    {
      "action":"incoming",
      "agent_details":{
        "id":2150,
        "name":"Tanvi Tyagi",
        "phone":"+917045184793",
        "phone_country_id":49
      },
      "call_number":"+919999999988",
      "duration_in_sec":0,
      "end_time":1558080720,
      "first_leg_status":"completed",
      "from":"+917045184793",
      "id":2380,
      "inserted_at":1558080727,
      "recording_url":null,
      "second_leg_status":"failed",
      "start_time":1558080720,
      "to":"+919999999988",
      "updated_at":1558080727
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
     "possession_in": [1, 2, 3, 4, 5, 6],
     "referral_data": {"name": "Vb", "phone": "99999999999"},
     "office_city_id": 326,
     "mode_of_payment": "Loan",
     "annual_income_max": 30000000,
     "annual_income_min": 20000000,
     "purpose_of_purchase": "Self Use",
     "current_apartment_type": 1,
     "current_residence_type": "Family Owned"
  }
}
```

``` rating``` can have values as `Hot`, `Cold`, `Warm`

```latest_event_details``` will contain the latest event which has been changed by the agent, it can have following 3 values 
- ```followup``` (for followups),
- ```sv``` (for site visit),
- ```f2f``` (for Face to Face )


```lead_status``` can have the following values 
- `New` (Any lead that is just created or cannot be resolved because it's duplicate. This is the first status for a lead in the system)
- `Fresh` - Any lead that is available in the pool for all the agents to Claim \n
- `Claimed` - When a particular lead is claimed by an agent \n
- `Interest` - When marked as interested by an agent \n
- `Meeting Done` - When a F2F event has been completed  or the agent moved to meeting done \n
- `Visit Done` - When a Site Visit event has been completed or the agent moves to meeting done or lead is captured via `Site Digitalization` (to get this impletemented contact Anarock PoC) \n
- `Final Negotitaion` - When a visit is marked as Final Negotiation by Agent \n
- `Booking Done` - When moved into Booking Done \n
- `Fail` - When marked as Failed
- `Junk` - When marked as Junk 
      
  
  Other parameters are the once described in the http://anarock.github.io/leads documentation.
  

