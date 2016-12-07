# Example: Mountain Car

We've used pieces of code from this example in several places, but here we'll walk you through all the various statements that are part of the mountain car inkling file. Each statement is followed by an explanation of the statement.

Mountain car is a classic control problem. [OpenAI Gym][1] describes it as:

_A car is on a one-dimensional track, positioned between two "mountains". The goal is to drive up the mountain on the right; however, the car's engine is not strong enough to scale the mountain in a single pass. Therefore, the only way to succeed is to drive back and forth to build up momentum._

## Schemas

```
schema GameState
   Float32 x_position,
   Float32 y_velocity
end
```

The GameState schema names two records — x_position and y_position — and assigns a type to them.

```
schema Action
   Int8{0,1,2} action
end
```

The Action schema names a single record — action — and assigns a constrained type to it.

```
schema MountainCarConfig
   Int8 episode_legnth,
   Int8 num_episodes,
   UInt8 deque_size
end
```

The MountainCarConfig schema names three records — episode_length, num_episodes, and deque_size — and assigns types to them.

## Concept `high_score`

```
concept high_score
   is classifier
   predicts Action
   follows input(GameState)
   feeds output
end
```

The concept is named high_score, and it takes input from the simulator about the state of the game (GameState schema). It outputs to the Action schema. This is the AI's next move in the game.

## Curriculum and Lessons

```
simulator mountaincar_simulator(MountainCarConfig)
  state  (GameState)
end

curriculum high_score_curriculum
   train high_score
   with simulator mountaincar_simulator
   objective score
   lesson get_high_score
       configure
           constrain episode_length with Int8{-1},
           constrain num_episodes with Int8{-1},
           constrain deque_size with UInt8{1}
       until
           maximize score
end
```

* The curriculum is named high_score_curriculum, and it trains the high_score concept using the mountaincar_simulator.
* The mountain_car simulator gets information from two schemas. The first (MountainCarConfig) specifies the schema for configuration of the simulation. The second schema contains the state of the simulator that is sent to the lesson.
* This curriculum contains one lesson, called get_high_score. It configures the simulation, by setting a number of constraints for the state of the simulator.
* The lesson trains until the AI has maximized the objective.

[1]: https://gym.openai.com/envs/MountainCar-v0
