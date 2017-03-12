# Python Library Reference

## Example
Here is an example implementation of the Python simulator class.

```python
""" A minimal Python simulator.
"""
from bonsai import Simulator, run_for_training_or_prediction
from bonsai.simulator import SimState


class MySimulator(Simulator):

    def start(self):
        """This method is called when training is started."""
        pass

    def stop(self):
        """This method is called when training is stopped."""
        pass

    def reset(self):
        """This method is called whenever the server resets the game. The
           server resets the game at the beginning and the frame after
           is_terminal==True
        """
        pass

    def advance(self, actions):
        """Advance the simulation forward one tick. actions contains a
           dictionary of key values as defined by this simulator's action
           schema in Inkling.
        """
        pass

    def set_properties(self, **kwargs):
        """This method is called before training is started
           or on the frame after is_terminal=True to set
           configuration properties in this simulation. See
           the configure clause of the lesson statement in
           this simulator's accompanying curriculums.
        """
        pass

    def get_state(self):
        """Returns a named tuple of state and is_terminal. state is a
           dictionary matching the state schema as defined in Inkling.
           is_terminal is only true when the simulator is in a "game over"
           state.
        """
        return SimState(state={},
                        is_terminal=False)

    def distance_from_goal(self):
        """Example reward that can be minimized instead of maximized"""
        return float('inf')  # infinity

    def time_at_goal(self):
        """Example reward that measures how long the AI has kept a value at a
           goal.
        """
        return 0.0


if __name__ == "__main__":
    run_for_training_or_prediction(name="my_simulator",
                                   simulator_or_generator=MySimulator())
```

