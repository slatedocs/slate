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
