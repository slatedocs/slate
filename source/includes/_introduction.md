# Introduction

The Faria Message Broker is a re-engineered entity synchronization solution that ensures data consistency between ManageBac, OpenApply and InterSIS. The Faria Message Broker is mainly implemented in Ruby and serves ManageBac, OpenApply and InterSIS, all of them a multi-tenant Ruby on Rails applications.
To learn more about Message Bus capabilites, please select one of the sections below. If you have any questions, please let us know at [api@faria.co](mailto:api@faria.co).

## Standard Workflow

This is the typical messaging workflow involving a change from the user:

### Application sends Update Request

Data updates within a client application may occur due to direct interaction, indirect user interaction or automation. Updated information that needs to be synchronized across applications is then sent to the School Agent.

### School Agent processes Update Request

The corresponding School Agent, having subscribed to the Update Requests queue, forms Update Decisions.
The School Agent may make multiple Update Decisions in order to fully process a single Update Request, or it may simply discard the message and not react at all.

<aside class="notice">
In what instance would we discard the incoming event?

<ul>
  <li>Non Participation: the Logic Area is configured to not synchronize.</li>
  <li>Already Consistent: no further changes anywhere necessary.</li>
  <li>Gone: the affected object has been deleted elsewhere.</li>
</ul>
</aside>

> We use application code to represent the application, ex: *OA* represents to OpenApply

### School Agent sends Update Decisions

The School Agent decides on a series of data transformations to be applied to client applications, and sends them in Update Decisions.
Different client applications may receive different transformations due to their internal differences.

### Applications process Update Decisions

The client applications, having subscribed to the Update Decisions queues, receive instructions from the message broker.

### Applications send Update Replies

The client applications update or delete data, then send Update Replies outlining changes made.

Every Update Request is linked to an Update Reply.

<aside class="success">
Before all Update Replies are received for all Update Decisions, no further Update Decisions will be made nor sent to Applications.
</aside>

### School Actor processes Update Replies

The School Actor will collect Update Replies from all Client Applications involved and decide the next steps. As mentioned above, there is future room for expansion in fault-tolerant behavior (re-trying an intermittent failure automatically, or attempting to heal data inconsistencies in a deterministic manner).

* This concludes a Tick in the Messaging Lifecycle.
* The School Actor will not continue processing another Update Request before its current one has been satisfactorily processed by all Applications, or before it has exhausted all other available means to repair the inconsistencies.
* There may be a maximum number of retries allowed for a given Update Request. After the number of retries has been exhausted, the Update Request will be flagged for human review.
* Future expansions plans may include a heartbeat / throughput monitoring system here.


## Identity Table

TODO