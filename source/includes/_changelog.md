# Changelog

This section lists new versions and the changes made in those versions. Review these changes to decide whether you need to upgrade to the new version. Note that only backward incompatible changes are shown. See the [Versioning](#versioning) section for more information on how to upgrade to a new version.

v3 - September 2016

* _collection_request_ field on Collection object now contains a JSON representation of the Collection Request, not the ID

v2 - February 2016

* _Accounts_ API to get balances of organization's accounts.

v2 - November 2015

* Versioning improvements to provide transparent backward compatibility by automatically saving users' version. Versions can be upgraded manually via web interface
* _organization_ field now contains the organization ID, not name, in the Payments, Contacts and Collection Requests methods
* _currency_ field now contains the currency code, not the currency ID, in the Collections method

v3 - September 2016

* _collection_request_ field on Collections object now return the expanded collection request object, not just the collection request id

v4 - May 2017

* Added _transaction_ field to Collections object. It contains the expanded transaction object for the collection

v5 - July 2017

* _phone_nos_ field on Payment object now contains more data about each phone number within the payment including amount status and any errors (only for payments that have more than one phone number attached to them)