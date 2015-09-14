<h1 id="mq">
  FariaMQ
  <img src="/images/icon-mq-text.png">
</h1>
 

The Faria Message Broker is a re-engineered entity synchronization solution that ensures data consistency between ManageBac, OpenApply and InterSIS. The Faria Message Broker is mainly implemented in Ruby and serves ManageBac, OpenApply and InterSIS, all of them a multi-tenant Ruby on Rails applications.
To learn more about Message Bus capabilites, please select one of the sections below. If you have any questions, please let us know at [api@faria.co](mailto:api@faria.co).

## Standard Workflow

This is the typical messaging workflow involving a change from the user:

### Application Sends Update Request

Data updates within a client application may occur due to direct interaction, indirect user interaction or automation. Updated information that requires synchronization across applications is then sent to the School Actor.

### School Actor Processes Update Request

The corresponding School Actor, having subscribed to the Update Requests queue, forms Update Decisions.
The School Agent may construct multiple Update Decisions in order to fully process a single Update Request, or it may discard the message and not react at all.

<aside class="notice">
In what instance would we discard the incoming event?

<ul>
  <li>Non Participation: the Logic Area is configured to not synchronize.</li>
  <li>Already Consistent: no further changes anywhere necessary.</li>
  <li>Gone: the affected object has been deleted elsewhere.</li>
</ul>
</aside>

> We use the application's code to represent the application, e.g *OA* represents to OpenApply

### School Actor Sends Update Decisions

The School Actor determines a series of data transformations to be applied to client applications, and sends them in `Update Decisions`.
Different client applications may receive different transformations due to their internal differences.

### Application Processes Update Decisions

The client applications, having subscribed to the `Update Decisions` queues, receive instructions from the message broker.

### Application sends Update Replies

The client applications update or delete data, subsequently sending `Update Replies` outlining changes made. Every Update Request is linked to an Update Reply.

<aside class="success">
Before all Update Replies are received for Update Decisions, no further Update Decisions will be produced nor sent to Applications.
</aside>

### School Actor processes Update Replies

The School Actor accumulates Update Replies from all Client Applications involved and determines the next steps. As mentioned previously, there is future room for expansion in fault-tolerant behavior (re-trying an intermittent failure automatically, or attempting to heal data inconsistencies in a deterministic manner).

* This concludes a Tick in the Messaging Lifecycle.
* The School Actor will not continue processing another Update Request before the current one has been satisfactorily processed by all Applications, or before it has exhausted all other available means to repair the inconsistencies.
* There may be a maximum number of retries allowed for a given Update Request. After the number of retries threshold has been reached, the Update Request will be flagged for human review.
* Future expansions plans may include a heartbeat / throughput monitoring system here.


## Identity Table
The identity table is responsible for storing multiple identities of one entity in a table. For example, one person could have multiple identities across applications. One identity in MB, OA, etc. The identity table stores the status and basic information in the table.
