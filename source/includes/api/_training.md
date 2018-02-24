
### training.list

> Request example:

```JSON
{"select":{"training":"2281"}}
```

> Response example:

```JSON
{"seconds":"0.115639","jsonrpc":"2.0","id":"4","result":{"trainings":[{"description":"test training", "id":"2281", "name": "training test"}],"count":"1","page":{"this":{"batch":25,"start":1}}}}
```
Returns information about trainings.  Uses [pagination]

Optional parameters: `select` object with a `training` attribute identifying a single training or array of trainings to be returned.  E.g. '{"select":{"training":12345}}'.

A unique identifier for this training.
`name` The name of this training.
`description` The description of this training.

`training object`
