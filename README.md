## Quintype Documentation

This is the parent folder that controls https://developers.quintype.com

Do note that various subdirectories are controlled from other repos.

* https://developers.quintype.com/malibu - is controlled from the malibu repo, gh-pages branch.
* https://developers.quintype.com/quintype-node-components - is controlled from the quintype-node-components via jsdoc, and is updated pre-publish
* https://developers.quintype.com/quintype-node-backend - is controlled from the quintype-node-backend via jsdoc, and is updated pre-publish
* https://developers.quintype.com/quintype-node-migration-helpers - is controlled from the quintype-node-migration-helpers via tsdoc

### Sitemaps

If you are adding a new page, please add it to `source/combined-sitemap.xml`

Currently, important pages from the slate documentation is in `source/sitemap.xml`

### Analytics

The correct analytics snippet to add on all pages is the following

```html
<script>(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');ga('create', 'UA-66074042-1', 'auto');ga('send', 'pageview');</script>
```
