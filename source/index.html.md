---
title: Analytics Implementation Guide=========================

language_tabs: # must be one of https://git.io/vQNgJ
  - javascript

search: true
---

# Prerequisites

* Analytics VVM or User Story UDAY SAtivadskdksajkajsdkasdjakdjkasldj
* Access to Ensighten
* Adobe configuration values :
	* Report Suite ID (rsid) = provided in VVM or User Story
	* Adobe Login Company = "Turner"
	* Secure Tracking Server = "sanalytics.tbs.com or sanalytics.tntdrama.com or sanalytics.trutv.com"
	* Non-Secure Tracking Server = "analytics.tbs.com or analytics.tntdrama.com or analytics.trutv.com"
	* Namespace = "turnerclassicmovies"

# Ensighten Implementation

## 1. Create a new space

> Example Bootstrap:

```javascript
<script type="text/javascript" src="//nexus.ensighten.com/turner/example-space/Bootstrap.js"></script>
<script type="text/javascript" src="//agility.tbs.com/turner/tbs-prod/Bootstrap.js"></script>
```

1. Log sdkfsjklsjkdlsajdakldkjalsdjklasdfjklsajkljkld in to Ensighten Manage.
2. Click **Spaces** from left menu.
3. Click **Add Space** and enter your space info.
4. Publish your changes and make a note of the Bootstrap include script.

<aside class="success">
  <strong>Best Practices for creating a new space</strong>
  <ul>
    <li>Create a space per environment: <strong>production</strong> and <strong>non-production</strong> environments.</li>
    <li>Add a server side <strong>kill switch</strong> for the Bootstrap. In case of the Ensighten causing any issues on the site, you can easily take it out.</li>
    <li>Add an <strong>environment logic</strong> to automatically load production vs non-production Bootstrap.</li>
    <li>Enable <strong>Tag Alerts</strong> and <strong>Publish Alerts</strong> (Click <strong>turnerintl</strong> in the top right and select <strong>settings</strong>), so you get a notification email when someone publishes in your space.</li>
  </ul>
</aside>

## 2. Update Namespace

Update the Namespace of the newly created Space, so it does not conflict with another Bootstrap on a page.

1. Log in to Ensighten Manage.
2. Click **Publish Paths** from left menu.
3. Edit the Publish Path of the newly created Space.
4. Change the Namespace from "Bootstrapper" to "tdi".
5. Save changes.

![alt text](images/update-namespace.png)

## 3. Add To Global Template

Add the newly created Space to the latest global template.

1. Click **Spaces** from left menu.
2. Edit the latest global template Space.
3. Add your space.
4. Save changes.

![alt text](images/addto-globaltemplate.png)


1. Create a new Custom JavaScript called **"Site Configuration"** 
<span style="color:red">(Do not merge from other Configuration tag. If you do, it will inherit the settings and you will not be able to perform the next steps.)</span>.
2. Copy the **Configuration** code from the global template and add to the **Site Configuration** tag.
3. Update the configuration to appropriate values.
4. Choose **Synchronous** condition.
5. Choose the **Configuration** code from the global template to fire first.
6. Save changes.

![alt text](images/site-configuration-tag.png)

# Site Implementation

## Initialization

> Example:

```javascript
<html>
  <head>
      <script>
          var turner_metadata = {
    "content_type": "adbp:none",
    "friendly_page_name": "miracle workers: dark ages",
    "mvpd": "no value",
    "series_name": "miracle workers: dark ages",
    "template_type": "adbp:content",
    "app_name": "tbs|us|english",
    "device": "web",
    "uday": "udayweb======================================================",
    "device_type": "web",
    "episode_num": "1",
    "mvpd_status": "no value",
    "network": "tbs",
    "season_num": "2",
    "user_id": "no value",
    "app_webview": "false",
    "content_labels": "no value",
    "section": ["episode info", "miracle workers: dark ages"]
};
      </script>
      <script src="//nexus.ensighten.com/turner/example-space/Bootstrap.js"></script>
      example of tbs : <script type="text/javascript" src="//agility.tbs.com/turner/tbs-prod/Bootstrap.js"></script>
  </head>
</html>
```

A global standards implementation starts with two steps. In the `<head>` of every page:

1. Add a JavaScript Object named **turner_metadata** with an empty **trackAction** array.
2. Add a call to an external JavaScript file; the Ensighten **Bootstrap.js**.

<aside class="success">
  <strong>Turner Metadata Object</strong>
  <br><br>
  In the context of HTML based content (e.g., web sites), the <strong><i>turner_metadata</i></strong> object is:
  <ul>
    <li>A window-scoped variable</li>
    <li>Defined as turner_metadata</li>
    <li>Follows JSON Syntax</li>
    <li>Must contain <i>trackAction</i> array</li>
  </ul>
