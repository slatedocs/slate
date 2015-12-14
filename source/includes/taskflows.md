# Taskflows

## Get a list of taskflows

> Example Request

```
curl https://webapp.kotive.com/api/group/<group_id>/taskflowReports
	-H 'Authorization: Basic <token>'
```

> Example Response

```
{
  "taskflowReports": [{
    "id": 769,
    "label": "My Average Taskflow"
  }, {
    "id": 796,
    "label": "My Awesome Taskflow"
  }]
}
```

* Endpoint: `/group/<group_id>/taskflowReports`
* Request: `GET`

Who knows what your group is up to? Probably doing something fun, like taking over the world or eating ice cream. *Without you*. If you're really that desperate, here's how to get a list of taskflows for your group:

First of all you'll need the `group_id` of the list, so that you can find out who is in that group. Getting this value should be pretty easy, as it will be nested inside of the `groupsIndex` part of the login response you got earlier!

Once you have your `group_id`, simply submit a `GET` request to `/group/<group_id>/taskflowReports` to get a list of taskflows!
