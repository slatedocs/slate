# Injecting Analytics Snippets

Often you want to inject JavaScript snippets into all pages of your site, either in the `<head>` or at the end of the `<body>` tag.

Most analytics providers, retargeting services or A/B testing services will give you an HTML snippet and ask you to add it to every page on your site.

Netlify lets you do this without having to pollute the source code for the site with production specific analytics snippets.

From the site settings screen, find the "Custom Scripts" section and click "Edit". Then give your script a name and paste the script body (including any `<script>` tags, etc).

Netlify lets you pick between injecting the scripts in before the closing `</head>` tag or before the closing `</body>` tag.

Note, scripts injected in this way will also show up on the `password` protection screen. This means you can easily verify that your analytics scripts are correctly configured without having to remove the password when your site is still under development.
