## Architecture of a Frontend App

Front End Application on the Quintype platform should be built in such a way that they can be served from a CDN cache. This drastically reduces load time, and the amount of load on the backend server. However, this puts a few constraints on the architecture of many pages.

All pages that want to be cached

* Cannot access the current user, or check if the user is logged in
* Cannot check the current device type

### Logged In Content

As a general practice, it's important to render the page as a logged out page, so that it can be served from the CDN. The page can then be updated via AJAX queries. In case the page must be rendered server side, with logged in content (ex: Personalized Home Page), then mark the page as uncacheable. Do keep in mind that all calls to `/api/v1/...` will automatically pass the `session-cookie` cookie to the API server, which will in turn be able to find out who the user is.

#### Getting the logged in user on the backend

Sketches and the client app share the `session-cookie` cookie. However, it’s an encrypted object only sketches can read. In order to read the current member, call `/api/v1/members/me`, passing in the value of `session-cookie` as the `X-QT-AUTH` header, to get the current user. Don’t bother saving a separate.

### Checking Device Type

As the content is cached, it is not permitted to check for Mobile / Tablet / Desktop or other Form Factor. Please use responsive CSS to style the content as required. If it is not possible to avoid device checks, please mark the page as uncacheable.

### Cache Headers and Keys

The following HTTP Headers should be returned with every HTTP response which should be cached.

```
Cache-Control: public,max-age=0
Surrogate-Control: public,max-age=30,stale-while-revalidate=120,stale-if-error=3600
Surrogate-Key: q/55/top/home s/55/d7f8965d s/55/b93cbb75 s/55/2eb36ec1 ss/55/fae74aa1
Vary: Accept-Encoding
```

The `Cache-Control` header is passed on the the browser, while the `Surrogate-Key` is processed by the CDN provider. However, they behave very similar. The options are as follows.

* `public`/`private`/`no-cache` - Please use `public` if the page is cacheable, and `private,no-cache` otherwise.
* `max-age=n` - This controls how long the page is considered fresh in the Database
* `stale-while-revalidate=n` - During this period, the page is served from CDN, but updated in the background.
* `stale-if-error=n` - During this time, the page is served from CDN in case the backend server crashes for whatever reason.

#### Cache Keys

Currently, we support the following keys, which will be invalidated by the Quintype editor when a story or group updates. Currently, the following keys are supported:

* `s/$publisher-id/$story-id` where story-id is the first 8 digits of the story id.
* `q/$publisher-id/$story-group/$location-id` where story-group is `top` or `stack-$id`, and location is `home` or `section-id`.

If you would like a soft purge on this key, prefix the key above with an `s`.

#### Cookies

It is very important that all cookies are stripped from requests which are to be cached. This can be enforced by the following methods:

* [Ruby](https://github.com/gja/rack-delete_cookies_from_public_requests)
* [PHP](https://github.com/gja/rack-delete_cookies_from_public_requests)

### Failures

In order for the CDN to serve error pages (in case the site is down), the backend server must return a `5xx` response.

Our CDN treats `404` and other status codes `< 500` as intentional failures, and these pages will be served instead of using a page marked with `stale-if-error`.

### Marking a page uncacheable

To mark a page as uncacheable, please use the following header.
```
Cache-Control: private,no-cache
```