</aside>

<aside class="notice">
  <strong>OneTrust Banner</strong>
  <br><br>
  OneTrust banner script should be implemented by the site dev team. <i style="color:red;">Analytics team does not provide the script.</i>
  <br>
  Once the OneTrust banner has implemented, <strong><i>OnetrustActiveGroups</i></strong> variable should be created, and it must contain at least one of the following category IDs:
  <ul>
    <li>Category 1 - Strictly Necessary</li>
    <li>Category 2 - Performance</li>
    <li>Category 3 - Functional</li>
    <li>Category 4 - Targeting</li>
    <li>Category 8 - Social Media</li>
  </ul>
  <strong>Best Practices:</strong>
  <ul>
    <li>Implement the black veil overlay, so the users cannot navigate into the site until they agree to the user consent.</li>
    <li>Reload the page once the users agree to the user consent, so you can capture the initial pageview.</li>
  </ul>
</aside>

## Page View Tracking

> Example Page View Tracking

```javascript
 var turner_metadata = {
        "content_type"      : "other:static",
        "friendly_page_name": "home page",
        "mvpd"              : "no value",
        "template_type"     : "adbp:index",
        "app_name"          : "tbs|us|english",
        "device"            : "web",
        "device_type"       : "web",
        "episode_num"       : "no value",
        "mvpd_status"       : "no value",
        "network"           : "tbs | tnt | tru",
        "season_num"        : "no value",
        "user_id"           : "no value",
        "app_webview"       : "false",
        "section"           : ["home", "main"]
        try {
            trackMetrics({
                type: "pageview",
                data: turner_metadata
            });
        } catch (e) {}
```

The example on the right-hand side shows all parameters that can be included with a page view call.

* Use **trackMetrics** array to push your page view calls.
* **previouspage** variable is handled through Adobe *getPreviousValue* plugin and does not need to be set.

<aside class="success">
  <strong>TrackMetrics Array</strong>
  <br><br>
  <p>The <i>trackMetrics</i> array is used for all tracking.  Tracked events may be pushed into the <i>trackMetrics</i> array before Ensighten Bootstrap is loaded.</p>
</aside>


## Interaction Tracking

> Featured Content Click

```javascript
window.trackMetrics({
  "type" : "interaction",
  "data" : {
    "interaction" : "featured content event",
    "featuredcontent" : "featured content name",
    "featuredcontentevent" : 1
  }
});
```
> Interaction and Social Click

```javascript
window.trackMetrics({
  "type" : "interaction",
  "data" : {
    "interaction" : "name of social or button"
  }
});
```

> Registration Process Start Click

```javascript
window.trackMetrics({
  "type" : "interaction",
  "data" : {
    "interaction" : "registration start event"
  }
});

```
> Successful Registration Complete

```javascript
window.trackMetrics({
  "type" : "interaction",
  "data" : {
    "interaction" : "registration complete event",
    "registrationevent" : 1
  }
});
```

> Internal Campaign/Banner Click

```javascript
window.trackMetrics({
  "type" : "interaction",
  "data" : {
    "interaction" : "internal campaign event",
    "internalcampaign" : "campaign name",
    "featuredcontentevent" : 1
  }
});
```

> Login Click

```javascript
window.trackMetrics({
  "type" : "interaction",
  "data" : {
    "interaction" : "login start event"
  }
});
```

> Successful Login Complete

```javascript
window.trackMetrics({
  "type" : "interaction",
  "data" : {
    "interaction" : "login complete event",
    "loginevent" : 1
  }
});
```

The examples on the right-hand side list all global standard interaction calls.

The examples on the right-hand side list the standard game tracking calls.

* The **gamersid** variable will send your call to a different Adobe report suite on fly. Omitting the variable will direct the traffic to the default report suite(s).

<aside class="success">
  <strong>iFrame Games</strong>
  <br><br>
  If your game is hosted in an iframe, you must add the following Ensighten Bootstrap on your iframe page <code>&lt;head&gt;</code> before adding any tracking calls.
  <br>
  <code style="display:block; white-space:pre-wrap;">
    &lt;script&gt;
      var turner_metadata = {
          "trackAction" : []
      };
    &lt;/script&gt;
    &lt;script src="//nexus.ensighten.com/turnerintl/&lt;example-space&gt;/Bootstrap.js"&gt;&lt;/script&gt;
  </code>
  <i>** The correct Bootstrap.js file will be provided by the analytics team.</i>
  <br><br>
  Also, to include the page level data, you must ask the site dev team to add the page metadata to your iframe source query string.
  <br>
  <code style="display:block; white-space:pre-wrap;">
    &lt;iframe src="https://emea.iframed.cn.dmti.cloud/game/ben-10-omnicode/index.html?pageName=/cn/ben-10-omnicode&cid=123&OnetrustActiveGroups=1,2"&gt;&lt;/iframe&gt;
  </code>
  <br>
  Common Page Metadata:
  <ul>
    <li>pageName - page name of the parent page (e.g. /uk/cn/ben-10-omnicode)</li>
    <li>cid - campaign code (e.g. 123)</li>
    <li>OnetrustActiveGroups - OneTrust banner variable (e.g. 1,2,3,4)</li>
  </ul>
