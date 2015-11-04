API guidelines
==============

<aside class="info">
To write API code, you need to read and accept these terms and conditions ;)
</aside>

### Begin the URL with `/api/<version>`

    /api/v5/orgs/<organization_id>/teams

Every API URL path must start with this. If following these guidelines, you should **set your version number to `v5`!**

If you later make backward-incompatible changes to your API that has already been "published" for customers, copy its implementation and tests as a new endpoint with higher version number.

### Use UUIDs as identifiers
From now on, all the IDs should be in UUID format (e.g. `7f9e9580-095b-42c7-838c-c04e667b26f7`). If creating a new Django model, its primary key field should be a UUID field. For old models, a UUID field need to be added and backfilled. You can use `giosgchat.modules.common.fields.UUIDField` until we upgrade to Django 1.8.

However, do **not** use the word "uuid" in resource attributes. For example, refer to a room with `room_id` attribute, not `room_uuid`.

### Require explicit organization or user ID

    /api/v5/orgs/7f9e9580-095b-42c7-838c-c04e667b26f7/teams

The rule of thumb, especially on API endpoints that list stuff: **the same URL should return "same things", no matter who is authenticated**. Of course, permission may be denied with `403` if the user does not have access to the endpoint or the resource. However, whenever the permission is granted, the contents of the list should be the same.

In practise, do **NOT** list "my organization's teams" like this: `/api/v5/teams`. Instead, the URL should explicitly contain the organization ID.

**Any endpoint** that is scoped to a single organization should begin with `/api/<version>/orgs/<organization_id>/`. Similarly, any endpoint that returns something that is scoped to a single user should begin with `/api/<version>/users/<user_id>/`.

This way the API can also be used in contexts where the authenticated user is allowed to access other organizations and users (resellers, super-users, networking, etc.). The downside is that you need to find out the organization ID before using the API. You can get the authenticated user's ID or the organization ID easily by using the special API endpoint `/api/v5/users/me`!

    /api/v5/orgs/7f9e9580-095b-42c7-838c-c04e667b26f7/reports/visitorstats/timeseries

This also applies to reporting APIs. E.g. if you want to get a organization-wide report

### Support optional URL trailing slashes

```python
    url(r"^api/v5/teams/?$", TeamListCreateAPIView.as_view()),
```

APIs must work with or without trailing slashes. However, when using the API, prefer leaving the trailing slash out, because Firefox would then show it better in network debugging tools.

In Django `urls.py`, remember to end the URL pattern with `/?$`, e.g.

### Companies are "organizations"
From now on, we should use the word "organization" instead of "company" in APIs and other "public" technical contexts. It is still OK to use "company" internally, but transition to "organization" is preferred.

The word can be shortened to `org` or `orgs` in URL paths and GET parameter names. For example: `/api/v5/orgs/7f9e9580-095b-42c7-838c-c04e667b26f7/teams`. You shoud still use `organization` on resource attributes.

### Personnel are "users"
Use the word "user" instead of "personnel" or "persons" in API and other public technical contexts. The word "personnel" should only be used internally.

For example, organization members are returned by `/api/v5/orgs/<organization_id>/users`, and an attribute referring to a personnel object should be named `user_id`.

### Giosg IDs are "tokens"

```json
{
    "visitor_token": "2bipq7y2xtgcyhzcweaafidbisd3lyar4s6f63cabdai37qm"
}
```

If you have an attribute or parameter which has any Giosg-signed ID (i.e. "Giosg ID"), then use the word `token` in its name.

