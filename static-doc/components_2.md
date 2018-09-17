## mj-include

The mjml-core package allows you to include external mjml files to build your email template.

```xml
<!-- header.mjml -->
<mj-section>
  <mj-column>
    <mj-text>This is a header</mj-text>
  </mj-column>
</mj-section>
```

You can wrap your external mjml files inside the default `mjml > mj-body`
tags to make it easier to preview outside the main template


```xml
<!-- main.mjml -->
<mjml>
  <mj-body>
    <mj-include path="./header" /> <!-- or 'header.mjml' -->
  </mj-body>
</mjml>
```

The MJML engine will then replace your included files before starting the rendering process

<aside class="notice">
Note that the file must be a file with a `.mjml` extension
</aside>
