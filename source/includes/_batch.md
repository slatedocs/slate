Batching
========

You can send batched RPC commands using the `batch` method:

```javascript
> var txlist = [{
         to: "0x3caf506cf3d5bb16ba2c8f89a6591c5160d69cf3",
         method: "ten"
     }, {
         to: "0x5204f18c652d1c31c6a5968cb65e011915285a50",
         method: "double",
         signature: "i",
         params: 3
     }];
> Augur.batch(txlist)
['10', '6']
```

I'm going to add more user-friendly wrappers soon, which will allow you to batch commands without setting up transaction objects yourself.
