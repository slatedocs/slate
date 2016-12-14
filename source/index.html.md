---
title: Bonsai Documentation


toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:

search: true

layout: home

---

# Bonsai Documentation

Welcome to the sandbox for the future Slate-powered Bonsai documentation site!

<aside class="notice">
This is a temporary landing page.
</aside>

## Draft Sections:

I've set up a draft of the following pages to show off the new format. These are early drafts, and subject to change.

The listed endpoints reflect the site map available at [Coggle](https://coggle.it/diagram/V_RLZO99g4VT4gaT/e87816a3386a4dcf961fcd2df53621233acaf8c1f3c0e2c735189ae0b0d4c90c)

"Classic" style pages reflect the original ordering. "New" style is the concatenated Details/Reference page.

Name collision is almost totally resolved.

| Page     | Status        | Style |
|----------|---------------|-------|
[Getting Started][1] | Second Draft | Modular
[Inkling New][3] | Second Draft | Modular
-- [Overview][11] | Second Draft | Modular
-- [Details][12] | Second Draft | Modular
-- [References][13] | Second Draft | Modular
-- [Miscellany][14] | Second Draft | Modular
Mastermind | Absent | N/A
[References][4] | Second Draft | Modular

# FAQ:

## Where did the **Chapter/Section** numbers go?

These are temporarily removed until the site tree settles down, and ~will likely~ may be replaced. We have not yet worked out the implementation of numbering on re-usable sections.

## What are Modular pages?

Slate supports the notion of [includes][6], which allow us to put the documentation into a database of sorts and rebuild it from parts. This works by holding the pages in the `includes` folder. A display page is made by adding an `includes` section to the front matter, and then listing the included pages in order.

## How do I report issues?

File an issue at https://bonsai.phacility.com and tag Documentation project

## What about headers/footers/toc_footers?

These are still being designed. There's likely to be a full-width header including primary-nav to all sections.

## How do I get back to the beginning?

There's a **Return Home** link in the footer of the table of contents.

[1]: /getting_started.html "Getting Started"
[2]: /inkling_classic.html "Classic Inkling"
[3]: /inkling.html "New Inkling"
[4]: /reference.html "Reference"
[5]: /cli_reference.html "CLI Reference"
[6]: https://github.com/lord/slate/wiki/Using-Includes "Using Includes: Slate Documentation"
[11]: /inkling.html#overview
[12]: /inkling.html#details
[13]: /inkling.html#inkling-reference
[14]: /inkling.html#inkling-miscellany
