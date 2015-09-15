# Integration Overview

Required steps to integrate FariaMQ:

1. Determine your Application Code and Models to sync.
2. Implement to Publish Messages.
3. Implement to Subscribe/Receive Messages.

Here we have OpenApply as the sample application, with the application code *OA*. And we plan to implement the synchronization of Student model.



Before execution, please review the type of exchanges used in RabbitMQ.

## Types of RabbitMQ Exchanges

The type of exchange we used is different than the scenario of message type.

### Use Topic Exchange for sending Document Message


```ruby
# Publish update request with topic exchange
exchange = channel.topic('documents')
exchange.publish(encoded_body,
  :headers => headers,
  :routing_key => 'KB-Organization-1045.update_requests'
)
```

We use topic exchange when sending update requests of document message, in order to deliver the message to the broker of the specified school by looking up the routing key

The routing key is composed by the school core id and the phase of the message lifecycle. For example, to send update request, the routing key is `KB-Organization-1045.update_requests`

After the broker receives the request, it sends the decisions to target applications by delivering them to direct exchange.

```ruby
# Publish update reply with topic exchange
exchange = channel.topic('documents')
exchange.publish(encoded_body,
  :headers => headers,
  :routing_key => 'KB-Organization-1045.update_replies'
)

```

### Use Direct Exchange to Receive Update Decision

```ruby
# Subscribe update decisions with direct exchange
x = channel.direct("update_decisions")
queue = channel.queue("update_decisions-OA").bind(x, :routing_key => "OA")
```




- When an edge application sends a document message reply, it publishes the topic exchange with corresponding routes again.




### Use Direct Exchange to send Command Message

```ruby
# Send Command Message using Direct Exchange
exchange = channel.direct('commands')
exchange.publish(encoded_message_body,
  :headers => headers,
  :routing_key => "IS",
  :correlation_id => correlation_id,
  :reply_to => reply_queue.name
)
```

- Command message uses a direct exchange for delivery, using the code from the target application as the routing key.


### Use Direct Exchange to send Event Message


# Integrate with Document Message

As metioned previously, the document message was delivered as a *Group Message*. Each group message is like an envelop wrapped with more message entries. The message group is also composed of body and headers as JSON, but its schema is much simplier.

