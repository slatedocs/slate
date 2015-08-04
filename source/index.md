---

title: Authoring a DevNet API Reference Manual

languages:

language_tabs:
  - shell: Sample
  
toc_footers:
 - V1.0.0
 - Copyright &copy; 2014 by Cisco Systems, Inc.
 - All Rights Reserved.

search: true
---

# Authoring a DevNet API Reference Manual 

DevNet is Cisco's Developer Program aimed a helping developers gain access to Cisco Technology such that they can build cool and exciting products.  Wether a developer is an IT Professional working inside of a Cisco Customer's IT organization, a System Integrator, or a developer at an Independent Software Developer Program, Cisco DevNet is there to help make your professional life easier.

Cisco has hundreds of product API's for developers.  We want to make it easy for you to find the API that you need to get your job done but we also want to make it easy
for you to use the API of choice.  To do this, we are providing a standard format for the documentation of API's with Cisco.

This document describes how an engineer or tech writer within Cisco would write an API reference manual for publication on DevNet.  The toolchain that we are using is based upon Slate, the open source tool from TripIt, which in turn was inspired by the API Reference Manual published by Stripe.  Like many developers, we love the simple, elegant, yet powerful way that Stripe documented their API.  In particular we loved how within the context of any given API call, you can choose a language and see sample code - we knew that we were not alone and thus we chose to model our own documentation on this style.

Overtime, we have ideas on how we can update and modify this format to better suit the needs of the developer community and we are already planning those changes.  But for now, we have this initial version.

# Getting Started with DevNet Slate

## Installing the Prerequisites  

> What Version of Ruby is Installed?

```md
$ ruby -v

ruby 2.0.0p247 (2013-06-27 revision 41674)

```
> How to install Bundler (Shell Tab)

<<<<<<< HEAD
```md
$ gem install bundler
```
DevNet Slate can be installed on any system because of Ruby's portability.

1. Make sure that Ruby is installed.
2. Make sure that Bundler is installed.

If you do not have Ruby installed, go to https://www.ruby-lang.org/ and get it.

<aside class="warning">
Ruby Version 1.9.3 or newer is required for Slate, if you have Ruby installed, make sure that it is at least that version.
</aside>

## Setup Options

There are two ways that you can setup DevNet Slate for creating documents on your local PC; Forking/cloning from DevNet Slate Github or downloading the DevNet Slate Zip file from Github.  Each has pros and cons:

### Fork and Clone 

When you Fork DevNet Slate on Github, Github remembers the relationship between your version of DevNet Slate and the master version.  Thus, when changes are made to DevNet Slate in the master tree, you will be able to pull these changes and include the latest fixes and changes into your personal copy of DevNet Slate.  Additionally, when you __publish__ your document, the document will be placed into Github.

<aside class="notice">
DevNet Slate supports either building or publishing.  When you build the document, only your local files are updated.  When you publish, the files on Github are also updated.
</aside>

### Installing the Zip

When you download the Zip file and install DevNet Slate, like the Fork and Clone, it will create a local directory, but you are not notified of changes.  Also, when you build your HTML document, you will not be able to publish it to Github if that is what you desire.

## Getting Set Up

> Clone the Forked Repository

```md
$ git clone https://github.com/YOURUSERNAME/DevNetSlate.git
=======
```python
import kittn

api = kittn.authorize('meowmeowmeow')
>>>>>>> tripit/master
```

> Install the Dependencies

```md
$ cd DevNetSlate
$ bundle install
```

> Start Your Test Server

```md
$ bundle exec middleman server
== The Middleman is loading
== The Middleman is standing watch at http://0.0.0.0:4567
== Inspect your site configuration at http://0.0.0.0:4567/__middleman/

