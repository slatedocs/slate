# Anatomy of a Theme

Themes are built using a powerful template system that enables designers and developers familiar with CSS and HTML to modify the presentation and structure of a Bigcommerce store.

## Directory Structure

Theme files that apply to a store design are organized in several different directories, as follows:

*   **Images**
*   **Panels**
*   **Snippets**
*   **Styles**

## Images

Theme specific static images (referenced from CSS, or in image tags).

## Layouts

Layout templates provide the base HTML structure that wraps storefront page content. Each layout file corresponds to a specific page.

For example, `product.html` refers to the page that’s shown when a customer is viewing the details of a product.

Most layout files contain nothing more than references to individual panels to be shown on a page. These panels are contained in div tags that generally define left, center, or right columns of the page.

## Panels

Panels provide reusable blocks or dynamic sections of content.

For example, the `SideCategoryList` panel builds a list of categories to be shown throughout the store.

Panels are generally referenced directly from layout templates. They define which content should be shown on a particular page and handle the generation of that specific content.

Some panels contain strictly static content (such as the store name) whilst others generate content dynamically. Dynamically generated panels cannot be created ad-hoc as they are linked to specific data and logic within the application.

## Snippets

Snippets are templates containing a fragment of HTML that can be embedded multiple times in a page, either from direct references or from being part of a loop that iterates over the items in a list.

For example, the `HomeFeaturedProductsItem` snippet renders each individual product listed in the `HomeFeaturedProducts` panel.

## Styles

Primary layout stylesheets for the Theme, with `styles.css` being the core file.
