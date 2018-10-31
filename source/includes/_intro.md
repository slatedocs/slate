# Introduction

Welcome to the CheKin API! 

You can use our API to access CheKin API endpoints, which can get, update, create and delete information on Accommodations, Reservations and Registered Persons.

One User can have many Accommodations / Properties.

One Accommodation can have many Reservations / Bookings.

One Reservation can have many Registered Persons / Guests.

The CheKin API is organized around REST. Our API has predictable, resource-oriented URLs, and uses HTTP response codes to indicate API errors. We use built-in HTTP features, like HTTP authentication and HTTP verbs, which are understood by off-the-shelf HTTP clients. 
We support cross-origin resource sharing, allowing you to interact securely with our API from a client-side web application. 

CheKin API accepts data as JSON or also as multipart/form-data. JSON is returned by all API responses, including errors.

The base url for CheKin API endpoints is `https://api.chekin.io/api/v1/`
