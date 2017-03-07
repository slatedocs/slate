# Find the Center Example

In this example, we'll walk you through the various statements that are part of the *Find the Center* game, including the simulator file and the Inkling file. This is a very basic example of Inkling and how to connect to a simulator.

*Find the Center* is a simple game where the AI seeks the average value between two numbers. In this game, the AI begins at a random value of 0, 1, or 2. The AI then can move to a lower number by outputing -1, a higher number by outputing +1, or staying on the same number by outputing 0. The goal of *Find the Center* is to remain in the center of 0 and 2 (the number 1).

## Inkling File

###### Schema

```inkling
schema GameState
    Int32 value
end
```

The `GameState` schema has one field, `value`, with type `Int32`.

```inkling
schema PlayerMove
    Int32{-1, 0, 1} delta
end
```

The `PlayerMove` schema has one field, `delta`, with type `Int32`. The `Int32` type is constrained to three possible values: -1, 0, and 1.

```inkling
schema SimConfig
    Int32 dummy
end
```

The `SimConfig` schema has one field, `dummy`, because there is no configuration needed in this particular example.

###### Concept

```inkling
concept find_the_center
    is classifier
    predicts (PlayerMove)
    follows input(GameState)
    feeds output
end
```

This concept is named `find_the_center`. `find_the_center` expects input about the state of the game (defined by the `GameState` schema) and replies with output defined by the `PlayerMove` schema. This is the AI's next move in the simulation.

###### Simulator

```inkling
simulator find_the_center_sim(SimConfig)
    action (PlayerMove)
    state (GameState)
end
```

The `simulator` is called `find_the_center_sim` (shown in #simulator-file) and takes the schema input of `SimConfig` (even though it isn't configuring anything, it's required by the simulator). The `find_the_center` concept will be trained using the `find_the_center_sim` simulator. To define the training relationship between the simulator and the concept we must begin by defining the simulator. `find_the_center_sim` expects an action defined in the `PlayerMove` schema as input and replies with a state defined in the `GameState` schema as output.

###### Curriculum

```inkling
curriculum find_the_center_curriculum
    train find_the_center
    with simulator find_the_center_sim
    objective time_at_goal
        lesson seek_center
            configure
                constrain dummy with Int32{-1}
            until
                maximize time_at_goal
end
```

The curriculum is named `find_the_center_curriculum`, and it trains the `find_the_center` concept using the `find_the_center_sim`. This curriculum contains one lesson, called `seek_center`. It configures the simulation, by setting a number of constraints for the state of the simulator.

The lesson trains until the AI has maximized the objective `time_at_goal`.


## Simulator File

```python
from __future__ import print_function
import bonsai
import sys
from bonsai.simulator import SimState
from random import randint

""" If you would like to debug your code add this back in.
def debug(*args):
    print(*args, file=sys.stderr)
"""


class BasicSimulator(bonsai.Simulator):
    """ A basic simulator class that takes in a move from the inkling file,
    and returns the state as a result of that move.
    """

    min = 0
    max = 2
    goal = 1

    def __init__(self):
        super(BasicSimulator, self).__init__()
        self.goal_count = 0
        self.value = randint(self.min, self.max)
        self.old_value = self.min

    def get_terminal(self):
        """ Restarts the simulation if the AI moved out of bounds.
        """
        if (self.value < self.min or self.value > self.max):
            # (self.value == self.goal and self.old_value == self.goal)):

            # debug("terminal")
            self.reset()
            return True
        else:
            return False

    def start(self):
        """ Start the episode by initializing value to a random number
        between the min and max.
        """
        # debug("start")
        self.goal_count = 0
        self.old_value = self.min
        self.value = randint(self.min, self.max)

    def stop(self):
        """ Stop is called after a training session is complete.
        This simple game requires no cleanup after training.
        """
        # debug("stop")
        pass

    def reset(self):
        """ Reset is called to reset simulator state before the next training session.
        """
        # debug("reset")
        self.goal_count = 0
        self.old_value = self.min
        self.value = randint(self.min, self.max)

    def advance(self, actions):
        """ Function to make a move based on output from the BRAIN as
        defined in the Inkling file.
        """
        # debug("advance", actions["delta"])
        self.value += actions["delta"]
        if self.value == self.goal:
            self.goal_count += 1

    def get_state(self):
        """ Gets the state of the simulator, whether it be a valid value or
        terminal ("game over") state.
        """
        # debug("get_state")
        # debug("state", self.value)
        self.old_value = self.value
        return SimState(state={"value": self.value},
                        is_terminal=self.get_terminal())

    def time_at_goal(self):
        """ Function to return how long the simulation has maintained the goal.
        """
        return self.goal_count

if __name__ == "__main__":
    base_args = bonsai.parse_base_arguments()
    sim = BasicSimulator()
    bonsai.run_with_url('find_the_center_sim', sim,
                        base_args.brain_url, base_args.access_key)
```

This is a Basic simulator for learning the simulator interface. In this case it is used to find the center between two numbers, 0 and 2. The goal, as outlined in the Inkling file, is to reach 1. The moves that the simulator is able to make are sent from the Inkling file to the simulator and the state of the simulator is sent back to Inkling.

[1]: https://gym.openai.com/envs/MountainCar-v0
