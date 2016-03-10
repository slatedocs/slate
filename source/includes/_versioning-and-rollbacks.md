# Versioning and Rollbacks

Netlify versions all deploys. From the "Builds" tab for your site in the netlify UI, you can browse any deploy you've ever made and preview it from a unique URL.

## Atomic Deploys

Netlify enforces a strict concept of atomic deploys.

If you're used to uploading files with FTP, SSH, RSync or S3's API, this is quite a different concept.

Instead of pushing individual files to netlify, you always create a new deploy. Netlify will compare the new deploy with your existing deploy and determine which files have changed and need to be uploaded.

No changes go live on your site's public URL before all changes have been uploaded. Once all the changes are ready, the new version of the site immediately goes live on the CDN.

This means deploys are atomic, and your site is never in an inconsistent state while you're uploading a new deploy.

With FTP or S3 uploads, each file is just pushed live one after the other, so you can easily get into situations where a new HTML page is live before the supporting assets (images, scrips, CSS) have been uploaded. And if your connection cuts out in the middle of an upload, your site could get stuck in a broken state for a long time.

Atomic deploys guarantee that your site is always consistent.

## Rollbacks

You can browse each atomic deploy you've ever made. If you need to rollback, it's a 1-click operation from the "Builds" section for your site, and rollbacks are instantaneous.
