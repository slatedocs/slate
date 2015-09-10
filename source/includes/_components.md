# Components

## Actors Manager

The actors manager is an object that generates many actors

## Actor

The actor is responsible for receiving the update request from the topic exchange. The actor only communicates with a subscriber. The reply from the subscriber should contain the remote id. After the actor receives the reply it will update the identity table with the remote id. 

## Decision Maker

The decision maker is responsible for resolving the verb by referencing the identity table. The decision maker inspects the remote id from the update request. If the request does not have a remote id it will prompt the verb create(and wait for the reply). Otherwise, the decision maker will apply the verb `update` to the identity table.   


## Subscriber
The subscriber receives data from the actor and examines the data type. Depending on the number of entries it adds every entry into a single consumer. For example, if the message is a 'student message' the subscriber will create a student consumer.    

## Consumer
The consumer processes the message from the subscriber. Every consumer will process the entry and generate an update reply. It sends the update reply back to the subscriber. Subsequently the subscriber wraps all the entries and sends it back to the actor. 