---
title: Getting Started with Quintype, Node, and React

language_tabs: # must be one of https://git.io/vQNgJ
  - javascript

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

search: true
---

This document is currently an outline

# Chapter 1 - Setup

## Prerequisites

* Install Node v8.11
* Understand React fundamentals.
* Understand Promises and async/await
* Install Visual Studio Code (optional)
* Install supervisor for dev server

## Steps

* Clone the malibu repo
* cd into the folder and do a ./run, which will install all dependencies and start server on port 3000
* Open localhost:3000 in the browser. You will see (screenshot)

# Chapter 2 - Changing the header

Let's change the header to have a blue background

* Open `header/index.js` [cmd-p, header/index.js, enter]
* See the line with styleName="container", change that bit to styleName="container blue" and hit save
* Go to the browser, and the header should have a blue background. Sometimes, this may need a refresh
* Go back to header/index.js. The styles for this component comes from the line `import "./header.m.css"`.
* Right click on the header, in the browser and look at the class on the div. It should look like this: `header-m__blue__1L_kP`
* This is a CSS module. The classes in the header.m.css are only available to JS files that import it, via styleName. See babel react CSS modules for more info.

# Chapter 3 - Changing the look of a page

* Open up pick-component.js, and search for `PAGE_TYPE.HOME_PAGE`, and notice that the rendered component is called `HomePage`
* You will see that the HomePage is defined in component-bundles/list.js. Open this file
* list.js will import the HomePage from components/pages/home.js. Press cmd - alt - down on HomePage
* You will see the definition for HomePage. It's pretty simple, has a header and calls out to a `LazyCollection` component.
* Let's try changing the title in the H1, and ensure it reflects in the browser.
* You'll see that data into the lazyCollection comes from props.data.collection. In the next chapter, we will explore how to update where this data comes from

# Chapter 4 - Updating the Data For A Page

* For a list of `PAGE_TYPES` defined, open up `constants.js`
* Open up `load-data.js`, and look for `PAGE_TYPE.HOME_PAGE`
* You can see that this comes from `loadHomePageData`, hover over the import and hit cmd-alt-down
* You'll see that `loadHomePageData` just calls `Collection.findBySlug`. The value returned from this async function will be available inside the component `HomePage` as `props.data`.
* Let's try loading a different collection, `home-dev`. Update the JS, and go to the browser. Do you see a different set of stories?

# Chapter 5 - Adding a new Layout in the homepage, and rendering it in dev mode

* Let's look at what data we have in the home page, by putting a `console.log` after we get the collection `console.log(collection.asJson())`
* Reload home page, then copy the json from your terminal, and paste it into http://jsonprettyprint.com
* The structure should look something like this (snippet showing collection template with FourColGrid)
* Open collection-templates/index.js, here you can see a template
* Copy four-col-grid to my-grid. Write component, add to this, and set it as default
* Reload Page
* We will explain how to add your `my-grid` component to the API in chapter 7

# Chapter 6 - Deployments

* Black Knight basicss
* Talk to the team

# Chapter 7 - Managing the Editor

* Link to collections and Manage collection in the help documentation
* Explanation of /template-options.json