Therefore, you need to gather the request entries into the group body(each entry contains it's body and headers too). Then encode it and publish it to RabbitMQ.

## Publish Update Request

```ruby
# Prepare the message entry and the group
payload = {
 :id => 2,
 :student_core_id => "MB-User-10857745",
 :first_name => "Aaron",
 :last_name => "Gindo",
 :preferred_name => "Angy",
 :other_name => "" ,
 :birth_date => "1999-04-19",
 :gender=> "M",
 :email => "aaron.gindo@eduvo.com",
 :_changed => { "first_name" => "Andy" }
}

headers = {
  :school_core_id => "KB-Organization-1045",
  :type => "student"
  :source => "OA",
  :uuid => "fd37490f3215e5f6a4834a943fd37049"
  :group_identifier => "6b4bb4f622b8f7d52add25f840a005ae"
}

entry1 = { :body => payload, :headers => headers }

# You can prepare multiple entries to update many models, such as entry2, entry3...


group_headers = {
  :group_identifier => "6b4bb4f622b8f7d52add25f840a005ae",
  :school_core_id => "KB-Organization-1045",
  :source => "OA"
}

group_body = { :entries => [entry1, entry2, ....] }

encoded_content = Yajl::Encoder.encode(group_body

# To publish update request
exchange = channel.topic('documents')
exchange.publish(encoded_content,
  :headers => group_headers,
  :routing_key => 'KB-Organization-1045.update_requests'
)

```

1. Firstly, prepare the message entries you are going to publish, the sample code generates a request entry to update the student's first name from 'Andy' to 'Aaron'.

2. You can prepare several entries, then wrap them into a message group. A message group is also composed of body and headers. The body stores the array of request entries with *entries* as the key. The headers contain the school id and the group identifier as well.

3. RabbitMQ accepts only strings as content to publish, so you need to encode the content of the group to a string.

4. Finally, send the encoded content and headers to the document exchange. With the routing key composited by the school id

<aside class="notice">
Send the encoded content and the headers to the topic exchange named <code>documents</code> with the routing key as <code>#{School Core ID}.update_requests</code>.
</aside>

## Receive Update Decision

```ruby
# To subscribe and receive update decisions
x = channel.direct("update_decisions")
queue = channel.queue("update_decisions-OA").bind(x, :routing_key => "OA")

queue.subscribe do |delivery_info, properties, payload|

  group_headers = properties.headers
  # { 'school_core_id' => ..., 'correlation_id' => ..., 'source' => ... }

  group_content = Yajl::Parser.parse(payload)

  # extract the entries
  entries = group_content['entries']

  entries.each do |entry|

    decision_headers = entry['headers']
    # { 'school_core_id' => ..., 'type' => ..., 'uuid' => ..., 'verb' }

    decision_body = entry['body']
    # { 'student_core_id' => 'MB-User-10857745', first_name' => 'Aaron' }

    # Call your consumer to process the entry
  end
end
```


The broker delivers the update decision to your queue which subscribes the exchange of *update_decisions*. The update decision message you received is also a group message. With the string as its payload, you have to convert the payload from a String to JSON as well.

<aside class="notice">
To subscribe to update decision messages, bind the queue to the direct exchange <code>update_decision</code> with your application code as routing key.
</aside>

### The Headers of Decision Group

In the headers of group message, there is an important value you must notice: *correlation_id*, which is the identifier of the request-response interaction.
This means when you want to send a response to the broker, your reply must have the same correlation id in its headers.


<aside class="notice">
The <code>correlation_id</code> is an identifier of a single request-response conversation, your reply message must have the same identifier.
</aside>

### The Body of Decision Group

After decoding the incoming payload, you will receive the content of the message group. Similar to how we wrapped the request entries when publishing update request. You can access it with *entries* as the key.  You will then receive an array of decision entries.

### The Decision Entry

Each decision entry implements one update request of data record that was published/requested by the source application.

The entry's body usually contains the Core ID of the target record. With the specified type in the headers, you interpret which record will be operated.

<aside class="notice">
With the <code>type</code> in the headers and the <code>Core ID</code> in the body, you will be able to find the target record to execute the operation.
</aside>

In addition, when the broker converted the request to decision entry, it added a *verb* into the headers. This tells the application what operation should do on the target record. The verb could be:

- create: To create the record with the given attributes in the entry body.
- update: To update the record with the given attributes in the entry body.
- upsert: To update the record. If it does not exist, change to create it.
- delete: To delete the record.


### Verb Mismatch



## Send Update Reply

```ruby
# Send Update Reply

# You can clone the body and headers from decision entry
payload = decision_body.dup
headers = decision_headers.dup

headers[:result] = 'success'

reply1 = { :body => payload, :headers => headers }

group_headers = decision_group_headers.dup
group_body = { :entries => [reply1, reply2, ....] }

encoded_content = Yajl::Encoder.encode(group_body)

x = channel.topic('documents')
x.publish(encoded_content,
  :headers => group_headers,
  :routing_key => 'KB-Organization-1045.update_replies'
)

```

After you processed all decision entries, you must send a reply message to the broker. The reply message is also a group message, including reply entries of all corresponding decision entries. They are matched by the same uuid in the headers. In the other words, you can generate headers of reply by cloning from decision entry directly.

For each reply entry, you need to add the result of your process to the headers, the result could be following values:

Value | Description
------ | -----------
success | The entry had been processed successfully.
ignore | The entry was ignored to process.
error | The entry processed failed(and you have to add error info to the headers of reply entry).
break | The entry stopped to process because there was an error that occured previously.

When all reply entries are prepared, wrap them as another group message (reply group). Then publish it to the *update_replies* exchange. It is similar to publishing update request, but has a different exchange name and routing key.

<aside class="notice">
To subscribe to messages of update decision, bind the queue to the direct exchange <code>update_decision</code> with your application code as the routing key.
</aside>


## Reply with Error

If errors occur when processing the decision entry, you have to add error information to the headers with *error* as the key, the error info is also a hash, with the following attributes:

- message: The text of error message.
- backtrace: The bracktrace stack of the codes.
- class_name: The class name of the error object
- meta: Another hash to provide info to descript the error. For example, if it's a Validation Error, the meta could tell which field is invalid.



# Integration with Command Message