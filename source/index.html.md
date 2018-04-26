---
title: GAKU Engine API Reference

language_tabs:
  - shell
  - ruby
  - javascript

toc_footers:
  - <a href='http://www.gakuengine.com'>GAKU Engine</a>
  - <a href='https://github.com/GAKUEngine/gaku'>GAKU Engine on GitHub</a>
  - <a href='https://github.com/GAKUEngine/manabu'>Manabu Ruby Client on GitHub</a>
  - <a href='https://github.com/GAKUEngine/manabu-desktop'>Manabu-Desktop Ruby + GTK Client on GitHub</a>
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

includes:
  - authentication
  - roles
  - users
  - students
  - enrollment_statuses
  - contact_types
  - courses
  - course
  - syllabuses
  - errors


search: true
---

Introduction
============

The GAKU Engine API comes standard with any install of GAKU Engine, though it may be disabled
by removing the "gaku-api" gem from your Gemfile. All calls to the API other than the 'status'
call require authentication.

Protocols
---------

The GAKU Engine API can be accessed with either [MessagePack](https://msgpack.org/) or JSON.
We highly recommend you use MessagePack as a lot of data from the API can be quite extensive
and MessagePack does a significantly better job of transporting this data quickly.
