To get real time updates of any lead creation or lead update, support for registering a callback URL is available. 

This URL should be publically accessible and should accept 'POST' request (https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/POST).

The post params posted at any update in a particular leads are as follows 

```json
 { 
    "channel_name": "agent_app",
    "country_code": "+91",
    "email": "someemail@abc.com",
    "is_duplicate": true,
    "lead_id": 925089,
    "lead_status": "Interested",
    "name": "Rahul",
    "rating: "Hot", 
    "min_budget": "10000000",
    "max_budget": "20000000",
    "phone": "+919819619866",
    "placement": "placement",
    "project_name": "Internal Test Project",
    "source": "google",
    "sub_source": "google_search",
    "agent_email": "rahul@anarock.com",
    "latest_event_details": { 
        "event_id": 552654,
        "start_time": 1540968234,
        "end_time": 1540968534,
        "event_type": "followup"
     },
     "notes": [
        {
          "note_type": "text",
          "data": "Hi note",
          "created_at": 1540967316,
          "note_id": 357202
          }
     ],
    "calls": [
      {
        "updated_at": 1540968046,
        "to": "+919819619866",
        "start_time": 1540967957, //call_start_time
        "stage": "connected",
        "sid": "asdfa1323fas",
        "second_leg_status": "completed",
        "inserted_at": 1540968046,
        "id": 886672,
        "from": "+919833591953",
        "first_leg_status": "completed",
        "end_time": 1540967957,
        "duration_in_sec": 26, //duration_of_the_call
      } 
    ] 
}
```

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
  

