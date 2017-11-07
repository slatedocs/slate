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
