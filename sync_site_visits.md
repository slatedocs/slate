API End Point


URL - `https://lead.anarock.com/api/v0/:channel/site-visit`

Test URL - `https://marketing.anarock.com/api/v0/test_channel/third-party/create-site-visit`

METHOD - `POST`

PARAMS 

```js
{
  "assignment_supply_entity_mapping_id": 726,
  "integration_key": "516501274ba4288a",
  "campaign_id": "f8c2858d4c85cdec8532a755b9819c63",
  "country_code": "+91",
  "phone": "9819619866",
  "name": "Test Name",
  "email": "test@test.com",
  "sourcing_agent_email_ids": "agent1@anarock.com,agent2@anarock.com",
  "closing_agent_email_ids": "agent3@anarock.com,agent4@anarock.com",
  "min_budget": 1000000,
  "max_budget": 12110000,
  "interested_property_types": "1 BHK,2 BHK,3 BHK",
  "purpose_of_purchase": "Investment", // "Self Use"
  "mode_of_payment": "Loan", // "Self Funded" , "Sale of Property", "Other"
  "designation": "Manager",
  "industry": "Real Estate",
  "pincode": 400051,
  "ethnicity": "Gujarati",
  "occupation": "Business",
  "company_name": "Anarock",
  "gender": "male", // "male", "female", "others"
  "source": "google", // google, facebook, radio, 
  "cp_data": {
    "name": "CP Name",
    "country_code": "+91",
    "phone": "9879876434",
    "firm_name": "CP Firm Name"
  },
  "referral_data": {
    "name": "Test Referrar",
    "country_code": "+91",
    "phone": "9819619866"
  }
}
```

Response 

