# Authentication

FluentCRM uses WordPress REST API. So you can use any authorization method that supports WordPress.

Once you create your Application Password in WordPress, Add Authorization Header to every request.

> Example API Call for contacts

```shell
# With shell, you can just pass the correct header with each request
curl "https://yourdomain.com/wp-json/fluent-crm/v2/subscribers" \
  -H "Authorization: BASIC API_USERNAME:API_PASSWORD"
```

**API Base URL:** `https://yourdomain.com/wp-json/fluent-crm/v2`

### Creating API Key
You can either create Application Password using WordPress's user editing Page. Please make sure, the user have access to FluentCRM.
We recommend creating Application Password from inside FluentCRM. Navigate to `FluentCRM -> Settings -> Managers` and then create a Manager First. Please make sure the manager is not "Administrator" user role. Select the permissions you want to give to that user for FluentCRM.

![Create manager on FluentCRM](images/create_manager.png)

Then Go to `FluentCRM -> Settings > Rest API` and Create the new key corresponding to manager.

![Rest API Screen](images/rest_api_screen.png)

Once you confirm, It will give you the username and application password. Please note that, You can not retrive the Application password later. So save that for the future use.

![Application Create Success](images/rest_api_success_keys.png)

In the background, FluentCRM create REST API in WordPress user.


> Make sure to replace `API_USERNAME` & `API_PASSWORD` with your UserName & API Password.