</aside>

## Video Tracking

>Player Ready (must be called for every new video including replay)

```javascript
window.trackTOPEvent({
  "type" : "video",
  "subtype" : "Player_Ready",
  "data" : {
    "playerid": "", /* unique player id if multiple instances on a page */
    "content_duration": 0, /* video length in seconds */
    "content_dataCreated": "", /* YYYY-MM-DD (e.g. 2018-08-30) */
    "content_dataAired": "", /* YYYY-MM-DD (e.g. 2018-08-30) */
    "content_name": "", /* video title */
    "content_id": "", /* video id */
    "content_type": "", /* clip, vod, live */
    "content_showName": "", /* show name */
    "content_seasonNumber": "", /* season number (e.g. 1, 2, 3, etc.) */
    "content_episodeNumber": "", /* episode number (e.g. 1, 2, 3, etc.) */
    "content_genre": "", /* genre (e.g. drama, comedy, etc.) */
    "content_rating": "", /* rating (e.g. tvy, tvg, tvpg, tvm, etc.) */
    "content_originator": "", /* originator (e.g. warnermedia, sony, disney, etc.) */
    "content_network": "", /* network (e.g. fox, brabo, espn, etc.) */
    "content_mvpd": "", /* mvpd (e.g. comcast, directv, dish, etc.) */
    "content_authorized": "", /* true or false */
    "day_part": "", /* time of day (e.g. morning, daytime, primetime, etc.) */
    "content_feed": "" /* feed (e.g. east-hd, west-hd, east-sd, etc.) */
  }
});
```

>Ad Start

```javascript
window.trackTOPEvent({
  "type" : "video",
  "subtype" : "Ad_Started",
  "data" : {
    "ad_id": "", /* ad identifier */
    "ad_duration": 0, /* ad duration in seconds */
    "ad_type": "" /* ad type (e.g. preroll, midroll, postroll) */
  }
});
```

>Ad Skipped

```javascript
window.trackTOPEvent({
  "type" : "video",
  "subtype" : "Ad_Skipped",
  "data" : {}
});
```

>Ad Completes

```javascript
window.trackTOPEvent({
  "type" : "video",
  "subtype" : "Ad_Finished",
  "data" : {}
});
```

>Media Start

```javascript
window.trackTOPEvent({
  "type" : "video",
  "subtype" : "Media_Started",
  "data" : {}
});
```

>Chapter Starts (Media Start must be called first)

```javascript
window.trackTOPEvent({
  type : "video",
  subtype : "Media_Chapter_Started",
  data : {
    "chapter_name": "", /* chapter name */
    "chapter_position": 0, /* chapter position integer */
    "chapter_duration": 0 /* chapter duration in seconds */
  }
});
```

>Chapter End

```javascript
window.trackTOPEvent({
  type : "video",
  subtype : "Media_Chapter_Finished",
  data : {}
});
```

>Media Buffering Start

```javascript
window.trackTOPEvent({
  "type" : "video",
  "subtype" : "Media_Buffering_Started",
  "data" : {}
});
```

>Media Buffering End

```javascript
window.trackTOPEvent({
  "type" : "video",
  "subtype" : "Media_Buffering_Finished",
  "data" : {}
});
```

>Media Pause

```javascript
window.trackTOPEvent({
  "type" : "video",
  "subtype" : "Media_Paused",
  "data" : {}
});
```

>Media Resume

```javascript
twindow.trackTOPEvent({
  "type" : "video",
  "subtype" : "Media_Resumed",
  "data" : {}
});
```

>Media Finished

```javascript
window.trackTOPEvent({
  type : "video",
  subtype : "Media_Finished",
  data : {}
});
```

>Content Completed and Unloaded (trigger after post roll)

```javascript
window.trackTOPEvent({
  type : "video",
  subtype : "Content_Completed",
  data : {}
});
```

The sample code listed on the right-hand side is all possible video calls.

