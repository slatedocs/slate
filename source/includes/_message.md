# Message Protocol

The messages transmitted on FariaMQ are categorized as two kinds by their purpose. The Document and Command message. Each Message can only communicate with one school, one message is never delivered for cross-schools.
Before we come to message type, let's introduce the basic compisition of message

## Message Composition

A message is composited by 2 parts: *headers* and *body*. Both of them formatted with JSON.

### Headers

```ruby
# headers of document message
{
  "type": "core_data.student",
  "uuid": "d3c1fc68312a419600159006a6fa3f0d",
  "source": "OA",
  "school_core_id": "KB-Organization-1045",
  "whodunnit_core_id": "OA-User-19",
  "timestamp": "2015-05-05T10:46:44+08:00",
  "group_identifier": "00dfa4ee-a472-4ebd-aad0-ac8e95abd3f3",
}

# headers of command message
{
  "type": "command.diagnosis"
  "uuid": "60c902d82c8dece165405f4e942ecee7",
  "source": "IS",
  "school_core_id": "KB-Organization-1045",
  "whodunnit_core_id": "IS-Staff-72",
  "timestamp": "2015-05-05T10:46:44+08:00"
}
```


The Headers contain the information to describe the message, such as the type, when, and where it is published.
When the queue subscriber receives the message, it looks up the headers firstly to determine what consumer is responsible to handle it.
The message body, or payload, is the content of the message going to processed by the consumer.

Headers represented the metadata of the message, which can include the following data:

* type (required): To specify what type the message is. It composited with 2 segement, the message type and name.
* school_core_id (required): To represent which school(logic area) the message belongs to.
* uuid (required): A unique ID to represent this message.
* timestamp (required)
* source: The source application who published the message
* target: The destination of the message to be delivered
* group_identifier: If the message is part of a sequential group message, headers should contain it.
* reply_to: If the message requires a response, the headers will contain the name of the replied queue. After the consumer processes the message, it should send a reply with this queue name as the routing key.
* correlation_id: If the message needs to be responded to, the headers must contain the correlation id as an identifier for response. After the consumer processes the message, it should also send a reply with this correlation id in its headers.
* verb: the action decided by broker when making decision, It informs the target application what to do. the value will be: update, create, delete or upsert.
* result: the result after the consumer processes the entry, the value will return: success, error or break.
* error: if the result throws an error, the consumer should put the error info into headers.
* context: To specify the message is process under some special context.


### Body

```ruby
headers = {
  "type": "core_data.student",
  "uuid": "d3c1fc68312a419600159006a6fa3f0d",
  "source": "OA",
  "school_core_id": "KB-Organization-1045",
  "whodunnit_core_id": "OA-User-19",
  "timestamp": "2015-05-05T10:46:44+08:00",
  "group_identifier": "00dfa4ee-a472-4ebd-aad0-ac8e95abd3f3",
}

body = {
  "student_core_id": "OA-Student-9871",
  "first_name": "John",
  "last_name": "Silver",
  "gender": "M",
  "birth_date": "2004-12-16",
  "year_grade_number": 10,
  "enrollment_year": 2014,
  "_changed": {
    "birth_date": "2014-12-16"
  }
} # update request

body = {
  "birth_date": "2004-12-16",
} # update decision
```

Message body or, the payload, represent to the content of the message.

