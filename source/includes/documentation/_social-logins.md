
## Social Logins

### Facebook:
1. Create an app at [https://developers.facebook.com](https://developers.facebook.com)
2. Click on ‘Get started’ against Facebook Login.
3. Under Valid OAuth redirect URIs in Facebook Login settings, add the following urls:
    1. **site_url**/auth
    2. **site_url**/auth/facebook/callback
    3. **site_url**/admin/add-social.callback
4. In the app’s Basic settings, click on Add Platform and add Website with the **site_url**.
5. Insert the App ID and App secret generated in our database.
6. Now, to login to our site using Facebook login, call the URL: **site_url**/login?auth-provider=facebook&amp;remote-host=**site_url**
7. To get the details of the logged in user, call **api_host**/api/v1/members/me

### Twitter:
1. Create an app at [https://apps.twitter.com](https://apps.twitter.com)
2. Enter the basic details
3. Insert API key and API secret generated in our database.
4. Now, to login to our site using Facebook login, call the URL: **site_url**/login?auth-provider=twitter&amp;remote-host=**site_url**
5. To get the details of the logged in user, call **api_host**/api/v1/members/me
