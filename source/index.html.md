---
title: Mux API Docs

language_tabs:
  - javascript

toc_footers:
  - <a href='http://app.mux.io'>Sign Up for Mux</a>
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

search: true
---

# Introduction

Something

# Mux Integration

## Video.js plugin

> Put this in the document &lt;head&gt;

```javascript
<script>
  window.mux=window.mux||function(){(mux.q=mux.q||[]).push([arguments,1*new Date()]);};
  mux('set', 'property_key', 'EXAMPLE-PROPERTY-KEY');
  mux('send', 'pageloadstart');
</script>
<script async src='//src.litix.io/core/1/mux.js'></script>
```
> Put this lower in the page, after Video.js is loaded

```javascript
<script src='//your.videojs.path/video.js'></script>
<script src="//src.litix.io/videojs/1/videojs-mux.js"></script>
```

Some text!

## Initialize

> Either do this

```javascript
videojs('my-cool-player', { plugins: {
    mux: {}
  }
});
```

> Or this

```javascript
<video id="my-cool-player" ... data-setup='{"plugins": {"mux": {}}}'>...</video>
```

> Or this

```javascript
var player = videojs('my-cool-player');
// Just in case something went wrong getting the plugin, make sure it's there first.
if (typeof player.mux !== 'undefined') {
  player.mux({});
}
```

More text!

## Changing the video

```javascript
var myPlayer = videojs('my-cool-player');

myPlayer.mux.setVideo({
  video_id: 'abcd123',
  video_title: 'Really Great Video',
  video_series: 'Weekly Great Videos'
});

////
// Code that changes the player source is here
////
```

When you change to a new video (in the same player) you need to update the video data using the setVideo function. Some examples of when this happens are:

* The player advances to the next video in a playlist
* The user selects a different video to play

<aside class="notice">This does not include changing the source to a new resolution or rendition of the same video.</aside>

It's best to do this immediately before telling the player which new source to play, so that no events are lost.

When setVideo is called it removes all previous video data and resets all metrics for the video view.

# API Parameters

## General Options

```javascript
videojs('my-cool-player', {
  plugins: {
    mux: {
      debug: false
    }
  }
});
```

Option Name	| Description	| Default
----------- | ----------- | --------
debug	| Put the plugin in debug mode to log operational details	| false
heart_beat_interval	| How often to send heartbeats (in ms) | 10000
check_buffering_interval | How often to check whether or not the player is buffering (in ms) | 100

## Video Metadata Options

```javascript
videojs('my-cool-player', {
  plugins: {
    mux: {
      debug: false,
      video_data: {
        video_title: 'My Great Video'
      }
    }
  }
});
```

Video data can be set to provide more information about the video that's being played. It can be set in the mux plugin options, or with the player.mux.setVideo() function after the plugin has been initialized.

When you change the video title that a player is playing you will also need to use player.mux.setVideo() to update the video details. This does not include when you change to a different source (e.g. a different resolution) of the same title.

Name | Description
---- | -----------
video_id | Your internal ID for the video
video_title | Video Title, ex: "Awesome Show Episode 1"
video_series | Video Series, ex: "Season 1"
video_variant_name | Video Variant, ex: "French Hard Subs"
video_variant_id | Video Variant ID, ex: "abcd1234abcd"
video_language | The language of the video
video_content_type | "short", "movie", "episode", "clip", "trailer", or "event"
video_duration | The length of the video. (Can also be determined from the player.)
video_stream_type | "live" or "on-demand"
video_producer | The producer of the video title
video_encoding_variant | Which encoding profile is being used, when testing multiple.

## Player Options

```javascript
videojs('my-cool-player', {
  plugins: {
    mux: {
      debug: false,
      player_data: {
        player_name: 'My Main Player',
      }
    }
  }
});
```

Player data can be set to provide additional information about the player. It does not change between videos.

Name	| Description
----- | -----------
player_name | Player Name, ex: "My Site Main Player"
player_version | Player Version, ex: "2.0.0"
ad_config_variant | Which version of the ad configuration is being used
