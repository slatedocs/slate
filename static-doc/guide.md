---
title: API Reference

language_tabs:
  - html : MJML

toc_footers:
  - <a href='https://github.com/mjmlio/mjml'>Fork me on Github</a>
  - <a href='https://github.com/mjmlio/mjml/issues'>Submit an Issue</a>
  - MJML v4.0.2

search: true
---


# MJML Guides

MJML is a markup language designed to reduce the pain of coding a responsive email. Its semantic syntax makes it easy and straightforward and its rich standard components library speeds up your development time and lightens your email codebase. MJML’s open-source engine generates high quality responsive HTML compliant with best practices.

## Overview

MJML rolls up all of what Mailjet has learned about HTML email design over the past few years and abstracts the whole layer of complexity related to responsive email design.

Get your speed and productivity boosted with MJML’s semantic syntax. Say goodbye to endless HTML table nesting or email client specific CSS. Building a responsive email is super easy with tags such as `<mj-section>` and `<mj-column>`.

MJML has been designed with responsiveness in mind. The abstraction it offers guarantee you to always be up-to-date with the industry practices and responsive. Email clients update their specs and requirements regularly, but we geek about that stuff - we’ll stay on top of it so you can spend less time reading up on latest email client updates and more time designing beautiful email.

``` html

<mjml>
  <mj-body>
    <mj-section>
      <mj-column>
        <mj-text>Hi sexy!</mj-text>
      </mj-column>
    </mj-section>
  </mj-body>
</mjml>

```
<p align="center">
  <br />
  <br />
  <br />
  <a href="/try-it-live/intro"><img width="100px" src="https://mjml.io/assets/img/svg/TRYITLIVE.svg" alt="try it live" /></a>
</p>


## mjml

A MJML document starts with a `<mjml>` tag, it can contain only `mj-head` and `mj-body` tags. Both have the same purpose of `head` and `body` in a HTML document.

## mj-head

mj-head contains everything related to the document such as style and meta elements. It supports custom head elements and can be registered through `registerMJHeadElement(<string> name, <function> handler)` api from `mjml-core`, it acts as a pre-render hook.


## mj-body

mj-body contains everything related to the content of your email. It supports custom elements too and can be registered either through `registerMJElement(<MJMLElement> class)` api from `mjml-core` or via a `.mjmlconfig` file. Non-known element from `mjml-core` are simply ignored. Note that `mj-body` should have only one root element due to how React works.


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
