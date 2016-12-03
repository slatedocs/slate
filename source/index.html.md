---
title: Bonsai Documentation


toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:

search: true
---

# Bonsai Documentation

Welcome to the sandbox for the future Slate-powered Bonsai documentation site!

<aside class="notice">
This is a temporary landing page.
</aside>

## Draft Sections:

I've set up a draft of the following pages to show off the new format. These are early drafts, and subject to change.

Page | Status | Style
-------------- | -------------- | --------------
[Inkling Guide][1] | First Draft | Modular
[Inkling Reference][2] | First Draft | Modular
[Getting Started with Anaconda][3] | Second Draft | Single page
[CLI Reference][5] | Second Draft | Single Page

## FAQ:

### Where did the **Chapter/Section** numbers go?

These are temporarily removed until the site tree settles down, and will likely be replaced.

### What are Modular pages?

Slate supports the notion of [includes][4], which allow us to put the documentation into a database of sorts and rebuild it from parts. This works by holding the pages in the `includes` folder. A display page is made by adding an `includes` section to the front matter, and then listing the included pages in order.

### What about headers/footers/toc_footers?

These are still being designed.

[1]: /inkling_guide.html "Inkling Guide"
[2]: /inkling_reference.html "Inkling Reference"
[3]: /getting-started-with-anaconda.html "Anaconda CLI instructions"
[5]: /cli_reference.html "CLI Reference"