### Use snake_case
You should [snake_case](https://en.wikipedia.org/wiki/Snake_case) in both URL paths, GET parameters and object attributes! All words are in lower case. Avoid using camelCase or dashed-word-combinations.

UUIDs are an exception, of course, as they contain hyphens (e.g.`7f9e9580-095b-42c7-838c-c04e667b26f7`).

### Related resources

```json
{
    "id": "7f9e9580-095b-42c7-838c-c04e667b26f7",
    "first_name": "John",
    "last_name": "Smith",
    "organization_id": "7f9e9580-095b-42c7-838c-c04e667b26f7",
    "organization": {
        "id": "7f9e9580-095b-42c7-838c-c04e667b26f7",
        "name": "Example Ltd."
    }
}
```

Attributes that relate to another resource should be named with pattern `<relation>_id`, for example `organization_id`. The value should be the related resources identifier (UUID). This relation can then be easily changed by setting the value to another ID.

You can additionally serialize the related resource as a nested object, if convenient. In this case, give this attribute the same name as the ID attribute without the `_id` suffix. This attribute must be **read-only**!

In this example, the `organization_id` may feel redundant, but it is needed to make the relation updateable. For consistency and easier use, the ID attribute should always be returned even if the relation is not editable!

**PRO TIP!** When serializing nested resources, use [Django querysets' `select_related`](https://docs.djangoproject.com/en/1.8/ref/models/querysets/#select-related) or [`prefetch_related`](https://docs.djangoproject.com/en/1.8/ref/models/querysets/#prefetch-related) to improve your APIs performance!

### Use `created_at` and `updated_at` for creation/updating timestamps
For every new resource, there should be timestamp attributes named `created_at` and `updated_at` (not `modified_at`) indicating when the resource was created and when it was updated the last time.

### End timestamp attribute names with `_at`
Your timestamp fields that contain a full timestamp (`DateTimeField`) should end with `_at` similar to `created_at` and `updated_at` timestamps.

### Name related attributes similarly to timestamp fields
When providing information related to timestamps, e.g. who created or updated the resource, it is recommended to name the beginning of the attributes with the same word. For example, with `created_at` you could provide attributes `created_by_user` and `created_by_user_id` (see [Related resources](#related-resources)). Also: with `updated_at` provide `updated_by_user` and `updated_by_user_id`.

### Start boolean attribute names with `is_`
Boolean attribute names should start with `is_`, whenever possible. For example: `is_closed`, `is_active` or `is_admin`.

### UTC is the default time zone
Whenever your user provides date/time parameters *without time zone information*, it should be assumed to be in UTC time zone (+00:00). **Also, your responses should always return date/times in UTC time zone!**

Your endpoint may take a time zone parameter if it would be useful, e.g. for getting daily reporting data. This may also affect the format of the returned date/times.

Do **NOT** automatically use the authenticated organization's or user's time zone preferences! This is because then the API would not be stateless any more. Instead, the client may retrieve the time zone setting separately (from `/api/v5/users/me`) and provide it as a parameter for your API.

### Render and accept date/times in ISO-8601 format

```python
from rest_framework import serializers
from giosgchat.modules.common.api_v5.serializers import UTCDateTimeField

class MyModelSerializer(serializers.ModelSerializer):
    created_at = UTCDateTimeField(read_only=True)
    # ...
```

When returngin a date/time in a response, render it in ISO-8601 format (e.g. `2015-08-31T16:32:17.879Z`).

- There must be **exactly three (3) decimals for the second**
- The date/time string **must end with `Z`**

<aside class="success">
<strong>PRO TIP!</strong> Use <code>giosgchat.modules.common.api_v5.serializers.UTCDateTimeField</code> class, which handles this formatting automatically for you!
</aside>

Also, if your API takes date/time parameters, the user should be able to provide it in ISO format. In these cases, the trailing `Z` could be optional.

### Use Django REST framework 3

If you are creating API views for creating, getting, listing, updating or destroying Django models, you should use [Django REST framework generic views](http://www.django-rest-framework.org/api-guide/generic-views/). In other cases, you should still use the framework's [base view class](http://www.django-rest-framework.org/api-guide/views/) `APIView`. This way you ensure that your views work consistently with all other views, in regards to response rendering, accept headers, authentication and permissions!

### Use pagination

```python
from giosgchat.modules.common.serializers import PageNumberPaginationSerializer

class MyResourceListCreateAPIView(ListCreateAPIView):
    pagination_serializer_class = PageNumberPaginationSerializer
    # etc.
```

If your API lists resources, it needs to be [paginated](https://docs.giosg.com/doku.php?id=public:technical-documentation:backend-api#pagination). When using a REST framework generic view, you just need to define our custom pagination serializer for your view class:

Pagination is not required if your view restricts the maximum number of returned results in some other way. E.g. for getting a report for each day in a range, the maximum range is limited.

### Allow token and session authentication

```python
from giosgchat.modules.common_api.rest_api import PersonnelSessionAuthentication, CompanyApiTokenAuthentication

class MyResourceListCreateAPIView(ListCreateAPIView):
    authentication_classes = (
        CompanyApiTokenAuthentication,
        PersonnelSessionAuthentication,
    )
    # etc.
```

Your API user should always be able to [authenticate with an API token, as documented](https://docs.giosg.com/doku.php?id=public:technical-documentation:backend-api#authentication). In addition, you should support Django session authentication.

In other words, ensure that the following Authentication sub-classes are included in your authentication classes list:

### Write tests first
Test-driven-development is highly encouraged! First write a test for a one piece of functionality, let it fail, and then write the implementation. When the test passes, you can move to the next piece of functionality, possibly commiting your changes.

Please, try to be as thorough in your tests as possible. For all public APIs, the coverage should be near 100%.

### Document your API
Add a documentation for your API to our [`giosg_docs` repository](https://github.com/giosg/giosg_docs)! You should create a new branch, write the documentation and create a pull request. On your code pull request you could add a link to this pull request.

### Someone reviews your API against these guidelines
When you have created the pull request for your API implementation, someone should review your code and your documentation against these guidelines.