* Use <i>trackAction</i> array to push your video calls.
* The **Player_Ready** call must be called for every new video including **replay**.
* The **content_duration** and **ad_duration** variables are in second and must contain only **integer** values.
* The **playhead** value should be passed to Ensighten using <code>window.turner_metadata.currentTime = 1;</code>. The *currentTime* variable should be an **integer** value and should display the current playhead position in second.  It should be updated continuously during the playback, so it always has the current playhead value. At the end of the video, the *currentTime* value must match the *content_duration* value.

<aside class="success">
  <strong>Recommended Order of Video Events</strong>
  <br><br>
  This scenario assumes you have a pre-roll and a post-roll.
  <ol type="1">
    <li>Player_Ready</li>
    <li>Ad_Started</li>
    <li>Ad_Skipped / Ad_Finished</li>
    <li>Media_Started</li>
    <li>Media_Finished</li>
    <li>Ad_Started</li>
    <li>Ad_Skipped / Ad_Finished</li>
    <li>Content_Completed</li>
  </ul>
</aside>

# Testing Analytics Calls

The global template has a debugging mode to see all trackAction calls and the data in your browser dev console.

1. Open your browser dev console
2. Run `localStorage.debugActionTracker = "true"`
3. Reload the page to activate the debugging mode
3. All trackAction calls will display in the dev console

**You can also see Adobe Analytics call using network sniffing tools, such as Charles Proxy. The following section shows different types of calls and where to look.**

## Page View Call

Every page load should fire a page view call.  A page view call uses analytics tracking server (turnerinternational.sc.omtrdc.net), and you should always check for the correct report suite ID (**RSID**) and existence of a **pageName** variable.

<aside class="warning">
  <b>pageName</b> variable should be outside of c. and .c parameters.
</aside>

![alt text](images/pageview-call-web.png)

## Interaction Call

The main difference between a page view call and an interaction call is **pev2** variable.  The **pev2** variable is only displaying on interaction calls.

![alt text](images/interaction-call-web.png)

## Video Start or Ad Start Call

On every video and ad start, we are expecting a call to analytics tracking server (turnerinternational.sc.omtrdc.net).  The VHL calls to analytics server display **pe** and **pev3** variables.  The **pe** variable display **ms_s** for content start and **msa_s** for ad start.

![alt text](images/video-start-call-web.png)

## Video Heartbeat Call

Video heartbeat call uses heartbeat tracking server (turnerinternational.hb.omtrdc.net) and normally fires every 10 seconds while you are watching a video.  Because the content/ad start calls to analytics server already contain all standard and context data, you **do not** need to re-check those data in heartbeat calls.  However, there are few variables you should check.

* **s:event:type** - event type should follows <a href="https://marketing.adobe.com/resources/help/en_US/sc/appmeasurement/hbvideo/vod-preroll-ads.html" target="_blank">the Adobe document</a>.
* **s:event:sid** - session ID should stay the same while watching the same video, but replay should generate a new session ID.
* **l:asset:length** - content/ad length should display the correct value in second.
* **l:event:playhead** - playhead value should advance while watching a content.  It will be zero during ads.

![alt text](images/video-heartbeat-call-web.png)

# Helpful Docs

## Commit vs Publish

>Committed Bootstrap:

```javascript
//nexus-test.ensighten.com/turnerintl/example-space/Bootstrap.js
```

>Published Bootstrap:

```javascript
//nexus.ensighten.com/turnerintl/example-space/Bootstrap.js
```

Ensighten offers two different Bootstrap.js domains depending on the status of your tag.

* When a tag is **committed** it is moved to **nexus-test.ensighten.com** domain.
* When a tag is **published** it is moved to **nexus.ensighten.com** domain.

This is helpful for testing. After merging all changes to the production space within Ensighten; commit the tags and use the nexus-test.ensighten.com domain to verify the changes before publishing. Typically, this is done via a local proxy, such as Charles Proxy or using the Ensighten Browser Extension.</p>

## Ensighten Training

It is recommended to go through training videos before using Ensighten.

* Ensighten Training Videos: <a href='https://www.ensighten.com/training/manage-technical/'>https://www.ensighten.com/training/manage-technical/</a></li>
* Ensighten Adobe Training Videos: <a href='https://www.ensighten.com/training/sitecatalyst-implementation-via-manage/'>https://www.ensighten.com/training/sitecatalyst-implementation-via-manage/</a></li>
* Ensighten Recommended Tools: <a href='https://www.ensighten.com/training/tools/'> https://www.ensighten.com/training/tools/</a></li>

## Dev Contact

Any questions – contact <a href="mainto:adaqdev@turner.com">adaqdev@turner.com</a></li> 




