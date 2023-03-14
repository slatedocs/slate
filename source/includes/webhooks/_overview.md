# Webhooks

Receive API calls from Wahoo to your webhook url.

If we do not receive an HTTP 200 response code we will retry the api call on the following retry schedule:
    
1. After 30 minutes
2. After 4 hours
3. After 24 hours
4. After 72 hours

API Calls will be sent via HTTP POST with the HTTP header `Content-Type: application/json`

It is possible for duplicate webhooks to be made when files are updated or deleted.
