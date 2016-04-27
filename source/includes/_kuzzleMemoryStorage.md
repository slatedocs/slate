# KuzzleMemoryStorage

Kuzzle's memory storage is a separate data store from the database layer.
It is internaly based on Redis. You can access most of Redis functions (all lowercased), except:

* all cluster based functions
* all script based functions
* all cursors functions

Here is the list of non implemented commands:

`client`
`cluster`
`config`
`debug`
`echo`
`eval`
`evalsha`
`flushall`
`migrate`
`monitor`
`move`
`psubscribe`
`pubsub`
`punsubscribe`
`quit`
`readonly`
`readwrite`
`role`
`script`
`select`
`shutdown`
`slaveof`
`slowlog`
`subscribe`
`sync`
`unsubscribe`
`scan`
`sscan`
`hscan`
`zscan`

You can find a list of all redis command at: [http://redis.io/commands](http://redis.io/commands)

## Constructors

```js
/*
 Constructor is not exposed in the JS/Node SDK. You may get the instantiated
 KuzzleMemoryStorage object by calling Kuzzle.memoryStorage
 */
var memoryStorage = kuzzle.memoryStorage;
```

```java
// using the static instance
KuzzleMemoryStorage memoryStorage = kuzzle.memoryStorage;

// or instanciating a new KuzzleMemoryStorage object
KuzzleMemoryStorage memoryStorage = new KuzzleMemoryStorage(kuzzle);
```

## Example

Here is an example with the `ping` command.

```js
var memoryStorage = kuzzle.memoryStorage;

memoryStorage.ping((err, res) => {
    // Handle result
});
```

```java
// using the static instance
KuzzleMemoryStorage memoryStorage = kuzzle.memoryStorage;

memoryStorage.setListener(new KuzzleResponseListener<JSONObject>() {

    @Override
    public void onSuccess(JSONObject result) {
        // Handle success
    }

    @Override
    public void onError(JSONObject error) {
        // Handle error
    }

});
memoryStorage.ping();
```