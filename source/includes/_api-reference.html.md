# HTTP API Reference

The Bonsai AI Engine provides programmers and data scientists with a new way of building sophisticated ML and AI applications. This HTTP API is at the core of how programmers interact with the AI engine.

 The Bonsai BRAIN HTTP API has several features:

* Managing BRAINS on the AI engine.
* Connecting simulators for training and use.
* Storing and reusing data sets.
* Getting predictions in both class request/response and streaming manner.

# URL Template

```
requestMethod /v1/userName/assetName/assetVersion
```

* **requestMethod:** The request method, such as GET, POST, or PUT.
* **v1:** The API version number
* **userNameOrOrg:** Your username or organization name.
* **assetName:** Name of the asset. This could be a BRAIN (_brainName_), _dataset_ (_datasetName_), etc.
* **assetVersion:** Version number of the asset.

# User and BRAIN status

## GET User status

```
GET /v1/userName
```

Uses the GET request method to get a list of assets owned by the user (or organization).

### Example Response

This example response is for BRAIN assets:

```
HTTP/1.1 200 OK
Vary: Accept
Content-Type: text/javascript
{
   "brains":  [{
       "id": 1
       "name": "mybrain1",
       "url": "/megan/mybrain1",
       "status": "uninitialized"

   }, {
       "id": 2
       "name": "mybrain2",
       "url": "/megan/mybrain2",
       "status": "trained",
       "training": "/megan/mybrain2/dev",
   }, {
       "id": 2
       "name": "mybrain3",
       "url": "/megan/mybrain3",
       "status": "training",
       "training": "/megan/mybrain3/dev",
       "predictor": "/megan/mybrain3/12"
   }]
   "datasets":   []
}
```
‍
## GET BRAIN status

```
GET /v1/userName/brainName
```

Uses the GET request method to get information about a BRAIN (_brainName_) created by a user (_userName_).

### Example Response

This is an example response for getting BRAIN information for a specific brain:

```
HTTP/1.1 200 OK
Vary: Accept
Content‐Type: text/javascript

{
   "id": 1
   "name": "mybrain1",
   "datasets": [],
   "generators": []
   "simulators": [{
       "name": "breakout",
       "objectives": ["score", "ball_location_distance"]
   }],
   "latest": "/v1/megan/mybrain/11"
}
```

# Inkling
‍
## GET Inkling

```
GET /v1/userName/brainName/brainVersion/ink
```

Uses the GET request method to get the Inkling code for a version (_brainVersion_) of a BRAIN (_brainName_) created by a user (_userName_). The _brainVersion_ is a number.

### Example Response

This is an example response to a request for Inkling code for a specific BRAIN.

```
HTTP/1.1 200 OK
Vary: Accept
Content‐Type: text/x‐bonsai‐inkling
concept foo follow input, feeds output
...
```
‍
## POST Inkling

```
POST /v1/userName/brainName/ink
```

Uses the POST request method to post a new version of the Inkling code for a BRAIN. You cannot POST new Inkling while a BRAIN is training.

### Example Request

This is an example request for posting new Inkling for a BRAIN that is not currently training.

```
POST /megan/mybrain HTTP/1.1
Host:  api.bons.aiContent‐Type: text/x‐bonsai‐inkling
Content‐Length:  1028
concept foo follow input, feeds output
...
```

### Example Response

This is an example response to posting new Inkling for a BRAIN that is not training.

```
HTTP/1.1 201 CreatedLocation: http://api.bons.ai/v1/megan/mybrain/11
```
‍
# Simulators

## GET Simulator Information

```
GET /userName/brainName/sims
```

Uses the GET request method to get the simulator information for a simulator connected to a BRAIN.

### Example Response

This is an example response for getting simulator information.

```
HTTP/1.1 200 OK
Vary: Accept
Content‐Type: text/javascript{
   "name": "breakout",
   "connected": 2,
   "instances": [{
       "state": "ready_to_play".
       "episode": 1
   }]
}
```
‍
## GET Update Simulator

```
GET /V1/userName/brainName/sims/ws
```

Uses the GET request method to update the simulator.

### Example Response

This is an example response for updating the simulator.

```
GET /megan/mybrain/sims/ws HTTP/1.1
Host:  api.bons.ai
Upgrade:  "Websocket"
Connection:  upgrade
```
‍
# Training Mode

## PUT Training Mode

```
PUT /v1/userName/brainName/train
```

Uses the PUT request method to start training mode or stop training mode.

### Example Response

This is an example response to using PUT to stop or start training mode.

```
HTTP/1.1 201 Created
Location: http://api.bons.ai/v1/megan/mybrain/11
```

# BRAIN Versions and Modes

## BRAIN Versions

**BRAIN versions numerically count up as new code is uploaded to the server (and successfully compiled) or as BRAINs are trained.**

* Loading a BRAIN results in a new version. You can think of this as the randomly initialized neural network before training.
* Training a BRAIN results in a new version.
* A version of a BRAIN in the training state blocks state transitions. No loads, no trains, no new versions of the BRAIN can be created. Training must be cancelled before doing more operations on the BRAIN.
* The BRAIN begins in an uninitialized state (aka version 0) which it permanently leaves after the first inkling is uploaded. version 0 cannot make predictions (it has no schema).
* For private beta only the most recent version of a BRAIN may be used for prediction this version can be referred to with the special version latest

## BRAIN Modes

**BRAIN versions have the following modes:**

* **ready_to_train:** After inkling is uploaded and successfully compiled, the BRAIN version number is incremented. That particular version is in the ready_to_train state. ready_to_train versions give predictions the same as or worse than random.
* **training:** After the train command is given, the BRAIN version is incremented and that version is in the training state. In this state the user cannot load new inkling into the BRAIN or restart training. The user must cancel training to upload new inkling.
* **trained:** If training is cancelled or completes the BRAIN version is in the trained state. Trained BRAIN versions can give predictions or receive more training. version is NOT incremented upon training completion.
