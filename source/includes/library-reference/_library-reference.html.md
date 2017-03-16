# Overview

The Python library wraps the API to simplify the process of building simulators
in the Python programming language.  Compatible with Python 2.7+

When the AI Engine trains with the simulator it works in a loop. First, the
simulator connects and registers itself with the AI Engine. Then, the simulator
sends the AI Engine a state and the value of any objectives or rewards; next,
the AI Engine replies with an action. The simulator then uses this action to
advance the simulation and compute a new state. This "send state, receive
action" process is repeated until training stops.  At any time the AI engine
may stop, reconfigure, and reset the simulator.  After doing so it will either
restart this training loop or stop training.


# Simulator Class

This class provides an interface for the event handling and responses required
to connect a simulator with the AI Engine.  Any methods added to classes that
inherit from `bonsai.Simulator` that are not specified below are eligible
objectives (i.e. reward functions).


## start()

Called by the AI Engine to start the simulator at the start of a train or test
pass.  `start` is called for the first time at the beginning of training and is
also the last of the stop, set_properties, reset, start message sequence sent
from the AI Engine in between training and test passes.


## stop()

Called by the AI Engine to stop training or testing. Training is also the first
callback of the stop, set_properties, reset, start message sequence sent by the
AI Engine between training and test passes.


## reset()

Called by the AI Engine to reset simulator state in between training and test
passes.


## set_properties(**kwargs)

Called by the AI Engine. to configure the simulation before training is started
or restarted. `set_properties` is called for the first time at the beginning of
training and is also called as part of the stop, set_properties, reset, start
message sequence sent from the AI Engine between training and test passes. See
the [configure clause of the lesson statement][1] in this simulator's accompanying
curriculums to get more information about the values in `kwargs`.


## advance(actions)

Advance the simulation forward one tick. `actions` contains a dictionary of key
values as defined by this simulator's action schema in Inkling.


## get_state()

Returns a [SimState][2] containing the state of the simulation computed after
the last call to `advance`. `SimState` contains a `state` and an `is_terminal`
flag. `state` is a dictionary matching the state schema as defined in an
Inkling `simulator` statement within an Inkling program. `is_terminal` is only
true when the simulator is in a "game over" state. Any cleanup of the
`is_terminal` state should be handled by `advance` or `get_state`.


## Objectives (Reward Functions)

Any methods added to this class that are not named with one of the above
method names are eligible to be called as a reward function.  To be called,
the name of the function specified in an Inkling `lesson` must match the name
of the method.  Reward functions specified in Inkling but not implemented on a
`Simulator` class will result in an error.

## SimState

A named tuple returned by `Simulator.get_state`.


### state

A dictionary matching the state schema as defined in an Inkling `simulator`
statement within an Inkling program.


### is_terminal

`True` when the simulator is in a "game over" state; otherwise `False`.


# Running the Simulator

## run_for_training_or_prediction(name, simulator_or_generator)

Connects to the AI Engine and identifies as `name`. The `name` of this
simulator must be the same in Inkling as it is in this function call.
`simulator_or_generator` is a reference to an instance of the simulator. This
call blocks and drives the simulator loop until training stops.


# Example

For more information, see [examples][3].


[1]: inkling-referece.html#lesson-configure-clause-syntax
[2]: #simstate
[3]: ../examples.html#find-the-center-example

