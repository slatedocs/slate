To get real time updates of any lead creation or lead update, support for registering a callback URL is available. 

This URL should be publically accessible and should accept 'POST' request (https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/POST).

The post params posted at any update in a particular leads are as follows 

```json

{
  "lead_id": 859071,
  "name": nil,
  "email": nil,
  "phone": "+919821884262",
  "country_code": "+91",
  "source": nil,
  "sub_source": nil,
  "placement": nil,
  "project_name": "Interface Heights (Raheja)",
  "is_duplicate": nil,
  "lead_status": "Claimed",
  "channel_name": "google",
  "agent_email": "anil.badgujar@anarock.com",
  "latest_event_details": {
      "event_id": 440927,
      "start_time": 1538631000,
      "end_time": 1538631300,
      "event_type": "followup",
   },
   "notes": [
        {
            "note_type": "text",
            "data": "Ringing no response",
            "message": "sent",
            "created_at": 1538569611,
            "note_id": 287551
       }   
   ]}
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
  