The format of the message body is different from each types of message, we defined them in the section of [Canonical Data Model](#message-protocol).

In addition, for document message, the attributes in the message also changed with the message lifecycle:

- When sending *update request*, the message content should contain all attributes of the model. Besides, it has an additional info about what this message requested to change. Which stored in _changed attribute
- But when the request is converted to update decision, broker will only keep the changed attributes in the message body

## Types of Message

There are 3 types of message we used in Faria Messaging System, they are: Document, Command and Event.

Here is a breif explaination:

# Document Message

> Delivered as Group, processed as Entry

Most of the messages are document messages, they are published by behaviors of common users.

But before we jumped into Document Message, we have to introduce the 2 major concepts.

* The Standard Lifecycle of Document Message
* The Message Group and Entries


## The Standard Lifecycle of Document Message

The document messages are used for normal requests acted by the end-user, which is processed by the standard work flow we metiond before:

1. [Source Application] publishes the message to broker
2. [Broker] according its strategies to generate an update decision for each related application, then sends the decisions to remote applications.
3. [Target Application] receives the decision and processes them by consumers, after generates an update reply and sends it back to the broker.


Within this workflow, the message convert to the next phase under each transition.

- When source application publishing the message, which is an Update *Request* message
- When Broker converted the request, it besomes an Update *Decision* message
- When Target application received the decision and processed it, then it transformed to Update *Reply* message delivered back to the broker.

Normally, the message under each transition will extend the headers of current phase, and appends additional info for the next step.

Phase | Who | Description
----- | --- | -----------
Publish Update Request | Source Application | Prepared initial headers
Publish Update Decision | Broker | Add correlation ID, verbs. And insert identity ID if necessary.
Publish Update Reply | Target Application | Add result of the process



## Message Group and Entries

The message group is structured as the wrapper with its content. Each group is like a envelope with several content *entries* inside. Which is just like a relationship of one-to-many. The key points are:

- The Message Group is the unit that is delivered between the Broker and Applications (on RabbitMQ).
- The Message Entry is the minimum unit when publishing, and can be processed by the consumer.

The main reason why we designed group-entry structure for the document message is because,
when the message is triggered by the behavior of an user on the web, it's probably an bulk update across multiple models. To ensure the sequence and corresponding operations in a single transaction, we have to treat those update entries as a single unit.

<aside class="success">
Group Message is only using for Document Message.
</aside>


### The Format of Message Group

```ruby
headers = {
  "school_core_id": "KB-Organization-1045",
  "source": "OA",
  "group_identifier": "00dfa4ee-a472-4ebd-aad0-ac8e95abd3f3",
}

body = {
  "entries": [
    { 'body': entry_1_body, 'headers': entry_1_headers },
    { 'body': entry_2_body, 'headers': entry_2_headers },
    { 'body': entry_3_body, 'headers': entry_3_headers }...
  ]
}
```

A Message Group also follow the composition of message. It has body and headers as well.

The headers contained the info of this message sequence. And the body is just like a container to store its entries.

#### Headers

Headers of message group could have following information:

- school_core_id (required)
- source (required)
- group_identifier: (required when publishing message of update request)
- correlation_id: ()

#### Body
- entries: An array of the entries within this group, each entry should be composed with json of body and headers. For example:




# Command Message

```ruby
# headers of merge command
{
  "type": "command.merge_record"
  "uuid": "60c902d82c8dece165405f4e942ecee7",
  "correlation_id": "748e3e6a36b0f2c5ee51d49c8ee0e319",
  "reply_to": "rabbitMQ-XenJiLam2o",
  "source": "OA",
  "school_core_id": "KB-Organization-1045",
  "whodunnit_core_id": "IS-Staff-72",
  "timestamp": "2015-05-05T10:46:44+08:00"
}
# body of merge command
{
  'model': 'student',
  'winner_core_id': 'OA-Student-988',
  'loser_core_id': 'OA-Student-1266'
}
```

Command message, is used to directly ask remote applications to do an action. The most unexpected is when Command Message does NOT consider the feature flag. It is delivered to the remote application with a direct queue instead of routing through the decision maker(broker).

Command message doesn't relate to message group, it called by single atom action.

## Type of command

Each message put it command name in the type of header, with prefix of *command.*. And the content is the arguments of the command.

For example, the sample codes is a command for merging students, this command includes 3 arguments: the model name and the IDs of loser and winner.


## The Response of Command

```ruby
# success
{
  'model': 'student',
  'winner_core_id': 'OA-Student-988',
  'loser_core_id': 'OA-Student-1266'
  'success': true
}

# failure
{
  'model': 'student',
  'winner_core_id': 'OA-Student-988',
  'loser_core_id': 'OA-Student-1266',
  'success': false,
  'errors': 'Record not found'
}
```


Most of the commands have to be responded. The consumer should send reply message to the broker by looking up the info about reply_to and correlation_id in the headers of incoming message.

The content of the reply message is just copied from the command and put the boolean value of *success* to into the body.

If the command executed failed with errors, insert the errors to the content also.


# Event Message

TODO