<hr>
<section>

# Rich Text

***Note:***  *we are actively adding new rich texts formats to various objects in Asana. __This may break existing apps. New apps should be built using parsers and display logic that is forward compatible with the forthcoming rich text formats__. More details and ongoing updates can be found in __[this post in the developer forum](https://forum.asana.com/t/changes-are-coming-to-rich-text-html-notes-and-html-text-in-asana/113434)__.*


> Example Rich Text

```html
~
<body>All these new tasks are <em>really</em> getting disorganized, so <a data-asana-gid="4168112"/> just made the new <a data-asana-gid="5732985"/> project to help keep them organized. <strong>Everyone</strong> should start using the <a data-asana-gid="6489418" data-asana-project="5732985"/> when adding new tasks there.</body>
```

<span class="description">
The web product offers a number of rich formatting features when writing task notes, comments, project descriptions, and project status updates. These features include bold, italic, underlined, and monospaced text, as well as bulleted and numbered lists. Additionally, users can "@-mention" other users, tasks, projects, and many other objects within Asana to create links.
</span>

The rich text field name for an object is equivalent to it's plain text field name prefixed with `html_`. The following object types in Asana support rich text:

| Object                 | Plain text field | Rich text field    |
|------------------------|------------------|--------------------|
| Tasks                  | `notes`          | `html_notes`       |
| Projects               | `notes`          | `html_notes`       |
| Stories                | `text`           | `html_text`        |
| Project status updates | `text`           | `html_text`        |
| Project briefs         | `text`           | `html_text`        |
| Teams                  | `description`    | `html_description` |

<a id="reading"></a>
## Reading rich text

> Python

```python
!
from lxml import etree

html_text = "<body>...</body>"
root = etree.HTML(html_text)
user_ids = root.xpath('//a[@data-asana-type="user"]/@data-asana-gid')
for user_id in user_ids:
    print(user_id)
```

> Java

```java
!
import com.jcabi.xml.XML;
import com.jcabi.xml.XMLDocument;
import java.util.List;

XML root = new XMLDocument("<body>...</body>");
List<String> userIds = root.xpath("//a[@data-asana-type=\"user\"]/@data-asana-gid");
for (String userId : userIds) {
    System.out.println(userId);
}
```

> JavaScript

```javascript
!
var htmlText = '<body>...</body>'
var parser = new DOMParser()
var doc = parser.parseFromString(htmlText, "text/html")
var iterator = doc.evaluate(
    '//a[@data-asana-type="user"]/@data-asana-gid', doc, null, XPathResult.ORDERED_NODE_ITERATOR_TYPE)
var node = iterator.iterateNext()
while (node) {
    console.log(node.nodeValue);
    node = iterator.iterateNext();
}
```

Rich text in the API is formatted as an HTML fragment, which is wrapped in a root `<body>` tag. Rich text is guaranteed 
to be valid XML; there will always be a root element, all tags will be closed, balanced, and case-sensitive, and all 
attribute values will be quoted. The following is a list of all the tags that are currently returned by the API:

| Tag        | Meaning in Asana   |
|------------|--------------------|
| `<body>`   | None               |
| `<strong>` | Bold text          |
| `<em>`     | Italic text        |
| `<u>`      | Underlined text    |
| `<s>`      | Strikethrough text |
| `<code>`   | Monospaced text    |
| `<ol>`     | Ordered list       |
| `<ul>`     | Unordered list     |
| `<li>`     | List item          |
| `<a>`      | Link               |

In addition, the following tags are supported in the rich text of project briefs:

| Tag                                                        | Meaning in Asana              |
|------------------------------------------------------------|-------------------------------|
| `<h1>`, `<h2>`                                             | Header                        |
| `<hr>`                                                     | Horizontal rule               |
| `<table>`, `<tr>`, `<td>`                                  | Table                         |
| `<img>`                                                    | Inline image                  |
| `<object type="application/vnd.asana.external_media">`     | External media embed (iframe) |
| `<object type="application/vnd.asana.project_milestones">` | List of milestones            |
| `<object type="application/vnd.asana.project_goals">`      | List of goals                 |

**Note:** This list can expand as new features are introduced to the Asana web product. Treat rich text as you would treat arbitrary HTML, and ensure that your code doesn't break when it encounters a tag not on this list.

**Links**

While links are easy to understand when users view the rendered in the Asana web product, an `<a>` tag and its `href` alone are insufficient to programmatically understand what the target of the link is. This is confused further by the fact that the formats of these links are frequently ambiguous. For example, an @-mention to a user generates a link to their "My Tasks", which looks identical to a link to a normal project.

Because of this, the API will return additional attributes in `<a>` tags to convey meaningful information about the target. The following is a complete list of attributes we may return inside an `<a>` tag, in addition to the usual `href`:

| <nobr>Attribute<img width=150/></nobr> | Meaning |
|-------------------------|---------|
| `data-asana-accessible` | Boolean, representing whether or not the linked object is accessible to the current user. If the resource is inaccessible, no other `data-asana-*` attributes will be included in the tag. |
| `data-asana-dynamic`    | Boolean, represents if contents of the `a` tag is the canonical name of the object in Asana. If you want to set custom text that links to an Asana object, set `data-asana-dynamic="false"` when creating the tag. |
| `data-asana-type`       | The type of the referenced object. One of `user`, `task`, `project`, `tag`, `conversation`, `project_status`, `team`, or `search`. |
| `data-asana-gid`        | The GID of the referenced object. If the referenced object is a user, this is the user's GID.  | 
| `data-asana-project`    | If the type of the referenced object is a task, and the link references that task in a particular project, this is the GID of that project. |
| `data-asana-tag`        | If the type of the referenced object is a task, and the link references that task in a particular tag, this is the GID of that tag. |

Here are some examples of how this behavior manifests:

- Suppose a user with a name of "Tim" and a user GID of `"53421"` is @-mentioned. This will create a link to their "My Tasks" which is a project with a GID of `"56789"`
  - The raw link generated in Asana will be `https://app.asana.com/0/56789/list`.
  - The `<a>` tag returned in the API will be `<a href="https://app.asana.com/0/56789/list" data-asana-accessible="true" data-asana-dynamic="true" data-asana-type="user" data-asana-gid="54321">@Tim</a>`.
- Suppose a link to a task with name "Buy milk" and GID `"1234"` being viewed in a project with GID `"5678"` is copied from the address bar and pasted into a comment.
  - The raw link generated in Asana will be `https://app.asana.com/0/5678/1234`.
  - The `<a>` tag returned in the API will be `<a href="https://app.asana.com/0/5678/1234" data-asana-accessible="true" data-asana-dynamic="true" data-asana-type="task" data-asana-gid="1234" data-asana-project="5678">Buy milk</a>`
- Suppose another user @-mentions a project with GID `"5678"` that is private and not visible to you in the web product.
  - The raw link generated in Asana will be `https://app.asana.com/0/5678/list`.
  - The `<a>` tag returned in the API will be `<a href="https://app.asana.com/0/5678/list" data-asana-accessible="false" data-asana-dynamic="true">Private Link</a>`

Here's an example of what a complete rich comment might look like in the API:

`
<body>All these new tasks are <em>really</em> getting disorganized, so <a href="https://app.asana.com/0/4168466/list" data-asana-accessible="true" data-asana-dynamic="true" data-asana-type="user" data-asana-gid="4168112">@Tim Bizzaro</a> just made the new <a href="https://app.asana.com/0/5732985/list" data-asana-accessible="true" data-asana-dynamic="true" data-asana-type="project" data-asana-gid="5732985">Work Requests</a> project to help keep them organized. <strong>Everyone</strong> should start using the <a href="https://app.asana.com/0/5732985/6489418" data-asana-accessible="true" data-asana-dynamic="true" data-asana-type="task" data-asana-gid="6489418" data-asana-project="5732985">Request template</a> when adding new tasks there.</body>
`

**Inline images**

> Reading an inline image

```html
<img
  data-asana-gid="1234"
  src="..."
  data-src-width="..."
  data-src-height="..."
  data-thumbnail-url="..."
  data-thumbnail-width="..."
  data-thumbnail-height="..."
  [data-asana-deleted="true"]
  data-asana-type="attachment"
  alt="title of the image"
  style="...">
```

Rich text can contain inline images. The image is stored as an attachment.

If the attachment has been deleted, the HTML will contain `data-asana-deleted="true"`, and some of the other attributes, such as the URLs, will not be present.

The image URLs expire after a few minutes.

**External media embeds (iframes)**

> Reading an external media embed

```html
<object
  type="application/vnd.asana.external_media"
  data-asana-type="attachment"
  data-asana-gid="1234"
  data="{embeddable-url}"
>
  <a href="{linkable-url}">{linkable-url}</a>
</object>
```

You can embed Figma, Loom, YouTube, etc. within rich text. The effect is similar to an HTML iframe. There is a fixed, predefined list of external media sources that are supported:
Adobe XD, Canva, Figma, InVision, Loom, LucidChart, Miro, Vimeo, Whimsical, and Wistia.

**Milestones and goals**

> Reading milestones

```html
<object
  type="application/vnd.asana.project_milestones"
  data-asana-gid="<gid-of-project>"
  data-asana-type="project">[...]</object>
```

> Reading goals

```html
<object
  type="application/vnd.asana.project_goals"
  data-asana-gid="<gid-of-project>"
  data-asana-type="project">[...]</object>
```

Rich text can contain:

* A list of all milestones in the specified project
* A list of all goals that are supported by the specified project

When reading, the inner HTML of the `<object>` tag will contain a list of the first five milestones/goals, followed by "..." if there are more than five in total. When writing, the inner HTML
is ignored and can be empty.

## Reading defensively

> Custom handling external media `<object>`

```javascript
!
const richText = '<body><object style="display:block" type="application/vnd.asana.external_media" data="https://www.youtube.com/embed/VqnMA3K6-e0"><a href="https://www.youtube.com/embed/VqnMA3K6-e0">https://www.youtube.com/embed/VqnMA3K6-e0</a></object></body>'
const parser = new DOMParser();
const richTextDocument = parser.parseFromString(richText, "text/html");

const objects = richTextDocument.querySelectorAll("object");

for (let i = 0; i < objects.length; i++) {
    replacement = null;

    switch(objects[i].type) {
        case "application/vnd.asana.external_media":
            replacement = richTextDocument.createElement('iframe');
            replacement.width = 420;
            replacement.height = 315;
            replacement.src = objects[i].data;
            break;
        default:
            replacement = richTextDocument.createElement('div');
            replacement.innerHtml = objects[i].innerHTML;
    }

    if (replacement) {
        objects[i].parentElement.replaceChild(replacement, objects[i]);
    }
}

richTextDocument.body.childNodes.forEach (child => {
    document.body.append(child);
});
```

**We are actively adding new rich text formats to various objects in Asana**. An existing app will break if not built 
defensively. Apps should use parsers and display logic that is forward compatible with unknown future rich text formats. 

To do this, Asana provides two mechanisms to parse and display tags that the app doesn't explicitly support:

 * Defaults that render in a WebView
 * Guidelines for how to handle new tags

You can read more about rich text changes in 
[this forum post](https://forum.asana.com/t/new-rich-text-tags-in-html-notes-and-html-text/115442).

### Render rich text in a WebView

You can expect the rich text HTML to render reasonably in a WebView if you apply the following CSS style to the 
wrapping DOM node: `overflow-wrap: break-word; white-space: pre-wrap;`. This won't look exactly like it does in Asana, 
but it will ensure users read it in the same way.

### How to handle new tags (no WebView)

#### An `<object>` with an unhandled type
Render the `<object>` tag as a block and render the contained HTML with the same behavior as if it were not inside an 
`<object>`. We will never send an `<object>` tag nested inside another `<object>` tag.

#### An `<img>`
[Fall back](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/img#attributes) to either the alt text or the src 
link if the image can’t be displayed. Wrap the text with newlines like `\n<alt text>\n` since `<img>` tags are blocks.

#### Empty elements except `<img>` and `<hr>`
Empty tags are described [here](https://developer.mozilla.org/en-US/docs/Glossary/Empty_element). It is ok to omit them. 
Render as a new line if the tag is a block.

#### Other semantic non-terminal tags
Ignore the tag and render whatever is inside. Follow the HTML convention for whether it is a block or not.

<a name="writing"></a>
## Writing rich text

When writing rich text to the API, you must provide similarly structured, valid XML. The text must be wrapped in a `<body>` tag, all tags must be closed, balanced, and match the case of supported tags, and attributes must be quoted. Invalid XML, as well as unsupported tags, will be rejected with a `400 Bad Request` error. Only `<a>` tags support attributes, and any attributes on other tags will be similarly rejected.

**Links**

For `<a>` tags specifically, to make it easier to create @-mentions through the API, we only require that you provide the GID of the object you wish to reference. If you have access to that object, the API will automatically generate the appropriate `href` and other attributes for you. For example, to create a link to a task with GID `"123"`, you can send the tag `<a data-asana-gid="123"/>` which will then be expanded to `<a href="https://app.asana.com/0/0/123/f" data-asana-accessible="true" data-asana-dynamic="true" data-asana-type="task" data-asana-gid="123">Task Name</a>`. You can also generate a link to a task in a specific project or tag by including a `data-asana-project` or `data-asana-tag` attribute in the `<a>` tag. All other attributes, as well as the contents of the tag, are ignored. 

To keep the contents of your tag and make a custom vanity link, include the property `data-asana-dynamic="false"` when setting the contents of the tag. You would send `<a data-asana-gid="123" data-asana-dynamic="false">This is some custom text!</a>` and receive `<a data-asana-accessible="true" data-asana-dynamic="false" data-asana-type="task" data-asana-gid="123">This is some custom text!</a>`

If you do not have access to the referenced object when you try to create a link, the API will not generate an `href` for you, but will instead look for an `href` you provide. This allows you to write back `<a>` tags unmodified even if you do not have access to the resource. If you do not have access to the referenced object and no `href` is provided, your request will be rejected with a `400 Bad Request` error. Similarly, if you provide neither a GID nor a valid `href`, the request will be rejected with the same error.

**Inline images**

> Writing an inline image (after [uploading the attachment](https://developers.asana.com/docs/upload-an-attachment))


```html
<img data-asana-gid="1234">
```

When writing an inline image, you don't need most of the attributes; all you need is the `data-asana-gid`. To write HTML that includes a new inline image:

1. Upload the image as an attachment with a call to [`POST /tasks/{task_gid}/attachments`](https://developers.asana.com/docs/upload-an-attachment).
2. Make a second API call to write the rich text, using the returned GID as the `data-asana-gid` field of the `<img>` tag.

**External media embeds**

> Writing an external media embed

```html
<object
  type="application/vnd.asana.external_media"
  data-asana-gid="1234"
></object>
```

To write rich text that contains a new external media embed:

1. Create URL attachment with a call to [`POST /tasks/{task_gid}/attachments`](https://developers.asana.com/docs/upload-an-attachment), with `{ ..., "resource_subtype": "external", "url": "<your_url>" }`. **Important:** Use the URL that would appear in the browser address bar (e.g. `https://youtube.com/watch?v=...`), NOT the embeddable URL (e.g. `https://youtube.com/embed/...`).
2. Make a second API call to write the rich text, using the returned GID as the `data-asana-gid` field of the `<object>` tag. You don't need the inner HTML and you only need a couple of the `<object>` tag attributes: All that is needed is `<object type="application/vnd.asana.external_media" data-asana-gid="..."></object>`

## Writing defensively

### When processing rich text and sending it back

It’s ok to ignore tags or attributes on tags that are unknown for rendering/processing. It’s very important to send 
everything back (attributes and inner content) to avoid data loss. `<object>` is an exception where it’s ok to not send 
any inner content back (all inner content in `<object>` will be ignored).

### If you plan to write an editor

If the tag and attributes are known, but it contains unknown attributes, it must be treated as unknown.

If a tag is unknown, first determine if the tag is block or inline and render it as a block or inline atomic and 
non-copiable (and non-cut&paste-able) editor node (all inner content is non-editable). This is because we don’t know if 
the unknown node has constraints on inner content or where it can appear. The node must also keep track of all 
attributes and inner content to be serialized back.


<div>
  <div class="docs-developer-satisfaction-content">
      <h4>Was this section helpful? <a class="positiveFeedback-DevSatisfaction" style="cursor:pointer;">Yes </a><a class="negativeFeedback-DevSatisfaction" style="cursor:pointer;">No</a></h4>
  </div>
</div>


</section>
