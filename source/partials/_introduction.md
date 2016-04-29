# Introduction

Welcome to the Optisom Sleep Health Platform API! As an Optisom Platform Level
Partner, you can use our API endpoints to obtain information on users, assessments,
challenges, diary entries and other information related to the your user's progress
through the Optisom Sleep Health Platform.

We have example code to query the API using Curl.  You can view code examples in the dark
area.

# Key Concepts
The Optisom Sleep Health Platform encompasses several key concepts that are necessary to
understand how to use the system properly.
The easiest way to contextualize these concepts is to view them from the user's experience. This
experience is primarily made of two use cases; screening and taking sleep health
challenges.

A screening consists of a series of questions that survey the user's sleep health.
Based on the user's responses to these questions, a sleep health report is produced and a
set of sleep health modules are assigned to the user.


These modules contain tasks, in the form of challenge cards,
that the user can undertake in order to improve their sleep health.  As a user completes
tasks, points are awarded.  These points can be used to tie the user's progress to
incentive rewards, or as a part of creating competition between users and teams.

All attributes concerning the user, screening, challenges and more are accessible through
standard webservice API calls which responds with JSON data structures.

As an Optisom Platform Partner, you should have been provided with an email login
and a password to your Optisom Sleep Health API Service, which we'll refer to as "the Optisom Service"
going forward.  If you do not have the email or password, please contact Partner Support
at <partnersupport@optisom.com>. This information is used to obtain authentication credentials for
the Optisom Service.