```

 1. Login to Github and fork this repository on Github (https://github.com/pnerger/DevNetSlate)
 2. Clone *your forked repository* (not our original one) to your hard drive with `git clone https://github.com/{YOURUSERNAME}/DevNetSlate.git`
 3. `cd DevNetSlate`
 4. Install all dependencies: `bundle install`
 5. Start the test server: `bundle exec middleman server`
 
 ___OR___

 1. Login to Github and download the DevNet Slate Zip file (https://github.com/pnerger/DevNetSlate)
 2. unzip the zip file into the directory that you want to work in.
 3. cd to that directory.
 4. Install all dependencies: `bundle install`
 5. Start the test server: `bundle exec middleman server`

You can now see the docs using your browser at <http://localhost:4567>. And as you edit and save your `source/index.md`, your server should automatically update! Whoa! That was fast!


# How DevNet Slate Works

Cisco's implementation of Slate is an HTML document generator that is written and executed in Ruby.  The software reads a source-file in Github Flavored Markdown (GFM) that is used to generate an HTML API Reference Manual along with the accompanying Javascript and CSS files.  The Javascript and CSS files are simply included into the HTML that is generated from the GFM File.

It all sounds simple, but it is a bit more complicated than that.  To get a consistent look and feel to Cisco API documentation, we want the authors of API Reference Manuals to use the GFM tags in a particular way such that we get a common and consistent look and feel to Cisco API documents.  It is important to achieve this cross-product consistency for if a developer gets trained and used to on Cisco API Reference manual but now needs to use an API from another business unit, we want to leverage their experience and make the cross training experience simple and pleasant.

## Structure of a DevNet Slate Document

As you look at this document, you will notice that there are a couple of feature.  First, to the left is the Table of Contents area.  Next, in the center is the Body of the document, and to the Right (in the dark area) are code examples.  Each of these elements have the following characteristics:

### Table of Contents

The TOC panel on the left hand side of the panel is composed of the following elements starting at the top and moving to the bottom:

* The Logo - this is generated from the logo held in the logo.png file held in the source directory.  We want to use this same Cisco Logo for all documents.
* The Table of Contents - DevNet Slate only uses the first three level of headers in the Table of Contents.  By default, on the H1 is normally displayed.  If a user selects a H1 item, the TOC will expand to display the H2 items underneath it.  If the user selects a H2 item, the TOC will expand to display the H3 items underneath it.  Headers from 4 and below are not displayed.
* The TOC Footer - for this we want Cisco Copyright Information.

### Document Body

The body of the document is found in the center panel and contains the main textual description of the API.  It uses a number of different elements and features to communicate what the API actually does and these include:

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

The key part of the DevNet Slate format for API documentation is that code samples can be viewed alongside of the API call that they illustrate.  Further sample code can be held simultaneously in several different programming languages (important for SOAP and REST API's).  Because programmers tend to only work in a single language at a time, the DevNet Slate format accommodates this by having the programming language as a tab on the far right panel.  Thus, the developer is able to choose a programming language and then use the documentation in that language without being distracted by any other language.

Sample code is anchored to either the H1 or H2 heading that they are inserted under; that is, they are placed under the Heading and will move up or down with the main text body. Code samples have the following elements that are used to control their placement:

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
 - V1.1.3
 - Copyright &copy; 2014 by Cisco Systems, Inc.
 - All Rights Reserved.
 
search: true
---
```
The source document that is used to generate a DevNet Slate API Reference Manual is a GFM Document.  The GFM document is a plain text document that starts with headers that set some items about the document and include:

## Setting the Document Title

This is just the name of the document and is a simple text string

## Turning on Language Tabs

There is a _language_tab_ statement for each language that will be on the tab in the Sample Code section of the the document.  The _language_tab_ statement is followed by
one or more lines that contain a statement that contains two blank spaces, a dash, the name of the language for use in encoding the document, an option ":", followed by an optional display name for the language.

The name of the language must be recognized by the system such that the display engine will automatically perform syntax highlighting on the code.  The engine supports lots of different languages but for Cisco documents, these are the standard values that we want to use:

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
<<<<<<< HEAD
Please use the language tabs as stated above such that the Tabs are consistent between API's.
=======
You must replace <code>meowmeowmeow</code> with your personal API key.
>>>>>>> tripit/master
</aside>

## The Footer Statement

The footer statement is used to place text and links at the bottom of the Table of Contents.  For DevNet, we've decided to use this for two important meta-data elements about your document; version number and copyright statement.

### The Document Version Number

The first item that we want you to put into the footer is the document version number.  For an API Reference Manual, this will typically correspond to the version number of the API.  It should be a string such as:

`- V1.3.2.a` 

which would render as:

V1.3.2.a

### The Document Copyright Statement

The second item to be placed into the footer statement is the Cisco Copyright Statement.  This works best if it is on two lines.  The first line to claim the copyright and the second line to state what rights are being claimed. A typical statement might be as follows:

`- Copyright &copy; 2014 by Cisco Systems, Inc.`

`- All Rights Reserved.` 

which would render as:

Copyright &copy; 2014 by Cisco Systems, Inc.

All Rights Reserved.

<aside class="notice">
Make sure that you put the proper years that the document was created and updated in the copyright statement.  These years should be either a single year or a range of years.  A range of years are used when the document was first published in one year but was subsequently updated in other years.
</aside>

## Turning on Document Search

DevNet Slate has the option of providing readers with a local search.  When you insert the line `search: true` into your header, the search option becomes enabled and a search box will appear in the Table of Contents right below the logo.

When a user types in text into the search box, the Table of Contents is automatically filtered to remove sections that do not contain the search term.  Text that matches the search term will be highlighted with a yellow background.

# Creating a Table of Contents

The Table of Contents (ToC) of a document is automatically generated from the Headers found in your GFM source document.  In GFM, headers are denoted using one or more `#` characters. For DevNet Slate, only the first two levels of Headers will be written to the Table of Contents.  H1 Headers are found in the basic TOC while the H2 headers will pop up into the display when the user scrolls down to that area.

# Creating the Body of the API Reference

## Creating Headers

Headers are created by using one or more # characters starting in the first line of text within the GFM document. The sample to the right shows GFM that will result in a level 1, level 2, and level 3 headers.  Only the level 1 and level 2 headers will appear in the Table of Contents.  When you create sample code, it will anchor to a header.

On the right are a list of headers in markdown and below is how they will appear in the document:
######

> Headings - Only H1 and H2 are shown in the TOC

```markdown

# H1 Header
## H2 Header
### H3 Header
#### H4 Header
#### H5 Header
#### H6 Header

```

<<<<<<< HEAD
# H1 Header
## H2 Header
### H3 Header
#### H4 Header
#### H5 Header
#### H6 Header

<aside class="notice">
Remember that only level 1, 2, and 3 headers will appear in the Table of Contents.
</aside>

## Creating a Paragraphs

For normal text, just type your paragraph on a single line.

    This is some paragraph text. Exciting, no?

Make sure the lines above below your paragraph are empty.

## Creating Formatted Text

> Formatting Text in GFM

```markdown
    This text is **bold**, this is *italic*, and this is an

    `
    Inline code block in the main section.
    `
    
    You can also use underscores to create __bold__ or _italic_.
    
    Finally, you can combine ***bold and italic***.
    
=======
```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get()
>>>>>>> tripit/master
```

    This text is **bold**, this is *italic*, and this is an

    `Inline code block in the main section.`
    
    You can also use underscores to create __bold__ or _italic_.
    
    Finally, you can combine ***bold and italic***.

<aside class="success">
You can use those formatting rules in code annotations, tables, paragraphs, lists, wherever.
</aside>

## Strikethrough

```markdown

Strikethrough allows you to show text that is ~~no longer relevant by using strikethrough~~


```

You can format text with a strikethrough by enclosing the text in double tildes, `~~`.  The example to the right becomes:

Strikethrough allows you to show text that is ~~no longer relevant by using strikethrough~~


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
  
The link definitions can appear anywhere in the document -- before or after the place where you use them. The link definition names [1] and [yahoo] can be any unique string, and are case-insensitive; [yahoo] is the same as [YAHOO].

## Using HTML Standard Links

> Using HTML Links in GRM

```html
<a href="http://developer.cisco.com" title="DevNet">Cisco DevNet</a>
```

You can also use standard HTML hyperlink syntax.  The HTML example to the right produces the text below:

<<<<<<< HEAD
<a href="http://developer.cisco.com" title="DevNet">Cisco DevNet</a>
=======
`GET http://example.com/api/kittens`
>>>>>>> tripit/master


## Inserting an Image

> GFM for Inserting an Image Stored Locally

```markdown
![Cisco Logo](/images/logo.png).
```

![Cisco Logo](/images/logo.png).

The Markdown to the right shows how an image can be inserted, in this case, it is the Cisco Logo that is right above this.  The text inside the square brackets, `[Cisco Logo]` will become the alt text for the image in the HTML `alt=` parameter.

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
Just because you can, doesn't mean that you should.  One of the features of Markdown is that you don't have to worry about the formatting details of HTML.  Also, it provides
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

Notice the colons in the line underneath the header line.  These are used align that columns of the table. A no colon or only a colon to the left will cause the column to align to the left.  A colon to the right will cause the column to align right.  And a colon to the left and the right will cause the column to center.

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

Numbered lists are created using the GFM markdown code to the right.  You can create nested lists, but the bullets are indented by two spaces.  The sample code to the right will create the list below:

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


<aside class="notice"> Notice that bullet lists can be created using a -, a +, or an \*. </aside>

<aside class="notice"> Note that by indenting by two characters, you are creating an indented list.</aside>

## Creating Special Notes and Warnings

> GFM for creating Notes and Warnings

```html
<aside class="notice"> This is a sample note. </aside>
    
<aside class="warning"> This is a sample warning.</aside>

<aside class="success"> This is a sample hint.</aside>
```

You can add little highlighted warnings and notes with just a little HTML embedded in your markdown document.  To the right, are three different examples of highlights using markdown.  Below you will see how each of the three examples will manifest themselves in the final document.

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

Code samples are an important way of communicating how to use an API.  DevNet Slate does an excellent job of handling code samples in multiple languages simultaneously through the use of the tabbed sample code panel on the right hand side.

## Inserting Large Code Samples

> Large Python Program

```python
<<<<<<< HEAD

import collections
import itertools
import re
import sys
import warnings
from bs4.dammit import EntitySubstitution
try:
    next
except NameError:
    from bs4._compatibility import next_function as next


DEFAULT_OUTPUT_ENCODING = "utf-8"
PY3K = (sys.version_info[0] > 2)

whitespace_re = re.compile("\s+")

def _alias(attr):
    """Alias one attribute name to another for backward compatibility"""
    def _get_alias(self):
        return getattr(self, attr)

    def _set_alias(self):
        return setattr(self, attr)

    alias = property(_get_alias, _set_alias)
    return alias


class NamespacedAttribute(unicode):

    def __new__(cls, prefix, name, namespace=None):
        if name is None:
            obj = unicode.__new__(cls, prefix)
        else:
            obj = unicode.__new__(cls, prefix + ":" + name)
        obj.prefix = prefix
        obj.name = name
        obj.namespace = namespace
        return obj


class PageElement(object):
    """Contains the navigational information for some part of the page
    (either a tag or a piece of text)"""

    # There are five possible values for the "formatter" argument passed in
    # to methods like encode() and prettify():
    #
    # "html" - All Unicode characters with corresponding HTML entities
    #   are converted to those entities on output.
    # "minimal" - Bare ampersands and angle brackets are converted to
    #   XML entities: &amp; &lt; &gt;
    # None - The null formatter. Unicode characters are never
    #   converted to entities.  This is not recommended, but it's
    #   faster than "minimal".
    # A function - This function will be called on every string that
    #  needs to undergo entity substition
    FORMATTERS = {
        "html" : EntitySubstitution.substitute_html,
        "minimal" : EntitySubstitution.substitute_xml,
        None : None
        }

    def setup(self, parent=None, previous_element=None):
        """Sets up the initial relations between this element and
        other elements."""
        self.parent = parent
        self.previous_element = previous_element
        self.next_element = None
        self.previous_sibling = None
        self.next_sibling = None
        if self.parent is not None and self.parent.contents:
            self.previous_sibling = self.parent.contents[-1]
            self.previous_sibling.next_sibling = self

    nextSibling = _alias("next_sibling")  # BS3
    previousSibling = _alias("previous_sibling")  # BS3

    def replace_with(self, replace_with):
        if replace_with is self:
            return
        if replace_with is self.parent:
            raise ValueError("Cannot replace a Tag with its parent.")
        old_parent = self.parent
        my_index = self.parent.index(self)
        if (hasattr(replace_with, 'parent')
            and replace_with.parent is self.parent):
            # We're replacing this element with one of its siblings.
            if self.parent.index(replace_with) < my_index:
                # Furthermore, it comes before this element. That
                # means that when we extract it, the index of this
                # element will change.
                my_index -= 1
        self.extract()
        old_parent.insert(my_index, replace_with)
        return self
    replaceWith = replace_with  # BS3

    def replace_with_children(self):
        my_parent = self.parent
        my_index = self.parent.index(self)
        self.extract()
        for child in reversed(self.contents[:]):
            my_parent.insert(my_index, child)
        return self
    replaceWithChildren = replace_with_children  # BS3

    def extract(self):
        """Destructively rips this element out of the tree."""
        if self.parent is not None:
            del self.parent.contents[self.parent.index(self)]

        #Find the two elements that would be next to each other if
        #this element (and any children) hadn't been parsed. Connect
        #the two.
        last_child = self._last_descendant()
        next_element = last_child.next_element

        if self.previous_element is not None:
            self.previous_element.next_element = next_element
        if next_element is not None:
            next_element.previous_element = self.previous_element
        self.previous_element = None
        last_child.next_element = None

        self.parent = None
        if self.previous_sibling is not None:
            self.previous_sibling.next_sibling = self.next_sibling
        if self.next_sibling is not None:
            self.next_sibling.previous_sibling = self.previous_sibling
        self.previous_sibling = self.next_sibling = None
        return self

    def _last_descendant(self):
        "Finds the last element beneath this object to be parsed."
        last_child = self
        while hasattr(last_child, 'contents') and last_child.contents:
            last_child = last_child.contents[-1]
        return last_child
    # BS3: Not part of the API!
    _lastRecursiveChild = _last_descendant

    def insert(self, position, new_child):
        if new_child is self:
            raise ValueError("Cannot insert a tag into itself.")
        if (isinstance(new_child, basestring)
            and not isinstance(new_child, NavigableString)):
            new_child = NavigableString(new_child)

        position = min(position, len(self.contents))
        if hasattr(new_child, 'parent') and new_child.parent is not None:
            # We're 'inserting' an element that's already one
            # of this object's children.
            if new_child.parent is self:
                if self.index(new_child) > position:
                    # Furthermore we're moving it further down the
                    # list of this object's children. That means that
                    # when we extract this element, our target index
                    # will jump down one.
                    position -= 1
            new_child.extract()

        new_child.parent = self
        previous_child = None
        if position == 0:
            new_child.previous_sibling = None
            new_child.previous_element = self
        else:
            previous_child = self.contents[position - 1]
            new_child.previous_sibling = previous_child
            new_child.previous_sibling.next_sibling = new_child
            new_child.previous_element = previous_child._last_descendant()
        if new_child.previous_element is not None:
            new_child.previous_element.next_element = new_child

        new_childs_last_element = new_child._last_descendant()

        if position >= len(self.contents):
            new_child.next_sibling = None

            parent = self
            parents_next_sibling = None
            while parents_next_sibling is None and parent is not None:
                parents_next_sibling = parent.next_sibling
                parent = parent.parent
                if parents_next_sibling is not None:
                    # We found the element that comes next in the document.
                    break
            if parents_next_sibling is not None:
                new_childs_last_element.next_element = parents_next_sibling
            else:
                # The last element of this tag is the last element in
                # the document.
                new_childs_last_element.next_element = None
        else:
            next_child = self.contents[position]
            new_child.next_sibling = next_child
            if new_child.next_sibling is not None:
                new_child.next_sibling.previous_sibling = new_child
            new_childs_last_element.next_element = next_child

        if new_childs_last_element.next_element is not None:
            new_childs_last_element.next_element.previous_element = new_childs_last_element
        self.contents.insert(position, new_child)

    def append(self, tag):
        """Appends the given tag to the contents of this tag."""
        self.insert(len(self.contents), tag)

    def insert_before(self, predecessor):
        """Makes the given element the immediate predecessor of this one.

        The two elements will have the same parent, and the given element
        will be immediately before this one.
        """
        if self is predecessor:
            raise ValueError("Can't insert an element before itself.")
        parent = self.parent
        if parent is None:
            raise ValueError(
                "Element has no parent, so 'before' has no meaning.")
        # Extract first so that the index won't be screwed up if they
        # are siblings.
        if isinstance(predecessor, PageElement):
            predecessor.extract()
        index = parent.index(self)
        parent.insert(index, predecessor)

    def insert_after(self, successor):
        """Makes the given element the immediate successor of this one.

        The two elements will have the same parent, and the given element
        will be immediately after this one.
        """
        if self is successor:
            raise ValueError("Can't insert an element after itself.")
        parent = self.parent
        if parent is None:
            raise ValueError(
                "Element has no parent, so 'after' has no meaning.")
        # Extract first so that the index won't be screwed up if they
        # are siblings.
        if isinstance(successor, PageElement):
            successor.extract()
        index = parent.index(self)
        parent.insert(index+1, successor)

    def find_next(self, name=None, attrs={}, text=None, **kwargs):
        """Returns the first item that matches the given criteria and
        appears after this Tag in the document."""
        return self._find_one(self.find_all_next, name, attrs, text, **kwargs)
    findNext = find_next  # BS3

    def find_all_next(self, name=None, attrs={}, text=None, limit=None,
                    **kwargs):
        """Returns all items that match the given criteria and appear
        after this Tag in the document."""
        return self._find_all(name, attrs, text, limit, self.next_elements,
                             **kwargs)
    findAllNext = find_all_next  # BS3

    def find_next_sibling(self, name=None, attrs={}, text=None, **kwargs):
        """Returns the closest sibling to this Tag that matches the
        given criteria and appears after this Tag in the document."""
        return self._find_one(self.find_next_siblings, name, attrs, text,
                             **kwargs)
    findNextSibling = find_next_sibling  # BS3

    def find_next_siblings(self, name=None, attrs={}, text=None, limit=None,
                           **kwargs):
        """Returns the siblings of this Tag that match the given
        criteria and appear after this Tag in the document."""
        return self._find_all(name, attrs, text, limit,
                              self.next_siblings, **kwargs)
    findNextSiblings = find_next_siblings   # BS3
    fetchNextSiblings = find_next_siblings  # BS2

    def find_previous(self, name=None, attrs={}, text=None, **kwargs):
        """Returns the first item that matches the given criteria and
        appears before this Tag in the document."""
        return self._find_one(
            self.find_all_previous, name, attrs, text, **kwargs)
    findPrevious = find_previous  # BS3

    def find_all_previous(self, name=None, attrs={}, text=None, limit=None,
                        **kwargs):
        """Returns all items that match the given criteria and appear
        before this Tag in the document."""
        return self._find_all(name, attrs, text, limit, self.previous_elements,
                           **kwargs)
    findAllPrevious = find_all_previous  # BS3
    fetchPrevious = find_all_previous    # BS2

    def find_previous_sibling(self, name=None, attrs={}, text=None, **kwargs):
        """Returns the closest sibling to this Tag that matches the
        given criteria and appears before this Tag in the document."""
        return self._find_one(self.find_previous_siblings, name, attrs, text,
                             **kwargs)
    findPreviousSibling = find_previous_sibling  # BS3

    def find_previous_siblings(self, name=None, attrs={}, text=None,
                               limit=None, **kwargs):
        """Returns the siblings of this Tag that match the given
        criteria and appear before this Tag in the document."""
        return self._find_all(name, attrs, text, limit,
                              self.previous_siblings, **kwargs)
    findPreviousSiblings = find_previous_siblings   # BS3
    fetchPreviousSiblings = find_previous_siblings  # BS2

    def find_parent(self, name=None, attrs={}, **kwargs):
        """Returns the closest parent of this Tag that matches the given
        criteria."""
        # NOTE: We can't use _find_one because findParents takes a different
        # set of arguments.
        r = None
        l = self.find_parents(name, attrs, 1)
        if l:
            r = l[0]
        return r
    findParent = find_parent  # BS3

    def find_parents(self, name=None, attrs={}, limit=None, **kwargs):
        """Returns the parents of this Tag that match the given
        criteria."""

        return self._find_all(name, attrs, None, limit, self.parents,
                             **kwargs)
    findParents = find_parents   # BS3
    fetchParents = find_parents  # BS2

    @property
    def next(self):
        return self.next_element

    @property
    def previous(self):
        return self.previous_element

    #These methods do the real heavy lifting.

    def _find_one(self, method, name, attrs, text, **kwargs):
        r = None
        l = method(name, attrs, text, 1, **kwargs)
        if l:
            r = l[0]
        return r

    def _find_all(self, name, attrs, text, limit, generator, **kwargs):
        "Iterates over a generator looking for things that match."

        if isinstance(name, SoupStrainer):
            strainer = name
        elif text is None and not limit and not attrs and not kwargs:
            # Optimization to find all tags.
            if name is True or name is None:
                return [element for element in generator
                        if isinstance(element, Tag)]
            # Optimization to find all tags with a given name.
            elif isinstance(name, basestring):
                return [element for element in generator
                        if isinstance(element, Tag) and element.name == name]
            else:
                strainer = SoupStrainer(name, attrs, text, **kwargs)
        else:
            # Build a SoupStrainer
            strainer = SoupStrainer(name, attrs, text, **kwargs)
        results = ResultSet(strainer)
        while True:
            try:
                i = next(generator)
            except StopIteration:
                break
            if i:
                found = strainer.search(i)
                if found:
                    results.append(found)
                    if limit and len(results) >= limit:
                        break
        return results

    #These generators can be used to navigate starting from both
    #NavigableStrings and Tags.
    @property
    def next_elements(self):
        i = self.next_element
        while i is not None:
            yield i
            i = i.next_element

    @property
    def next_siblings(self):
        i = self.next_sibling
        while i is not None:
            yield i
            i = i.next_sibling

    @property
    def previous_elements(self):
        i = self.previous_element
        while i is not None:
            yield i
            i = i.previous_element

    @property
    def previous_siblings(self):
        i = self.previous_sibling
        while i is not None:
            yield i
            i = i.previous_sibling

    @property
    def parents(self):
        i = self.parent
        while i is not None:
            yield i
            i = i.parent

    # Methods for supporting CSS selectors.

    tag_name_re = re.compile('^[a-z0-9]+$')

    # /^(\w+)\[(\w+)([=~\|\^\$\*]?)=?"?([^\]"]*)"?\]$/
    #   \---/  \---/\-------------/    \-------/
    #     |      |         |               |
    #     |      |         |           The value
    #     |      |    ~,|,^,$,* or =
    #     |   Attribute
    #    Tag
    attribselect_re = re.compile(
        r'^(?P<tag>\w+)?\[(?P<attribute>\w+)(?P<operator>[=~\|\^\$\*]?)' +
        r'=?"?(?P<value>[^\]"]*)"?\]$'
        )

    def _attr_value_as_string(self, value, default=None):
        """Force an attribute value into a string representation.

        A multi-valued attribute will be converted into a
        space-separated stirng.
        """
        value = self.get(value, default)
        if isinstance(value, list) or isinstance(value, tuple):
            value =" ".join(value)
        return value

    def _attribute_checker(self, operator, attribute, value=''):
        """Create a function that performs a CSS selector operation.

        Takes an operator, attribute and optional value. Returns a
        function that will return True for elements that match that
        combination.
        """
        if operator == '=':
            # string representation of `attribute` is equal to `value`
            return lambda el: el._attr_value_as_string(attribute) == value
        elif operator == '~':
            # space-separated list representation of `attribute`
            # contains `value`
            def _includes_value(element):
                attribute_value = element.get(attribute, [])
                if not isinstance(attribute_value, list):
                    attribute_value = attribute_value.split()
                return value in attribute_value
            return _includes_value
        elif operator == '^':
            # string representation of `attribute` starts with `value`
            return lambda el: el._attr_value_as_string(
                attribute, '').startswith(value)
        elif operator == '$':
            # string represenation of `attribute` ends with `value`
            return lambda el: el._attr_value_as_string(
                attribute, '').endswith(value)
        elif operator == '*':
            # string representation of `attribute` contains `value`
            return lambda el: value in el._attr_value_as_string(attribute, '')
        elif operator == '|':
            # string representation of `attribute` is either exactly
            # `value` or starts with `value` and then a dash.
            def _is_or_starts_with_dash(element):
                attribute_value = element._attr_value_as_string(attribute, '')
                return (attribute_value == value or attribute_value.startswith(
                        value + '-'))
            return _is_or_starts_with_dash
        else:
            return lambda el: el.has_attr(attribute)

    def select(self, selector):
        """Perform a CSS selection operation on the current element."""
        tokens = selector.split()
        current_context = [self]
        for token in tokens:
            m = self.attribselect_re.match(token)
            if m is not None:
                # Attribute selector
                tag, attribute, operator, value = m.groups()
                if not tag:
                    tag = True
                checker = self._attribute_checker(operator, attribute, value)
                found = []
                for context in current_context:
                    found.extend([el for el in context.find_all(tag) if checker(el)])
                current_context = found
                continue
            if '#' in token:
                # ID selector
                tag, id = token.split('#', 1)
                if tag == "":
                    tag = True
                el = current_context[0].find(tag, {'id': id})
                if el is None:
                    return [] # No match
                current_context = [el]
                continue
            if '.' in token:
                # Class selector
                tag, klass = token.split('.', 1)
                if not tag:
                    tag = True
                found = []
                for context in current_context:
                    found.extend(
                        context.find_all(
                            tag,
                            {'class': lambda attr: attr and klass in attr.split()}
                            )
                        )
                current_context = found
                continue
            if token == '*':
                # Star selector
                found = []
                for context in current_context:
                    found.extend(context.findAll(True))
                current_context = found
                continue
            # Here we should just have a regular tag
            if not self.tag_name_re.match(token):
                return []
            found = []
            for context in current_context:
                found.extend(context.findAll(token))
            current_context = found
        return current_context

    # Old non-property versions of the generators, for backwards
    # compatibility with BS3.
    def nextGenerator(self):
        return self.next_elements

    def nextSiblingGenerator(self):
        return self.next_siblings

    def previousGenerator(self):
        return self.previous_elements

    def previousSiblingGenerator(self):
        return self.previous_siblings

    def parentGenerator(self):
        return self.parents

    # Utility methods
    def substitute_encoding(self, str, encoding=None):
        encoding = encoding or "utf-8"
        return str.replace("%SOUP-ENCODING%", encoding)


class NavigableString(unicode, PageElement):

    PREFIX = ''
    SUFFIX = ''

    def __new__(cls, value):
        """Create a new NavigableString.

        When unpickling a NavigableString, this method is called with
        the string in DEFAULT_OUTPUT_ENCODING. That encoding needs to be
        passed in to the superclass's __new__ or the superclass won't know
        how to handle non-ASCII characters.
        """
        if isinstance(value, unicode):
            return unicode.__new__(cls, value)
        return unicode.__new__(cls, value, DEFAULT_OUTPUT_ENCODING)

    def __getnewargs__(self):
        return (unicode(self),)

    def __getattr__(self, attr):
        """text.string gives you text. This is for backwards
        compatibility for Navigable*String, but for CData* it lets you
        get the string without the CData wrapper."""
        if attr == 'string':
            return self
        else:
            raise AttributeError(
                "'%s' object has no attribute '%s'" % (
                    self.__class__.__name__, attr))

    def output_ready(self, formatter="minimal"):
        if not callable(formatter):
            formatter = self.FORMATTERS.get(
                formatter, EntitySubstitution.substitute_xml)
        if formatter is None:
            output = self
        else:
            output = formatter(self)

        return self.PREFIX + output + self.SUFFIX


class CData(NavigableString):

    PREFIX = u'<![CDATA['
    SUFFIX = u']]>'


class ProcessingInstruction(NavigableString):

    PREFIX = u'<?'
    SUFFIX = u'?>'


class Comment(NavigableString):

    PREFIX = u'<!--'
    SUFFIX = u'-->'


class Declaration(NavigableString):
    PREFIX = u'<!'
    SUFFIX = u'!>'


class Doctype(NavigableString):

    @classmethod
    def for_name_and_ids(cls, name, pub_id, system_id):
        value = name
        if pub_id is not None:
            value += ' PUBLIC "%s"' % pub_id
            if system_id is not None:
                value += ' "%s"' % system_id
        elif system_id is not None:
            value += ' SYSTEM "%s"' % system_id

        return Doctype(value)

    PREFIX = u'<!DOCTYPE '
    SUFFIX = u'>\n'


class Tag(PageElement):

    """Represents a found HTML tag with its attributes and contents."""

    def __init__(self, parser=None, builder=None, name=None, namespace=None,
                 prefix=None, attrs=None, parent=None, previous=None):
        "Basic constructor."

        if parser is None:
            self.parser_class = None
        else:
            # We don't actually store the parser object: that lets extracted
            # chunks be garbage-collected.
            self.parser_class = parser.__class__
        if name is None:
            raise ValueError("No value provided for new tag's name.")
        self.name = name
        self.namespace = namespace
        self.prefix = prefix
        if attrs is None:
            attrs = {}
        else:
            attrs = dict(attrs)
            if builder.cdata_list_attributes:
                universal = builder.cdata_list_attributes.get('*', [])
                tag_specific = builder.cdata_list_attributes.get(
                    self.name.lower(), [])
                for cdata_list_attr in itertools.chain(universal, tag_specific):
                    if cdata_list_attr in attrs:
                        # Basically, we have a "class" attribute whose
                        # value is a whitespace-separated list of CSS
                        # classes. Split it into a list.
                        value = attrs[cdata_list_attr]
                        values = whitespace_re.split(value)
                        attrs[cdata_list_attr] = values
        self.attrs = attrs
        self.contents = []
        self.setup(parent, previous)
        self.hidden = False

        # Set up any substitutions, such as the charset in a META tag.
        if builder is not None:
            self.contains_substitutions = builder.set_up_substitutions(self)

            self.can_be_empty_element = builder.can_be_empty_element(name)
        else:
            self.contains_substitutions = False
            self.can_be_empty_element = False

    parserClass = _alias("parser_class")  # BS3

    @property
    def is_empty_element(self):
        """Is this tag an empty-element tag? (aka a self-closing tag)

        A tag that has contents is never an empty-element tag.

        A tag that has no contents may or may not be an empty-element
        tag. It depends on the builder used to create the tag. If the
        builder has a designated list of empty-element tags, then only
        a tag whose name shows up in that list is considered an
        empty-element tag.

        If the builder has no designated list of empty-element tags,
        then any tag with no contents is an empty-element tag.
        """
        return len(self.contents) == 0 and self.can_be_empty_element
    isSelfClosing = is_empty_element  # BS3

    def _get_string(self):
        """Convenience property to get the single string within this tag.

        :Return: If this tag has a single string child, return value
         is that string. If this tag has no children, or more than one
         child, return value is None. If this tag has one child tag,
         return value is the 'string' attribute of the child tag,
         recursively.
        """
        if len(self.contents) != 1:
            return None
        child = self.contents[0]
        if isinstance(child, NavigableString):
            return child
        return child.string

    def _set_string(self, string):
        self.clear()
        self.append(string)

    string = property(_get_string, _set_string)

    def _all_strings(self, strip=False):
        """Yield all child strings, possibly stripping them."""
        for descendant in self.descendants:
            if not isinstance(descendant, NavigableString):
                continue
            if strip:
                descendant = descendant.strip()
                if len(descendant) == 0:
                    continue
            yield descendant
    strings = property(_all_strings)

    @property
    def stripped_strings(self):
        for string in self._all_strings(True):
            yield string

    def get_text(self, separator="", strip=False):
        """
        Get all child strings, concatenated using the given separator.
        """
        return separator.join([s for s in self._all_strings(strip)])
    getText = get_text
    text = property(get_text)

    def decompose(self):
        """Recursively destroys the contents of this tree."""
        self.extract()
        i = self
        while i is not None:
            next = i.next_element
            i.__dict__.clear()
            i = next

    def clear(self, decompose=False):
        """
        Extract all children. If decompose is True, decompose instead.
        """
        if decompose:
            for element in self.contents[:]:
                if isinstance(element, Tag):
                    element.decompose()
                else:
                    element.extract()
        else:
            for element in self.contents[:]:
                element.extract()

    def index(self, element):
        """
        Find the index of a child by identity, not value. Avoids issues with
        tag.contents.index(element) getting the index of equal elements.
        """
        for i, child in enumerate(self.contents):
            if child is element:
                return i
        raise ValueError("Tag.index: element not in tag")

    def get(self, key, default=None):
        """Returns the value of the 'key' attribute for the tag, or
        the value given for 'default' if it doesn't have that
        attribute."""
        return self.attrs.get(key, default)

    def has_attr(self, key):
        return key in self.attrs

    def __hash__(self):
        return str(self).__hash__()

    def __getitem__(self, key):
        """tag[key] returns the value of the 'key' attribute for the tag,
        and throws an exception if it's not there."""
        return self.attrs[key]

    def __iter__(self):
        "Iterating over a tag iterates over its contents."
        return iter(self.contents)

    def __len__(self):
        "The length of a tag is the length of its list of contents."
        return len(self.contents)

    def __contains__(self, x):
        return x in self.contents

    def __nonzero__(self):
        "A tag is non-None even if it has no contents."
        return True

    def __setitem__(self, key, value):
        """Setting tag[key] sets the value of the 'key' attribute for the
        tag."""
        self.attrs[key] = value

    def __delitem__(self, key):
        "Deleting tag[key] deletes all 'key' attributes for the tag."
        self.attrs.pop(key, None)

    def __call__(self, *args, **kwargs):
        """Calling a tag like a function is the same as calling its
        find_all() method. Eg. tag('a') returns a list of all the A tags
        found within this tag."""
        return self.find_all(args, kwargs)

    def __getattr__(self, tag):
        #print "Getattr %s.%s" % (self.__class__, tag)
        if len(tag) > 3 and tag.endswith('Tag'):
            # BS3: soup.aTag -> "soup.find("a")
            tag_name = tag[:-3]
            warnings.warn(
                '.%sTag is deprecated, use .find("%s") instead.' % (
                    tag_name, tag_name))
            return self.find(tag_name)
        # We special case contents to avoid recursion.
        elif not tag.startswith("__") and not tag=="contents":
            return self.find(tag)
        raise AttributeError(
            "'%s' object has no attribute '%s'" % (self.__class__, tag))

    def __eq__(self, other):
        """Returns true iff this tag has the same name, the same attributes,
        and the same contents (recursively) as the given tag."""
        if self is other:
            return True
        if (not hasattr(other, 'name') or
            not hasattr(other, 'attrs') or
            not hasattr(other, 'contents') or
            self.name != other.name or
            self.attrs != other.attrs or
            len(self) != len(other)):
            return False
        for i, my_child in enumerate(self.contents):
            if my_child != other.contents[i]:
                return False
        return True

    def __ne__(self, other):
        """Returns true iff this tag is not identical to the other tag,
        as defined in __eq__."""
        return not self == other

    def __repr__(self, encoding=DEFAULT_OUTPUT_ENCODING):
        """Renders this tag as a string."""
        return self.encode(encoding)

    def __unicode__(self):
        return self.decode()

    def __str__(self):
        return self.encode()

    if PY3K:
        __str__ = __repr__ = __unicode__

    def encode(self, encoding=DEFAULT_OUTPUT_ENCODING,
               indent_level=None, formatter="minimal",
               errors="xmlcharrefreplace"):
        # Turn the data structure into Unicode, then encode the
        # Unicode.
        u = self.decode(indent_level, encoding, formatter)
        return u.encode(encoding, errors)

    def decode(self, indent_level=None,
               eventual_encoding=DEFAULT_OUTPUT_ENCODING,
               formatter="minimal"):
        """Returns a Unicode representation of this tag and its contents.

        :param eventual_encoding: The tag is destined to be
           encoded into this encoding. This method is _not_
           responsible for performing that encoding. This information
           is passed in so that it can be substituted in if the
           document contains a <META> tag that mentions the document's
           encoding.
        """
        attrs = []
        if self.attrs:
            for key, val in sorted(self.attrs.items()):
                if val is None:
                    decoded = key
                else:
                    if isinstance(val, list) or isinstance(val, tuple):
                        val = ' '.join(val)
                    elif not isinstance(val, basestring):
                        val = str(val)
                    if (self.contains_substitutions
                        and eventual_encoding is not None
                        and '%SOUP-ENCODING%' in val):
                        val = self.substitute_encoding(val, eventual_encoding)

                    decoded = (str(key) + '='
                               + EntitySubstitution.substitute_xml(val, True))
                attrs.append(decoded)
        close = ''
        closeTag = ''
        if self.is_empty_element:
            close = '/'
        else:
            closeTag = '</%s>' % self.name

        prefix = ''
        if self.prefix:
            prefix = self.prefix + ":"

        pretty_print = (indent_level is not None)
        if pretty_print:
            space = (' ' * (indent_level - 1))
            indent_contents = indent_level + 1
        else:
            space = ''
            indent_contents = None
        contents = self.decode_contents(
            indent_contents, eventual_encoding, formatter)

        if self.hidden:
            # This is the 'document root' object.
            s = contents
        else:
            s = []
            attribute_string = ''
            if attrs:
                attribute_string = ' ' + ' '.join(attrs)
            if pretty_print:
                s.append(space)
            s.append('<%s%s%s%s>' % (
                    prefix, self.name, attribute_string, close))
            if pretty_print:
                s.append("\n")
            s.append(contents)
            if pretty_print and contents and contents[-1] != "\n":
                s.append("\n")
            if pretty_print and closeTag:
                s.append(space)
            s.append(closeTag)
            if pretty_print and closeTag and self.next_sibling:
                s.append("\n")
            s = ''.join(s)
        return s

    def prettify(self, encoding=None, formatter="minimal"):
        if encoding is None:
            return self.decode(True, formatter=formatter)
        else:
            return self.encode(encoding, True, formatter=formatter)

    def decode_contents(self, indent_level=None,
                       eventual_encoding=DEFAULT_OUTPUT_ENCODING,
                       formatter="minimal"):
        """Renders the contents of this tag as a Unicode string.

        :param eventual_encoding: The tag is destined to be
           encoded into this encoding. This method is _not_
           responsible for performing that encoding. This information
           is passed in so that it can be substituted in if the
           document contains a <META> tag that mentions the document's
           encoding.
        """
        pretty_print = (indent_level is not None)
        s = []
        for c in self:
            text = None
            if isinstance(c, NavigableString):
                text = c.output_ready(formatter)
            elif isinstance(c, Tag):
                s.append(c.decode(indent_level, eventual_encoding,
                                  formatter))
            if text and indent_level:
                text = text.strip()
            if text:
                if pretty_print:
                    s.append(" " * (indent_level - 1))
                s.append(text)
                if pretty_print:
                    s.append("\n")
        return ''.join(s)

    #Soup methods

    def find(self, name=None, attrs={}, recursive=True, text=None,
             **kwargs):
        """Return only the first child of this Tag matching the given
        criteria."""
        r = None
        l = self.find_all(name, attrs, recursive, text, 1, **kwargs)
        if l:
            r = l[0]
        return r
    findChild = find

    def find_all(self, name=None, attrs={}, recursive=True, text=None,
                 limit=None, **kwargs):
        """Extracts a list of Tag objects that match the given
        criteria.  You can specify the name of the Tag and any
        attributes you want the Tag to have.

        The value of a key-value pair in the 'attrs' map can be a
        string, a list of strings, a regular expression object, or a
        callable that takes a string and returns whether or not the
        string matches for some custom definition of 'matches'. The
        same is true of the tag name."""
        generator = self.descendants
        if not recursive:
            generator = self.children
        return self._find_all(name, attrs, text, limit, generator, **kwargs)
    findAll = find_all       # BS3
    findChildren = find_all  # BS2

    #Generator methods
    @property
    def children(self):
        # return iter() to make the purpose of the method clear
        return iter(self.contents)  # XXX This seems to be untested.

    @property
    def descendants(self):
        if not len(self.contents):
            return
        stopNode = self._last_descendant().next_element
        current = self.contents[0]
        while current is not stopNode:
            yield current
            current = current.next_element

    # Old names for backwards compatibility
    def childGenerator(self):
        return self.children

    def recursiveChildGenerator(self):
        return self.descendants

    # This was kind of misleading because has_key() (attributes) was
    # different from __in__ (contents). has_key() is gone in Python 3,
    # anyway.
    has_key = has_attr

# Next, a couple classes to represent queries and their results.
class SoupStrainer(object):
    """Encapsulates a number of ways of matching a markup element (tag or
    text)."""

    def __init__(self, name=None, attrs={}, text=None, **kwargs):
        self.name = name
        if not isinstance(attrs, dict):
            # Treat a non-dict value for attrs as a search for the 'class'
            # attribute.
            kwargs['class'] = attrs
            attrs = None
        if kwargs:
            if attrs:
                attrs = attrs.copy()
                attrs.update(kwargs)
            else:
                attrs = kwargs
        self.attrs = attrs
        self.text = text

    def __str__(self):
        if self.text:
            return self.text
        else:
            return "%s|%s" % (self.name, self.attrs)

    def search_tag(self, markup_name=None, markup_attrs={}):
        found = None
        markup = None
        if isinstance(markup_name, Tag):
            markup = markup_name
            markup_attrs = markup
        call_function_with_tag_data = (
            callable(self.name)
            and not isinstance(markup_name, Tag))

        if ((not self.name)
            or call_function_with_tag_data
            or (markup and self._matches(markup, self.name))
            or (not markup and self._matches(markup_name, self.name))):
            if call_function_with_tag_data:
                match = self.name(markup_name, markup_attrs)
            else:
                match = True
                markup_attr_map = None
                for attr, match_against in list(self.attrs.items()):
                    if not markup_attr_map:
                        if hasattr(markup_attrs, 'get'):
                            markup_attr_map = markup_attrs
                        else:
                            markup_attr_map = {}
                            for k, v in markup_attrs:
                                markup_attr_map[k] = v
                    attr_value = markup_attr_map.get(attr)
                    if not self._matches(attr_value, match_against):
                        match = False
                        break
            if match:
                if markup:
                    found = markup
                else:
                    found = markup_name
        if found and self.text and self.text != found.string:
            found = None
        return found
    searchTag = search_tag

    def search(self, markup):
        # print 'looking for %s in %s' % (self, markup)
        found = None
        # If given a list of items, scan it for a text element that
        # matches.
        if hasattr(markup, '__iter__') and not isinstance(markup, (Tag, basestring)):
            for element in markup:
                if isinstance(element, NavigableString) \
                       and self.search(element):
                    found = element
                    break
        # If it's a Tag, make sure its name or attributes match.
        # Don't bother with Tags if we're searching for text.
        elif isinstance(markup, Tag):
            if not self.text or self.name or self.attrs:
                found = self.search_tag(markup)
        # If it's text, make sure the text matches.
        elif isinstance(markup, NavigableString) or \
                 isinstance(markup, basestring):
            if not self.name and not self.attrs and self._matches(markup, self.text):
                found = markup
        else:
            raise Exception(
                "I don't know how to match against a %s" % markup.__class__)
        return found

    def _matches(self, markup, match_against):
        # print "Matching %s against %s" % (markup, match_against)
        result = False

        if isinstance(markup, list) or isinstance(markup, tuple):
            # This should only happen when searching, e.g. the 'class'
            # attribute.
            if (isinstance(match_against, basestring)
                and ' ' in match_against):
                # A bit of a special case. If they try to match "foo
                # bar" on a multivalue attribute's value, only accept
                # the literal value "foo bar"
                #
                # XXX This is going to be pretty slow because we keep
                # splitting match_against. But it shouldn't come up
                # too often.
                result = (whitespace_re.split(match_against) == markup)
            else:
                for item in markup:
                    if self._matches(item, match_against):
                        result = True
        elif match_against is True:
            result = markup is not None
        elif callable(match_against):
            result = match_against(markup)
        else:
            #Custom match methods take the tag as an argument, but all
            #other ways of matching match the tag name as a string.
            if isinstance(markup, Tag):
                markup = markup.name
            if markup is not None and not isinstance(markup, basestring):
                markup = unicode(markup)
            #Now we know that chunk is either a string, or None.
            if hasattr(match_against, 'match'):
                # It's a regexp object.
                result = markup and match_against.search(markup)
            elif (hasattr(match_against, '__iter__')
                    and markup is not None
                    and not isinstance(match_against, basestring)):
                result = markup in match_against
            elif hasattr(match_against, 'items'):
                if markup is None:
                    result = len(match_against.items()) == 0
                else:
                    result = match_against in markup
            elif match_against and isinstance(markup, basestring):
                match_against = markup.__class__(match_against)

            if not result:
                result = match_against == markup
        return result


class ResultSet(list):
    """A ResultSet is just a list that keeps track of the SoupStrainer
    that created it."""
    def __init__(self, source):
        list.__init__([])
        self.source = source

```

Sometimes you will need to insert a very large block of sample code that might be too wide or extremely deep.  DevNet Slate manages this by automatically creating vertical and horizontal scroll bars such that the sample code is preserved without taking up too much space.  The example to the right is an extremely large python program pulled from the Internet.  There is no wrapping of text, instead, your readers need to use horizontal scrolling to see the full code sample.  Also, it is very long, but a maximum height of 50 cm has been set for the display area.  If your sample code exceeds this, then DevNet Slate will also provide vertical scrolling such that the space is better managed. 

## Inserting a Sample Code into a Particular Tab

You denote a code samples by using three left-single-quote marks followed by the name of the language.  The name of the language is used to place the code sample into the proper tab. Each code samples will appear in the dark area to the right of the main text. Code samples need to appear right under the Level 1 or Level 2 headers in your markdown file to allow them to be anchored properly.

The "language tabs" are the tabs that appear in the upper right of DevNet Slate Documents. Users browsing the docs use them to select their programming language of choice.

In the sample GFM code to the right, the Ruby code will appear in the Ruby tab, while the Python code will appear in the Python tab. Because the DevNet Slate engine understands the syntax of most computer programming languages, the sample code will have its language syntax highlighted automatically in a way that would make sense to the developer.

But just because a language is used as sample code within a DevNet Slate document it does not mean that the tab will appear.  You tell the system which Language tabs you want to display by editing the `language-tabs` list at the top of your GFM source document.

<aside class="success"> Sometimes it is useful to share code between multiple tabs, you can do this by placing tagging the sample code using a language that is not used as a tab name.  For example if you tag sample code as `all` and `all` is not listed in the `language-tabs` then that sample code will appear in all of the tabs.</aside>

## Creating Code Sample Annotations

> Code Sample Annotations

```markdown
> This is a Code Annotation!
```
It is sometimes useful to highlight or annotate a part of the sample code.  This is done with code annotations.  By placing a > as the first character in your GFM line of text, you will create a code annotation that will appear in the area to the right, next to the code samples.

<aside class="warning"> Make sure that you have a blank line after your Code Annotation.  If you do not, the annotation will continue until there is a blank line.
</aside>

# Fun with the Right Hand Panel

When you use the chevron `>` symbol, it takes the entire line and places it into the pannel to the right. Since it does not have a language, it will appear on all of the tabs to the right.  Additionally, because it is not "code" it is not treated as pre-formatted text.  As a result of these factors, the annotation feature can be very useful for placing Markdown or even HTML into the right hand panel.

## A Markdown Table

>The following markdown code:

```markdown

> Table Header 1 | Table Header 2 | Table Header 3
> -------------- | -------------: | :------------:
> Row 1 col 1 | Row 1 col 2 | Row 1 col 3
> Row 2 col 1 | Row 2 col 2 | Row 2 col 3 

```

> will result in the table in the right hand panel:

> Table Header 1 | Table Header 2 | Table Header 3
> -------------- | -------------: | :------------:
> Row 1 col 1 | Row 1 col 2 | Row 1 col 3
> Row 2 col 1 | Row 2 col 2 | Row 2 col 3 

For example, I can use the `>` to place a table into the right hand panel.

## An Image 

>The following markdown code:

```markdown

> ![Cisco Logo](/images/logo.png).

=======
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get(2)
```

```shell
curl "http://example.com/api/kittens/2"
  -H "Authorization: meowmeowmeow"
>>>>>>> tripit/master
```

> will result in the image placed into the right hand panel:

> ![Cisco Logo](/images/logo.png)


Or, I can use the `>` to place an image into the right hand panel.  I can even use the `>` to place HTML code such as a YouTube video or any other content.

# Creating your DevNet Slate Document

## Previewing your Docs

> Command to Start Your Preview Server

```md
bundle exec middleman server
```

>Output:

```md
  == The Middleman is loading
  == The Middleman is standing watch at http://0.0.0.0:4567
  == Inspect your site configuration at http://0.0.0.0:4567/__middleman/
```

## Building Your Docs If You Forked and Cloned

> Command to create your HTML Files

```md
rake build
```
> Output:

```md
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

The `rake build` command tells Middleman to build your website to the `build` directory of your project in a way that is Github compatible.  You then need to share those static HTML files with the DevNet team for publishing.  You can do this via Box.net or Dropbox.

## Building Your Docs If You Installed From Zip

> Command to create your HTML Files

```md
bundle exec middleman build --clean

```
> Output:

```md
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
```
The Middleman _build_ option builds your document to the `build` directory of your project.

## Getting Your Document On DevNet

Once you have built and tested your document using DevNet Slate, you can now get it publish it on DevNet.  You will need to raise a ticket to get your new static HTML files on DevNet for publishing.  You can do this by placing your build directory (with all subdirectories) into a zip, a Box.net folder or a Dropbox folder that you can share with the DevNet team. 

# Elements of Style for Cisco APIs'

Now that you understand the mechanics of DevNet Slate.  Now we need to get into the specifics of how to use these tools to present a common, consistent, and great developer experience on DevNet for your API.

## The Basics

Before we get into the specifics, let's deal with the high-level guidelines or ground rules:

* _Keep it Simple_ - how you use English to communicate to developers is important.  One of the ways you can simplify things is to use person pronouns (e.g., you, we, us) as this approach will naturally simplify your English.
* _Tell Them How Not What_ - It's possible to simply list all of your API calls, but this does not help the developer.  Instead, group your API end points into what they are used for.  For example, have headings that say "Starting a New Discovery Job" rather than "The Post Discovery Method".
* _Use Examples_ - this format is designed around code samples; use it!  Try to create an example for each of your API calls.
* _Test the Examples_ - when you use an example, make sure that it works.
* _Use Graphics_ - a picture is worth a thousand words.  The right graphic in the right place helps you to keep things simple.

## Language Libraries

<<<<<<< HEAD
REST (or RESTful) APIs are becoming the standard.  Developers like using REST APIs because they are simple and universal.  Because REST APIs use HTTP protocol along with JSON or XML, it is easy to call a REST API from pretty much any programming language.  As a result, there is a natural tendency for the API engineer to think that language libraries (wrappers that make the REST call in the programming language of choice) is not needed. This is a fallacy.
=======
Parameter | Description
--------- | -----------
ID | The ID of the kitten to retrieve
>>>>>>> tripit/master

A Programmer can call REST in a language like Python, Java, or C, with four to five lines of code.  When faced with this, the Programmer will typically write their own library of wrappers (code that encapsulates each REST end point) to make programming more module and cleaner.  Thus, if you want your API to be simple to use, you should have the wrappers for popular libraries built.  Next, you should use the language tabs of DevNet Slate to provide the syntax for each of the programming languages that you will be supporting.
