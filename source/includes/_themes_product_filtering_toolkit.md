# Product Filtering Toolkit

**Before you attempt to add Product Filtering to your theme, please note that this is recommended for experienced theme developers.** Other than knowledge in HTML and CSS, familiarizing yourself with how Bigcommerce themes are structured and operate will be essential in effectively implementing Product Filtering in your theme.

We also recommend working on a temporary sandbox store. You can create a trial store and upload your theme customizations via WebDAV to replicate your theme.

NOTE: Product Filtering is a Premium feature. If you would like it enabled to an active public store, you must upgrade to a Premium plan.

## Creating a new theme with Product Filtering

Product Filtering is fully functional in the Blueprint theme. If you are creating a new theme, we recommend starting from the Blueprint theme. Once you’ve enabled Developer Mode, you’ll be able to access Blueprint and Product Filtering in your developer store.

## Enabling Product Filtering for your customised theme

To enable Product Filtering, all you have to do is enable developer mode on your store. This will enable Product Filtering on your store by default, regardless of whether your theme supports it or not. Depending on the customisations you have to your theme, this could have unexpected results. **We recommend using a sandbox store (not your main store) when applying these changes for the first time.**

If you have a new store, Product Filtering may already work out of the box for your theme.

## Implementing Product Filtering in your theme

If you haven’t already, follow the steps above to have the Product Filtering feature enabled for your sandbox store. Once you’ve completed this and your store has the Product Filtering feature enabled, you’ll need to get the most up-to-date files from Blueprint and copy them into your own theme. The best way to do this is:

1.  Enable Dev Mode in your sandbox store if you haven’t already. This will enable the Blueprint theme and the Faceted Search feature for your theme.
2.  Select Blueprint as your store’s theme. Don’t forget to back up your theme customisations if you’re not starting from scratch.
3.  Download the Blueprint theme – don’t worry, you’ll only be needing certain files for faceted search.
4.  Reinstate your theme from the backups you downloaded in step 2.
5.  Upload the following files from Blueprint to your sandbox store:
    *   **Panels/FacetedSearch.html** – This panel contains the markup for your Faceted Search column. It calls all the panels for each of the searchable facets as well.
    *   **Panels/FacetedSearchProductGrid.html** - This panel contains the markup for your list of product results your category lists are set to "grid view".
    *   **Panels/FacetedSearchProductList.html** - This panel contains the markup for your list of product results your category lists are set to "list view".
    *   **Panels/FacetedSearchTemplateCategory.html** – The panel that contains the markup for the Category facet.
    *   **Panels/FacetedSearchTemplateMultichoice.html** – The panel that contains the markup for any facet containing multiple choice checkboxes
    *   **Panels/FacetedSearchTemplateRange.html** – The panel that contains the markup for facets containing ranges.
    *   **Panels/FacetedSearchTemplateRating.html** – The panel that contains the markup for the Rating facet.
    *   **Panels/FacetedSearchTemplateShowing.html** – The panel that contains the markup for the list of currently selected filters.
    *   **Panels/FacetedSearchTemplateSingle.html** – The panel that contains the markup for any facet containing single choice radio buttons
    *   **Panels/Pagination.html** – The panel that contains the markup for your Pagination – note that this will not use any existing pagination panels your theme may have.
    *   **Styles/faceted-search.css** (This will be included in FacetedSearch.html – you don’t have to add it to your HTMLHead.html file)
6.  Copy your brands.html page and name it brands_with_facets.html
7.  Copy your search.html page and name it search_with_facets.html
8.  Copy your category.html page and name it category_with_facets.html
9.  Include the required assets on your new facets pages. You can use the facets pages from Blueprint for reference (they’ll be named the same).
    *   %%Panel.FacetedSearch%% – This is the main Faceted Search panel, and will call the rest of the panels it needs accordingly (including js and css).
    *   Add the `js-faceted-search-column` class to the container of your Faceted Search panel.
    *   If you have a responsive theme, you can add the Refine button to your page, which toggles the faceted search column on or off. This button only displays on mobile by default.
        `<button class="js-faceted-search-action btn"> %%LNG_FilterBy%% </button>`
10.  If the pages mentioned above don’t exist, you can copy the existing ones from Blueprint. Keep in mind that you’ll need to modify them to suit the structure of your theme.

N.B. When you turn on “product filtering” on a store, it will automatically switch all Category Layout Files to your new category_with_facets.html page. To view product filtering on Category pages you must ensure that the “Category Layout File” is set to category_with_facets.html

**Important note regarding Brand.html, Search.html and Category.html page templates:** Do not modify the base templates of these pages to include Faceted Search. Faceted Search is a **Premium Plan feature only**. Clients who are not on a premium plan do not get Faceted Search, so if you include it on Category.html, Brand.html or Search.html, your theme will be useless to those clients.

When Faceted Search is switched off, the following templates will be used:

*   category pages > category.html
*   brand pages > brands.html
*   search page > search.html

When switched on:

*   category pages > category_with_facets.html
*   brand pages > brands_with_facets.html
*   search page > search_with_facets.html

**Please note:** You will not see the category filter on storefront category pages. This has been hidden for SEO reasons.
