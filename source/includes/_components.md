# Components

## Actors Manager

The actors manager is an object that generates many actors. It supports commands to manage the actors. For example, maybe we want re-activate an actor, the actor manager commands the actor to initialize.

## Actor
The actor is responsible for receiving the update request from the topic exchange. The actor only communicates with a subscriber. An actor receives the reply from the subscriber. After they will attempt to update the identity table based on the content of reply message.


## Decision Maker

The decision maker is responsible for resolving the verb by referencing the identity table. If the request does not have a remote id it will prompt the verb create(and wait for the reply). Otherwise, the decision maker will apply the verb `update` to the identity table.   

The Decision Maker has three major processes. First, it checks for subscriptions. Second, the Decision Maker checks the feature flag. This is based on the action type and not the data type. Finally, the decision maker determines where the update decisions are going to eg. which applications(OA,MB).


## Subscriber
The subscriber receives data from the actor and examines the data type. Depending on the number of entries it sends every entry into a single consumer. For example, if the message is a 'student message' the subscriber will create a student consumer, and send the message to it. The consumer will return the reply entry. For example, if there are 3 entries, there will be 3 reply entries from the consumer. The consumer is dependent on the type of data.

## Consumer
The consumer processes the message from the subscriber. Every consumer will process the entry and generate an update reply entry. It sends the update reply back to the subscriber. Subsequently the subscriber wraps all the entries and sends it back to the actor. 