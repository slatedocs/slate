# Errors

<aside class="notice">
This error section is stored in a separate file in <code>includes/_errors.md</code>. Slate allows you to optionally separate out your docs into many files...just save them to the <code>includes</code> folder and add them to the top of your <code>index.md</code>'s frontmatter. Files are included in the order listed.
</aside>

The AuthNull API uses the following error codes:


Error Code | Meaning
---------- | -------
400 | StatusBadRequest -- Your request is invalid.
401 | StatusUnauthorized -- Your API key is wrong.
403 | StatusForbidden -- The AuthNull requested is hidden for administrators only.
404 | Not Found -- The specified AuthNull could not be found.