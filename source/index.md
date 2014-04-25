---

title: Authoring a DevNet API Reference Manual

languages:

language_tabs:
  - shell: Sample
  
toc_footers:
 - Copyright &copy; 2014 by Cisco Systems, Inc.
 - All Rights Reserved.

---

# Authoring a DevNet API Reference Manual 

DevNet is Cisco's Developer Program aimed a helping developers gain access to Cisco Technology such that they can build cool and exciting products.  Wether a developer is an IT
Professional working inside of a Cisco Customer's IT organization, a System Integrator, or a developer at an Independent Software Developer Program, Cisco DevNet is there to
help make your professional life easier.

Cisco has hundreds of product API's for developers.  We want to make it easy for you to find the API that you need to get your job done but we also want to make it easy
for you to use the API of choice.  To do this, we are providing a standard format for the documentation of API's with Cisco.

This document describes how an engineer or tech writer within Cisco would write an API reference manual for publication on DevNet.  The toolchain that we are using is based upon
Slate, the open source tool from TripIt, which in turn was inspired by the API Reference Manual published by Stripe.  Like many developers, we love the simple, elegant, yet
powerful way that Stripe documented their API.  In particular we loved how within the context of any given API call, you can choose a language and see sample code - we knew that
we were not alone and thus we chose to model our own documentation on this style.

Overtime, we have ideas on how we can update and modify this format to better suit the needs of the developer community and we are already planning those changes.  But for now,
we have this initial version.

# Getting Started with DevNet Slate

## Installing the Prerequsites  

> What Version of Ruby is Installed?

```shell
$ ruby -v

ruby 2.0.0p247 (2013-06-27 revision 41674)

```
> How to install Buldler (Shell Tab)

```shell
$ gem install bundler
```
DevNet Slate can be installed on any system because of Ruby's portability.

1. Make sure that Ruby is installed.
2. Make sure that Bundler is installed.

If you do not have Ruby installed, go to https://www.ruby-lang.org/ and get it.

<aside class="warning">
Ruby Version 1.9.3 or newer is required for Slate, if you have Ruby installed, make sure that it is at least that verion.
</aside>


## Getting Set Up

> Clone the Forked Repository

```shell
$ git clone https://github.com/YOURUSERNAME/DevNetSlate.git
```

> Install the Dependencies

```shell
$ cd DevNetSlate
$ bundle install
```

> Start Your Test Server

