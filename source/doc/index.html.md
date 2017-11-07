---
title: Quintype API Documentation

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

search: true
---

# Introduction to Quintype APIs

This repository is a knowledge base for developers working on projects backed by the Quintype platform. The live documentation is available as [Swagger](/swagger)

# Basic Concepts

## Stories Cards and Elements

Quintype is a structured CMS system. A story is comprised of cards, and cards of story elements.

### Cards

Cardification is a new paradigm targetted towards mobile-first consumption of news. In this age of information bormbardment, short and concise chunked blocks of content tend to have much higher engagement. Quintype stories are split into multiple cards. Front end apps can choose to represent these cards visually, allowing users to interact with these cards directly.

Any API request for stories will contain the cards that comprise the story in the *"cards"* field (as an array). These cards comprise the body of the story.

###  Story Elements

Story elements are the smallest logical unit in the Quintype platform. Each story element represents a single paragraph of text, image, video, or other unit of content. Story elements come together to form a card. Quintype also tracks these story elements and derives analytics reports based on user engagement on stories containing specific elements.

For eg: A story on tennis containing more photo story elements might get higher engagement.

The story elements can be found in the *"story-elements"* field of individual cards.

#### Story Element Types

Each story element will have a *"type"*, and optionally a *"subtype"*. There are currently five major types of story elements, which all front end applications must support. They are

* text - a paragraph of text
* image - an image
* youtube-video - a video on youtube
* soundcloud-audio - a piece of audio on soundcloud
* title - a title for a card (listicle)
* jsembed - arbitrary, unsafe HTML
* composite - an element depending on other story elements

#### Story Element Subtypes

Story elements may also have a *"subtype"* field, which gives hints on rendering for clients that know how to render the subtype. For example, a *jsembed* element may have the *twitter* subtype. Looking at the metadata, you will find the *tweet-id* of the particular tweet. Clients may choose to render this element as a *jsembed*, or as a native twitter element (and provide optimizations such as ensuring that the twitter SDK is only loaded once).

### Story Types

Story type are predefined templates which can be used to write articles of various domains ranging from photo blogs, listicles, video stories, blogs etc. Story types give a definite structure and a "starting point" to authors when they starts writing a story. Apart from this, they also help in predictive analytics. Data can be derived and studied based on audience engagement on various story types for different domains (eg: A photo story on wildlife may get higher engagement than a text story).

A story type may give subtle hints to the behaviour of the story. For example, a *live-blog* may choose to auto update every 30seconds.

## Stacks

A stack is a group of stories, which can be displayed anywhere on the homepage or other pages. The grouping of stories is done manually (or programatically), using the *Sorters* interface on the CMS. A closely related concept is the [Stack](./story-collections).

### Sections

Stacks can have stories in the "Home" section (global), as well as within a section. For information on how this works, please see the [Story Groups](./story-groups) page.

### API requests

