# Overview

Welcome to Sunlight's API! Use our api to create groups, invite users to a group, see the activities of a group's users and many other things.

The api is organized around REST and was built under the [JSON API](http://jsonapi.org/) specifications.

Send your pull-requests to [`https://github.com/jalagrange/slate`](https://github.com/jalagrange/slate)

## Query parameters

All routes support query parameters to refine responses

- [**include**](http://jsonapi.org/format/#fetching-relationships), e.g. `GET /api/v2/orders?include=category` to include properties of the order relationship

- [**sort**](http://jsonapi.org/format/#fetching-sorting), e.g. `GET /api/v2/orders?sort=name` to sort all accounts ascending by name

- [**page**](http://jsonapi.org/format/#fetching-pagination), e.g. `GET /api/v2/orders?page[number]=1&page[size]=10` to return only the first 10 orders

- [**filter**](http://jsonapi.org/format/#fetching-filtering), The `filter` is not defined by JSON API. Implementations must specify if how the `filter` query parameter is supported.
