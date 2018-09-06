# Using MJML in JSON

MJML can not only be used as a markup, but also as a JSON object, which can be very useful for 
programmatic manipulation or with the MJML API.

With the JSON format, a MJML component is defined as an `object` with the following properties:

* a `tagName` as a `string`
* a list of attributes as an `object`
* either a `content` as a `string` or a list of `children` tags as an `array`.

Exactly like using MJML as a markup, the JSON definition can be passed as an object to the `mjml2html` function.
Here is working example:

```javascript
var mjml2html = require('mjml')

console.log(mjml2html({
    tagName: 'mjml',
    attributes: {},
    children: [{
        tagName: 'mj-body',
        attributes: {},
        children: [{
            tagName: 'mj-section',
            attributes: {},
            children: [{
                tagName: 'mj-column',
                attributes: {},
                children: [{
                    tagName: 'mj-image',
                    attributes: {
                        'width': '100px',
                        'src': '/assets/img/logo-small.png'
                    }
                },
                {
                    tagName: 'mj-divider',
                    attributes: {
                        'border-color' : '#F46E43'
                    }
                }, 
                {
                    tagName: 'mj-text',
                    attributes: {
                        'font-size': '20px',
                        'color': '#F45E43',
                        'font-family': 'Helvetica'
                    },
                    content: 'Hello World'
                }]
            }]
        }]
    }]
}))
```
