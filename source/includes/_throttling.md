# Throttling

Requests to Beyonic are throttled. If you send too many requests too fast, you will receive a throttling error resulting in a response with the HTTP status code "429 Too Many Requests".

API READ requests are limited to 30/minute.

API WRITE requests are limited to 3000/minute.