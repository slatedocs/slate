# Pagination

Many of the Yoyo Wallet API endpoints support the concept of pagination.

This is where the result set would be too large to return in a single request, so the API caller can control which subset of the results is returned.

Parameter | Type | Description
---------- | -----| -------
limit | integer | is the maximum number of results returned in a single request
starting_after |  timestamp | selects entities with a creation timestamp starting after this time
ending_before | timestamp | selects entities with a creation timestamp ending before this time