A stack can be requested using the *story-group* parameter to the stories API. The [Swagger Documentation](./home#api-documentation) contains information on how to fetch stories within a stack.

## Story Groups

*story-group* is the most important parameter to the stories API. This parameter indicates which set of stories you'd like to fetch. Currently, the story group can be *top*, or *published*, or *stack-\{{id}}*, corresponding to top stories, stories in published order and stacks respectively.

Story groups that are backed by a sorter can be sorted by


### *top* stories

The 'top stories' group is an infinitely long list. This first manually picks sorted stories from the list, then continues with stories in published order (reverse chronological).

### *published* stories

The 'published stories' group returns stories in published order (reverse chronological), skipping the order from the sorters.

### stacks

The stack stories will only return stories in the sorter. As an exception, if a sorter for a (stack / section) combination is empty, it will fall back to the stories in (stack / "Home")

### Behavior of various story groups

Various story groups behave slightly differently. Each story group typically has a sorter, except for 'published'.

| *story-group* | *"Home"* | *section* |
| :-----------: | -------- | --------- |
| top | Stories as per sorter, then stories reverse chronologically | Stories as per sorter, then stories in that section reverse chronologically |
| stack-id | Stories as per sorter | If the sorter has stories, then it returns the sorted stories. If the sorter is empty, it will return stories for the same stack in the "Home" section |

## Breaking News

Breaking news can be used to quickly push current events to users as they are happening. These stories may not be fully formed, and only require a headline. These Breaking news events can be linked to a story, after the push has happened.

### Linking to another story

The breaking news story can be linked to an existing story, or added later. Typically, clicking on the breaking news should take you to this story.

### API Documentation

Please see the [swagger documentation](http://editor.swagger.io/#/?import=https://itsman.quintype.com/sketches-swagger.json&tags=breaking-news) for details on how to use the API.

## Voting and Rating

End users have the ability vote on/rate a specific story. Potential applications include upvote/downvote, like/dislike, star rating etc.

Each story has multiple types of ratings ('magnitude')  whose value can be incremented using an API.

### 1. Configuring allowed magnitudes
This is a one-time setup, where the publisher needs to come up with a list of allowed magnitudes for their voting system. It could be `['upvote', 'downvote']`, `['like', 'dislike']`, `[1, 2, 3, 4, 5]`, etc.

Currently, there is no API to set this. Please contact us to make this change.

### 2. Authentication
Make sure the user is logged in, via one of our supported authentication methods.

Currently, we do not support anonymous voting.

### 3. Vote
Use the [POST Vote API](http://petstore.swagger.io/?url=https://itsman.quintype.com/sketches-swagger.json#!/vote/post_api_stories_story_id_votes) to vote on an article. You need to send an allowed magnitude.

### 4. Get votes for one or more stories
Use any one of the [GET Stories](http://petstore.swagger.io/?url=https://itsman.quintype.com/sketches-swagger.json#!/story) APIs, but make sure you pass `votes` in the fields list.

### 5. Get votes for a story for a user
Use the [GET Vote API](http://petstore.swagger.io/?url=https://itsman.quintype.com/sketches-swagger.json#!/vote/get_api_stories_story_id_votes) to get the votes for a particular story, for the currently logged-in member. Possible uses include finding if a user has voted or not, and the magnitude of their vote.

## Entities

Entity is a new feature introduced in the editor to maintain structured information relevant for the publisher and refer them in relevant stories.

The representation of linked entities on the front end is contextual to the purpose for which it is referred in stories.
Example of entity will be Person (referred to as ‘entity type’) which will have the structure not limited to name, avatar, email address, social handle, bio, company associated to it.

Entity types can only be created by the technical team based on the requirement.
Entity type can contain text, numerics, image and another entity.

Publishers can create various values (referred to as entities) for the entity type using the ‘Entity Manager’ and these values can be referred to in stories.
Entity manager can also be used to modify existing entities.

There are three endpoints to access entities:

### 1. Getting all the entities

Use the [GET ENTITY API](http://editor.swagger.io/#/?import=https://itsman.quintype.com/sketches-swagger.json&tags=entity) to get all the entities created.

### 2. Getting particular entity details.

Use the [GET ENTITY API](http://editor.swagger.io/#/?import=https://itsman.quintype.com/sketches-swagger.json&tags=entity) with the entity-id.

### 3. Getting the nested entities linked to an entity

Use the [GET ENTITY API](http://editor.swagger.io/#/?import=https://itsman.quintype.com/sketches-swagger.json&tags=entity) with the root entity-id followed by the nested-entity key.


# Front End Topics

## Images

Quintype currently uses [Imgix](https://www.imgix.com) to display images in various aspect ratios.

### Base Url

A image's URL can be obtained by appending the *"image-s3-key"* to "http://quintype-01.imgix.net/". For example, the hero image whose s3 key is "quintype-demo/1234/foo.png" is "http://quintype-01.imgix.net/quintype-demo/1234/foo.png". This is the image in it's original resolution, and can be transformed using any of [Imgix's Transforms](https://docs.imgix.com).

### Focus Point

Our editor allows the placement of a focus point on any image. The placement of a focus point guarantees that that point is always present in the viewport when the image is cropped, across different aspect ratios.

It is recommended that the focus point is used in conjuncture with the *picture* spec of HTML5, in order to show images at different aspect ratios on different devices. Using an `object-fit: cover;` will further center the image.

The refrence implementation for the focus point algorithm can be found in the [javascript implementation](https://github.com/quintype/quintype-js/blob/master/lib/focused_image.js).

The focus final image url can be calculated with the following pseudo code (for a 16x9 image with final width 640)

```js
var FocusedImage = require("quintype-js").FocusedImage;
var image = new FocusedImage('quintype-demo/1234/foo.png', metadata);
var output_url = "http://quintype-01.imgix.net/" + image.path([16, 9], {w: 640});
```

### Recommended Transforms

In order to save bandwidth, and provide a good experience, we suggest you use the following transforms:

```javascript
var transforms = {
  w: 640,       // actual width
  q: 60,        // quality
  auto: format  // use WebP when available
  fm: pjpg      // fallback to progressive jpeg
};
```

The list of all transforms can be found in the [Imgix Documentatation](https://docs.imgix.com).

# Advanced Topics

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

## RSS Feed

The stories RSS feed can be used to syndicate stories out from the CMS

### End point
* `/stories.rss` -> end point for RSS feed
* This end point by default generates RSS feed for last four hours

### Supported parameters
1. Parameter to fetch stories with different time durations
   * `/stories.rss?time-period=last-24-hours` -> Fetches RSS feed with stories from last 24 hours
   * `/stories.rss?time-period=last-7-days` -> Fetches RSS feed with stories from last 7 days
   * `/stories.rss?time-period=last-1-month` -> Fetches RSS feed with stories from last 1 month

2. Parameter to fetch stories by section slug
   * **section slug** can be obtained from `api/v1/config`
   * `/stories.rss?section=section-slug` -> Ex: `/stories.rss?section=sponsored-content` This end point
     fetches stories from _Sponsored Content_ section.

3. Parameter to fetch stories by section id(Preferable way to fetch stories by section)
   * **section id** can be obtained from `api/v1/config`
   * `/stories.rss?section-id=id` -> Ex: `/stories.rss?section-id=2809` This end point
     fetches stories from _Sponsored Content_ section.

4. Parameter to skip syndicated stories
   * `/stories.rss?skip=value` -> This removes syndicated stories from a particular source; Example `/stories.rss?skip=bloomberg` on bloombergquint skips stories syndicated from bloomberg
   * `/stories.rss?skip=all` -> This all value as parameter removes all syndicated stories
   * This parameter supports comma separated values; Example `/stories.rss?skip=bloomberg,thequint` -> This filters out stories syndicated from bloomberg, thequint on bloomberg quint

5. Parameter to fetch stories from a sorter
   * `/stories.rss?story-group=story-group` -> This fetches stories by sorter.
   * The **story group** for any sorter can be obtained from `api/v1/config`
   * This doesn't have the time limit of 4 hours. This just pulls the stories from a sorter.

6. Parameters to fetch stories by excluding stories from particular section(s).
   * `/stories.rss?exclude-section-ids=section-ids` -> This fetches stories by excluding stories from section-id(s) lister; Example: `/stories.rss?exclude-section-ids=2435` this fetches stories and filters out stories(if there are any) with section id 2435.
   * **section-ids** can be obtained from `/api/v1/config`
   * this parameter supports multiple sections ids as comma separated values. This helps filtering out stories based on multiple sections

## Preview

### Technical Overview

The preview functionality is implemented with a combination of the backend editor, and the front end UI. The front end page has to implement two routes. `/preview/story` and `/preview/home`. The editor fetches this page via either HTTP or HTTPS, then served in an IFrame on the editor (via HTTPS). As the story is updated in the editor, the story is passed to the page via the message API, and the page is expected to rerender on the Front End.

### HTTPs Only

As the content is loaded via HTTPS, any HTTP content (external JS, etc...) will not render.

### Example

Below is sample code explaining how to listen via the IFrame message API.

```javascript
var StoryPreview = (function() {
  window.addEventListener("message", function(event){
  var template = getLiquidTemplate("pages/story");
  var story = event.data['story'];
    if (story) {
      $("#story-preview").html(template.render({story: story, preview: true}));

      // Do other things to make the page work correctly, such as post load JS
    }
  });
});
```

### Testing

Head to */preview/home*, then paste the following in the console. The page should immediately render with the sample story.

```javascript
window.postMessage({story: {"author-name":"Tapan Bhat","headline":"The Greatest !","slug":"sports/2016/06/08/the-greatest","last-published-at":1465407509866,"alternative":{},"sections":[{"id":82,"name":"Sports"}],"hero-image-metadata":{"width":2133,"height":1906,"focus-point":[988,258]},"published-at":1465407509866,"id":"1d2fc836-4113-4ae1-8735-377167664892","hero-image-s3-key":"quintype-demo/2016-06/cca8f31e-9264-4ee2-9af0-08eb53be2a26/ABP-1.jpg","author-id":2041,"first-published-at":1465407509866,"story-template":"photo"}, "action": "reloadStory"}, window.location.origin)
```

The */preview/story* should also behave similarly, but render the story.

### Isomorphic Rendering

In order to render from both the server side, and the client side, it is suggested that you use a templating language capable of Isomorphic Rendering. Some suggestions are [Liquid Templates](https://shopify.github.io/liquid) or [Twig](http://twig.sensiolabs.org)

## Default URLs

The Quintype application is made up of at least 3 host names.

* The editor
* The API server
* The front end application

### Staging

Staging urls are typically hosted by Quintype, and will have the following URLs.

* editor - `thefoobar.staging.quintype.com`
* api server - `thefoobar.staging.quintype.io`
* front end - `thefoobar-web.staging.quintype.io`

### Production

Production urls typically have the editor and API server on the quintype domains, and the front end on the final domain

* editor - `thefoobar.quintype.com`
* api server - `thefoobar.quintype.io` / `thefoobar.internal.quintype.io` (accessible within QCC)
* front end - `www.thefoobar.com` (this should be `next.thefoobar.com` before going live)
* beta front end - `beta.thefoobar.com`

### Black Knight

During the process of creating your account, the Quintype team will also create a publisher (The Foobar) on the [Black Knight](./black-knight) application. You will be able to deploy all your front end applications from the same place.

### Production DNS Entries

The following is an example for the DNS entries to be made

```dns
www.thefoobar.com   CNAME thefoobar.publisher.quintype.io
next.thefoobar.com  CNAME thefoobar.publisher.quintype.io
beta.thefoobar.com  CNAME thefoobar.publisher.quintype.io
thefoobar.com       A     174.129.25.170 # Redirect to www.thefoobar.com using http://wwwizer.com/naked-domain-redirect
```

We strongly recommend that you serve your content off a `www` domain, and use the apex to forward 301 to your www domain. However, do use a provider that sets a `Cache-Control` header with the redirect (like GoDaddy).

If your main site is on an APEX domain, then you may use the following entries:

```dns
thefoobar.com A 151.101.0.204
thefoobar.com A 151.101.64.204
thefoobar.com A 151.101.128.204
thefoobar.com A 151.101.192.204
```

### SSL / HTTPS

If your site requires SSL / HTTPS, contact us support@quintype.com

## Deploying with Black Knight

The Black Knight application is a tool to deploy your front end code across the Quintype Client Cloud

### Overall Workflow

The deployment process has three steps

#### Compilation Steps

* Changes to the app are made locally, and pushed up to [GitHub](https://github.com).
* [Docker Hub](https://hub.docker.com) picks up the changes from GitHub, and builds a docker tag.

#### Deployment Steps

* Enter the docker tag that is to be deployed. And click deploy.
* Black Knight will automatically [copy in config files](#setting-up-configuration), and create an 'immutable tag'
* Black Knight will then deploy this 'immutable tag' across the Quintype network.

### Setting Up Configuration

Black Knight can be configure to copy in configuration files. These configuration files are per environment, and allow you to have different behavior across environments, and can be used for many use cases, such as

* Changing the API host on staging
* Config to disable SEO on beta / staging
* Changing secret keys


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

# Analytics

[Web Tracking](#web-tracking-qliticsjs)
[Google AMP Tracking](#google-amp-tracking)
[Collected Data](#automatically-collected-data)
[API](#api-methods)


## Web Tracking (qlitics.js)

The `qlitics.js` Javascript library is used for tracking user interaction with the frontend website.

The frontend website needs to implement a route `/qlitics.js` that proxies to the same route on `API_HOST`. It also needs to embed the following script before the closing `</head>` tag (or as early as possible).

```html
<!-- Qlitics Snippet -->
<script>
  window.qlitics=window.qlitics||function(){(qlitics.q=qlitics.q||[]).push(arguments);};
  qlitics('init');
  qlitics('track', 'page-view', {'page-type': <page_type> });
</script>
<script async src='/qlitics.js'></script>
<!-- End Qlitics Snippet -->
```

`<page_type>` is a placeholder for current page's type. The `qlitics.js` snippet served by `API_HOST` has the correct `publisher-id` hardcoded in it.

## Google AMP Tracking

```html
<!-- Qlitics Tracking -->
<amp-analytics>
<script type="application/json">
{
    "requests": {
        "storyview":"<qlitics_host>/api/${random}/amp?publisher-id=${publisherId}&event-type=${eventType}&story-content-id=${storyContentId}&url=${ampdocUrl}&referrer=${documentReferrer}"
    }
    ,
    "vars": {
        "publisherId": <publisher_id>, "storyContentId": "<story_content_id>"
    }
    ,
    "triggers": {
        "trackStoryview": {
            "on":"visible",
            "request":"storyview",
            "vars": {
                "eventType": "story-view"
            }
        }
    }
}

</script>
</amp-analytics>
<!-- End Qlitics Tracking -->
```

`<publisher_id>`, `<qlitics_host>` `<story_content_id>` are placeholders and need to be replaced with equivalent placeholders as per the templating language being used.


### Automatically collected data

The snippet automatically records the following data

   - Current page url
   - Geographic location of the user
   - Operating System and browser being used
   - Referring site
   - User agent

### API Methods

  - `init`
     Initializes the tracker. Should be the first api to be called. It generates (or reuses) the device tracking id and the session id.

    ```javascript
    qlitics('init');
    ```

   - `set`
  Used to set a property on the tracker. Accepts a `property` and a `value` for that property.
      - `property` String. One of the [settable properties](#settable-api-properties).
      - `value` Any. Value for the property. Check documentation for the specific property.

        ```javascript
        qlitics('set', 'member-id', 1234);
        ```

   - `track`
  Used to track one of the following user interaction events.
        - `page-view`
        Should be called on every page load. Shouldn't be called for pages loaded via ajax. Accepts a hashmap specifying the [`page-type`](#page-type). Refer [common API fields](#common-api-fields).

          ```javascript
          qlitics('track', 'page-view', {'page-type': 'home'});
          ```

        - `story-view`
            Should be called when a story page is loaded. A story view depends on a page-view and should be called only after a `page-view` has been tracked. If additional stories are being loaded via ajax, then this event should be tracked for each of those stories as well. This will reuse the initially triggered page-view's identifier. Refer [common API fields](#common-api-fields).

          ```javascript
          qlitics('track', 'story-view', {
            'story-content-id': '9b2fe90f-b155-4624-862e-88c981c9da6c',
          });
          ```

        - `story-element-view`
            Should be called the first time a [story element](./stories-cards-and-elements) comes into the browser's viewport. This is used to track which all story elements did the user actually view and how much time was spent on that story. Refer [common API fields](#common-api-fields).

          ```javascript
          qlitics('track', 'story-element-view', {
            'story-content-id': '9b2fe90f-b155-4624-862e-88c981c9da6c',
            'story-version-id': 'bc1295de-1b29-4588-8822-3949510b5fd6',
            'card-content-id': '505d5c9d-e776-4f17-bd53-8dd8d579122d',
            'card-version-id': 'abfcabf3-6dcc-4791-a87e-16a36c1b1ae6',
            'story-element-id': '1f97a56d-be01-4a2d-b319-0e88cf9a2259',
            'story-element-type': 'youtube-video',
          });
          ```

        - `story-element-action`
            Should be called to track any user interaction with a story element. For example, the playing and pausing of a youtube video, as well as whether the user saw the entire video or not can be tracked. Refer [common API fields](#common-api-fields).

          ```javascript
          qlitics('track', 'story-element-action', {
            'story-content-id': '9b2fe90f-b155-4624-862e-88c981c9da6c',
            'story-version-id': 'bc1295de-1b29-4588-8822-3949510b5fd6',
            'card-content-id': '505d5c9d-e776-4f17-bd53-8dd8d579122d',
            'card-version-id': 'abfcabf3-6dcc-4791-a87e-16a36c1b1ae6',
            'story-element-id': '1f97a56d-be01-4a2d-b319-0e88cf9a2259',
            'story-element-type': 'youtube-video',
            'story-element-action': 'play',
          });
          ```

        - `story-share`
            Should be called when a user shares a story on social media via the story page. Refer [common API fields](#common-api-fields).

          ```javascript
          qlitics('track', 'story-share', {
            'story-content-id': '9b2fe90f-b155-4624-862e-88c981c9da6c',
            'social-media-type': 'facebook',
            'url': 'https://publisher-domain.com/story-slug',
          });
          ```

### Settable API Properties

   - [`member-id`](#member-id)

### Common API Fields

#### card-content-id
   String UUID. The id for the [card](./stories-cards-and-elements).

#### card-version-id
   String UUID. The current version of the card.

#### member-id
   Int. A unique identifier for the currently logged in member.

#### page-type
   String. A short identifier for the current page. Standard values for some of the pages,

   - `home` for the home page
   - `story` for the story page
   - `section` for the various section and sub-section pages
   - `topic` for the various tag and topic pages

   For the remaining pages, any value can be provided.

#### social-media-type
   String. A tag to refer to the social media service. Ex `facebook`, `twitter`, `email`, `whatsapp`, `google_plusone_share`, `linkedin` etc

#### story-content-id
   String UUID. The id for the current story being displayed.

#### story-element-action
   String. The user interaction being tracked with a [story element](./stories-cards-and-elements). The value will depend on the element type and iteraction being recorded.

   - For the `youtube` story element, action can be one of the following
    - `play` when the video starts playing or when playback is resumed
    - `pause` when the video playback has been paused
    - `complete` when the video has finished playing

#### story-element-id
   String UUID. The id for the story element.

#### story-element-type
   String. The type of the story element. Check the [docs](./stories-cards-and-elements) for available types.

#### story-version-id
   String UUID. The current version of the story.

### Testing

The snippet generates a tracking pixel for every api call made. This pixel is embedded in the DOM and deleted immediately after call succeeds. If the api calls are being made properly, then there should be entries for the resource named `event.gif` in the network tab of the browser's developer console. The request for this resource should have a `data` query parameter whose value should be the base64 encoded payload. Decode the data and verify the correct payload is being passed. The server will return a non 200 response if the payload is incorrect.


# Sample Applications and Libraries

We have published a number of starter-kits for various popular languages. Please clone these, and use this as a starting point.

## Front End Javascript

* The Image resizing functions is available via the [quintype-js](https://github.com/quintype/quintype-js) npm module

## Ruby on Rails

The Ruby on Rails starter kit can be found here: [Coconut](https://github.com/quintype/coconut). The following libraries are used (and patches appreciated)

* [Quintype Ruby API](https://github.com/quintype/quintype-api-ruby)
* [Quintype Liquid](https://github.com/quintype/quintype-liquid)
* [Quintype Routes](https://github.com/quintype/quintype-routes)

## PHP (with Laravel)

The PHP / Laravel application can be found here: [Pina Colada](https://github.com/quintype/pina-colada)

## Node.js (with React)

Node.js application can be found here: [Pina Colada](https://github.com/quintype/malibu)
