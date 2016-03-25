# JSON API Endpoints

The JSONP API is a simple way to embed ControlShift petition content in external sites. It's intended for use by a front-end developer embed content on web pages outside of the platform.  For example, a developer could:

* Show petitions
* Allow a user to search for near by petitions
* List petition categories
* Show petitions within an effort
* If a site visitor is logged in, show a users past actions and created petitions

All of the endpoints can be consumed as jsonp instead of json by adding callback or variable parameters to the URLs.

The URL slugs through the API are the same as those that are used through the web to represent specific petitions or categories.  Many front-end libraries including jQuery make it easy to consume jsonp endpoints. Our examples below use jQuery to consume these resources.

<aside class="success">
These examples use the domain <code>demo.controlshiftlabs.com</code>. You'll need to replace this with the hostname of your instance.
</aside>