```shell
$ bundle exec middleman server
== The Middleman is loading
== The Middleman is standing watch at http://0.0.0.0:4567
== Inspect your site configuration at http://0.0.0.0:4567/__middleman/

```
 1. Login to Github and fork this repository on Github (https://github.com/pnerger/slate)
 2. Clone *your forked repository* (not our original one) to your hard drive with `git clone https://github.com/{YOURUSERNAME}/DevNetSlate.git`
 3. `cd DevNetSlate`
 4. Install all dependencies: `bundle install`
 5. Start the test server: `bundle exec middleman server`

You can now see the docs using your browser at <http://localhost:4567>. And as you edit and save your `source/index.md`, your server should automatically update! Whoa! That was fast!


# How DevNet Slate Works

Cisco's implementation of Slate is an HTML document generator that is written and executed in Ruby.  The software reads a source-file in Github Flavored Markdown (GFM) that is
used to generate an HTML API Reference Manual along with the accompanying Javascript and CSS files.  The Javascript and CSS files are simply included into the HTML that is generated
from the GFM File.

It all sounds simple, but it is a bit more complicated than that.  To get a consistent look and feel to Cisco API documentation, we want the authors of API Reference Manuals to
use the GFM tags in a particular way such that we get a common and consistent look and feel to Cisco API documents.  It is important to achive this cross-product consistency for if a
developer gets trained and used to on Cisco API Reference manual but now needs to use an API from another business unit, we want to leverage their experience and make the
cross training experience simple and pleasant.

## Structure of a DevNet Slate Document

As you look at this document, you will notice that there are a couple of feature.  First, to the left is the Table of Contents area.  Next, in the center is the Body of the
document, and to the Right (in the dark area) are code examples.  Each of these elements have the following charateristics:

### Table of Contents

The TOC panel on the left hand side of the panel is composed of the following elements starting at the top and moving to the bottom:

* The Logo - this is generated from the logo held in the logo.png file held in the source directory.  We want to use this same Cisco Logo for all documents.
* The Table of Contents - DevNet Slate only uses the first two level of headers in the Table of Contents.  By default, on the H1 is normally displayed.  If a user selects a H1 item, the TOC will expand to display the H2 items underneath it.  H3 and below are not displayed.
* The TOC Footer - for this we want Cisco Copyright Information.

### Document Body

The body of the document is found in the center panel and contains the main textual discription of the API.  It uses a number of different elements and features to communicate what the API
actually does and these include:

* Headers - these are titles of document section of which the H1 and H2 will automatically appear in the TOC
* Paragraphs - these are simple paragraphs of text
* Bold Text
* Italicized Text
* Inline Code Text
* Tables
* Bullet Lists
* Number Lists
* Hints - These are Green Highlighted Text
* Warnings - These are Red Highlighted Text
* Notes - These are Blue Highlighted Text
* Links - HTML hyperlinks to external documents

### Code Samples

The key part of the DevNet Slate format for API documentation is that code samples can be viewed alongside of the API call that they illustrate.  Further sample code can be held
simultaneously in several different programming languages (important for SOAP and REST API's).  Because programmers tend to only
work in a single language at a time, the DevNet Slate format accomodates this by having the programming language as a tab on the far right panel.  Thus, the developer is able to
choose a programming language and then use the documentation in that language without being distracted by any other language.

Sample code are anchored to either the H1 or H2 heading that they are inserted under; that is, they are placed under the Heading and will move up or down with the main text body.
Code samples have the following elements that are used to control their placement:

* Language - there is a tab for each language that is supported and specified in the header.  
* Code Annotations - these are highlighted areas that are not code but used to point out a code section.
* Shared Code Samples - it is possible to make code that appears in all of the tabs.
  
# Specifying Your GFM Headers

> GFM Headers for this Document

```markdown
---
title: Authoring a DevNet API Reference Manual
languages:
language_tabs:
  - shell: Sample
  
toc_footers:
 - Copyright &copy; 2014 by Cisco Systems, Inc.
 - All Rights Reserved.
---
```
The source document that is used to generate a DevNet Slate API Reference Manual is a GFM Document.  The GFM document is a plain text document that starts with headers that
set some items about the document and include:

## Setting the Document Title

This is just the name of the document and is a simple text string

## Turning on Language Tabs

There is a _language_tab_ statement for each language that will be on the tab in the Sample Code section of the the document.  The _language_tab_ statement is followed by
one or more lines that contain a statement that contains two blank spaces, a dash, the name of the languge for use in encoding the document, an option ":", followed by an
optional display name for the language.

The name of the language must be recognized by the system such that the display engine will automatically perform syntax highlighting on the code.  The engine supports
lots of different languages but for Cisco documents, these are the standard values that we want to use:

* c++:C++
* c#:C#
* css:CSS
* html:HTML
* json:JSON
* java:Java
* javascript:JavaScript
* markdown:GFM
* objective-c:Objective-C
* perl:Perl
* php: PHP
* puppet:Puppet
* python:Python
* ruby:Ruby
* shell
* xml:XML
* yaml:YAML

<aside class="notice">
Only list the languages that you want to have as tabs in your document.  Each time you list a language as a _language_tab_, DevNet Slate will automatically create the language
tab regardless if that language is used in the document.
</aside>

<aside class="notice">
Please use the language tabs as stated above such that the Tabs are consistent between API's.
</aside>

## Setting the Copyright Statement in the Footers

The footer statement is uses solely for the Cisco Copyright Statement.

<aside class="notice">
Make sure that you put the proper years that the document was created and updated in the copyright statement.  These years should be either a single year or a range of years.  A
range of years are used when the document was first published in one year but was subsequently updated in other years.
</aside>

# Creating a Table of Contents

The Table of Contents (ToC) of a document is automatically generated from the Headers found in your GFM source document.  In GFM, headers are denoted using one or more `#` characters.
For DevNet Slate, only the first two levels of Headers will be written to the Table of Contents.  H1 Headers are found in the basic TOC while the H2 headers will pop up into the
display when the user scrolls down to that area.

# Creating the Body of the API Reference

## Creating Headers

> Headings - Only H1 and H2 are shown in the TOC

```markdown

# The largest heading (an <h1> tag)
## The second largest heading (an <h2> tag)
### The 3rd largest heading (an <h3> tag)

```
Headers are created by using one or more # characters starting in the first line of text within the GFM document. The sample to the right shows GFM that will result in a
level 1, level 2, and level 3 headers.  Only the level 1 and level 2 headers will appear in the Table of Contents.  When you create sample code, it will only anchor
to a level 1 or level 2 header.

<aside class="notice">
Remember that only level 1 and 2 headers will appear in the Table of Contents.
</aside>

## Creating a Paragraphs

For normal text, just type your paragraph on a single line.

    This is some paragraph text. Exciting, no?

Make sure the lines above below your paragraph are empty.

## Creating Formatted Text

> Formating Text in GFM

```markdown
    This text is **bold**, this is *italic*, and this is an

    `
    inline code block in the main section.
    `
    
    You can also use underscores to create __bold__ or _italic_.
    
    Finally, you can combine ***bold and italic***.
    
```

    This text is **bold**, this is *italic*, and this is an

    `inline code block in the main section.`
    
    You can also use underscores to create __bold__ or _italic_.
    
    Finally, you can combine ***bold and italic***.

<aside class="success">
You can use those formatting rules in code annotations, tables, paragraphs, lists, wherever.
</aside>

## Strikethrough

```markdown

Strikethrough ~~SHOULD WORK~~ BUT DOES NOT

A workaround is to use <del>DOES NOT WORK</del>.

```
Although GFM supports the strikethrough text attribute through the use of the double `~` or tilde character it
does not work in DevNet Slate. As a workaround, enclose your strikethrough text in `<del> strikethrough text </del>` tags.

Strikethrough ~~SHOULD WORK~~ BUT DOES NOT

A workaround is to use <del>DOES NOT WORK</del>.

<aside class="warning">
Althought you can use the `~~` to enclose text for strikethrough in GFM, DevNet Slate does not support this
feature.
</aside>


## Creating Markdown Links

> The Three Ways to Create GFM Links

```markdown
Here's an inline link to [Google](http://www.google.com/).
Here's a reference-style link to [Google][1].
Here's a very readable link to [Yahoo!][yahoo].

  [1]: http://www.google.com/
  [yahoo]: http://www.yahoo.com/
```

There are three ways to write links in GFM. Each is easier to read than the last.  The code to the right will generate the following:

Here's an inline link to [Google](http://www.google.com/).
Here's a reference-style link to [Google][1].
Here's a very readable link to [Yahoo!][yahoo].

  [1]: http://www.google.com/
  [yahoo]: http://www.yahoo.com/
  
The link definitions can appear anywhere in the document -- before or after the place where you use them. The link definition names [1] and [yahoo] can be any unique string,
and are case-insensitive; [yahoo] is the same as [YAHOO].

## Using HTML Standard Links

> Using HTML Links in GRM

```html
<a href="http://developer.cisco.com" title="DevNet">Cisco DevNet</a>
```

You can also use standard HTML hyperlink syntax.  The HTML example to the right produces the text below:

<a href="http://developer.cisco.com" title="DevNet">Cisco DevNet</a>


## Inserting an Image

> GFM for Inserting an Image Stored Locally

```markdown
![Valid XHTML](/images/logo.png).
```

![Valid XHTML](/images/logo.png).

<aside class="success">
Images essentially look just like a link except that they start with a '!' .
</aside>

<aside class="notice">
Notice that this image is coming from the local image folder.  We recommend that you place your images inside the image folder within your source directory.
</aside>

## Inserting Horizontal Rules

Sometimes you just need a Horizontal Rule (line) to convey something.  GFM does this with either three or more consecutive Hyphens `-`, Asterisks `*`, or Underscores `_`.


```markdown
Three or more...

---

Hyphens

***

Asterisks

___

Underscores
```
Three or more...

---

Hyphens

***

Asterisks

___

Underscores

## Using HTML in Markdown

```markdown
<dl>
  <dt>Definition list</dt>
  <dd>Is something people use sometimes.</dd>

  <dt>Markdown in HTML</dt>
  <dd>Does *not* work **very** well. Use HTML <em>tags</em>.</dd>
</dl>
```
You can also use raw HTML in your Markdown, and it'll mostly work pretty well.

<dl>
  <dt>Definition list</dt>
  <dd>Is something people use sometimes.</dd>

  <dt>Markdown in HTML</dt>
  <dd>Does *not* work **very** well. Use HTML <em>tags</em>.</dd>
</dl>

<aside class="warning">
Just because you can, doesnot mean that you should.  One of the features of Markdown is that you don't have to worry about the formatting details of HTML.  Also, it provides
a separation of content and format which you loose when you start placing HTML into your Markdown.
</aside>

## Creating a Table

> GFM for Creating a Table

```markdown
Table Header 1 | Table Header 2 | Table Header 3
-------------- | -------------: | :------------:
Row 1 col 1 | Row 1 col 2 | Row 1 col 3
Row 2 col 1 | Row 2 col 2 | Row 2 col 3
```

Slate uses PHP Markdown Extra style tables.  The example to the right will create the table below.


Table Header 1 | Table Header 2 | Table Header 3
-------------- | -------------: | :------------:
Row 1 col 1 | Row 1 col 2 | Row 1 col 3
Row 2 col 1 | Row 2 col 2 | Row 2 col 3

Notice the colons in the line underneath the header line.  These are used align that columns of the table. A no colon or only a colon to the left
will cause the column to align to the left.  A colon to the right will cause the column to align right.  And a colon to the left and the right
will cause the column to center.

<aside class="notice"> Note that the pipes do not need to line up with each other on each line.</aside>

<aside class="success"> If you don't like that syntax, feel free to use normal html \<table\>`s directly in your markdown.</aside>


## Creating Numbered Lists

> GFM for Numbered Lists

```markdown
1. This
2. Is
  3. Nested
  6. Number
  1. List
3. An
8. Ordered
9. List
```

Numbered lists are created using the GFM markdown code to the right.  You can create nested lists, but the bullets are indented by two spaces.  The
sample code to the right will create the list below:

1. This
2. Is
  3. Nested
  6. Number
  1. List
3. An
8. Ordered
9. List

<aside class="notice"> Notice that the order of the numbers do not make a difference.  It is just that a number is used that makes an ordered list. </aside>

<aside class="notice"> Note that by indenting by two characters, you are creating an indented list and the numbering restarts and when you go back, the
numbering resumes.</aside>

## Creating Bulleted Lists

> GFM for created bullet lists

```markdown
- This
+ Is
  * nested
  - bullet
* A
* Bullet
* List
```

Numbered lists are created using the GFM markdown code to the right.  you can create nested lists, but the bullets are indented by two spaces.  The sample code
to the right will create the list below:

- This
+ Is
* A
  * nested
  - bullet
* Bullet
* List


<aside class="notice"> Notice that bullet lists can be created using a -, a +, or an *. </aside>

<aside class="notice"> Note that by indenting by two characters, you are creating an indented list.</aside>

## Creating Special Notes and Warnings

> GFM for creating Notes and Warnings

```html
<aside class="notice"> This is a sample note. </aside>
    
<aside class="warning"> This is a sample warning.</aside>

<aside class="success"> This is a sample hint.</aside>
```

You can add little highlighted warnings and notes with just a little HTML embedded in your markdown document.  The sample to the right shows the three forms.  Below you will
see how they manifest themselves in the document.

<aside class="notice"> This is a sample note. </aside>
    
<aside class="warning"> This is a sample warning.</aside>

<aside class="success"> This is a sample hint.</aside>

Use `class="notice"` for blue notes, `class="warning"` for red warnings, and `class="success"` for green notes.

# Sample Code

> Sample GFM to Denote Sample Code

```markdown
    ```python
    // this is some python code
    ```
    ```ruby
    # this is some ruby code
    ```
```

Code samples are an important way of communicating how to use an API.  DevNet Slate does an excellent job of handling code samples in multiple languages simultaneously through the
use of the tabbed sample code panel on the right hand side.

## Inserting a Sample Code into a Particular Tab

You denote a code samples by using three left-single-quote marks followed by the name of the language.  The name of the languae is used to place the code sample into the proper tab.
Each code samples will appear in the dark area to the right of the main text. Code samples need to appear right under the Level 1 or Level 2 headers in your markdown file to
allow them to be anchored properly.

The "language tabs" are the tabs that appear in the upper right of DevNet Slate Documents. Users browsing the docs use them to select their programming language of choice.

In the sample GFM code to the right, the Ruby code will appear in the Ruby tab, while the Python code will appear in the Python tab. Because the DevNet Slate engine understands the
syntax of most computer programming languages, the sample code will have its language syntax hightlighted automatically in a way that would make sense to the developer.

But just because a language is used as sample code within a DevNet Slate document it does not mean that the tab will appear.  You tell the system which Language tabs you want to
display by editing the `language-tabs` list at the top of your GFM source document.

<aside class="success"> Sometimes it is useful to share code between multiple tabs, you can do this by placing tagging the sample code using a language that is not used as a
tab name.  For example if you tag sample code as `all` and `all` is not listed in the `language-tabs` then that sample code will appear in all of the tabs.</aside>

## Creating Code Sample Annotations

> Code Sample Annotations

```markdown
> This is a Code Annotation!
```
It is sometimes useful to highlight or annoate a part of the sample code.  This is done with code annotations.  By placing a > as the first character in your GFM line of text,
you will create a code annotation that will appear in the area to the right, next to the code samples.

<aside class="warning"> Make sure that you have a blank line after your Code Annoation.  If you do not, the annoation will continue until there is a blank line.
</aside>

# Creating your DevNet Slate Document

## Previewing your Docs

> Command to Start Your Preview Server

```shell
bundle exec middleman server
```

>Output:

```shell
  == The Middleman is loading
  == The Middleman is standing watch at http://0.0.0.0:4567
  == Inspect your site configuration at http://0.0.0.0:4567/__middleman/
```

It is pretty easy to preview your docs using your browser.

Start the test server using the command to the right.

You can now see the docs using your browser by going to the URL at <http://localhost:4567>. As you edit and save your source GFM document at `source/index.md`,
your server should automatically update the document that you are previewing.


## Publishing Your Docs to DevNet

> Command to create your HTML Files

```shell
rake build
```
> Output:

```shell
cd DevNetSlate
bundle exec middleman build --clean
      create  build/images/logo.png
      create  build/images/Untitled.png
      create  build/fonts/icomoon.svg
      create  build/fonts/icomoon.woff
      create  build/fonts/icomoon.ttf
      create  build/fonts/icomoon.eot
      create  build/javascripts/lang_selector.js
      create  build/javascripts/all.js
      create  build/javascripts/jquery_ui.js
      create  build/javascripts/jquery.tocify.js
      create  build/stylesheets/variables.css
      create  build/stylesheets/icon-font.css
      create  build/stylesheets/normalize.css
      create  build/stylesheets/syntax.css
      create  build/stylesheets/screen.css
      create  build/stylesheets/print.css
      create  build/index.html
cd -

```
The `rake build`. Middleman will build your website to the `build` directory of your project.  You then need to share those static HTML files with the DevNet team
for publishing.  You can do this via Box.net or Dropbox.

    
# Elements of Style for Cisco APIs'

Now that you understand the mechanics of DevNet Slate.  Now we need to get into the specifics of how to use these tools to present a common, consistent, and great
developer experience on DevNet for your API.

Before we get into the specifics, let's deal with the high-level guidelines or ground rules:

* _Keep it Simple_ - how you use English to communicate to developers is important.  One of the ways you can simplify things is to use person pronouns (e.g., you, we, us) as this approach will naturally simplify your English.
* _Tell Them How Not What_ - It's possible to simply list all of your API calls, but this does not help the developer.  Instead, group your API end points into what they are used for.  For example, have headings that say "Starting a New Discovery Job" rather than "The Post Discovery Method".
* _Use Examples_ - this format is designed around code samples; use it!  Try to create an example for each of your API calls.
* _Test the Examples_ - when you use an example, make sure that it works.
* _Use Graphics_ - a picture is worth a thousand words.  The right graphic in the right place helps you to keep things simple.

