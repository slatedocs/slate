## Objectives

The **objective**, often known in machine learning (ML) as the **reward function**, measures how well the AI is doing at learning the concept. Or, put differently, it is what you use to reward the AI.

This idea may be easier to understand with a few examples:

In our Breakout example, our concept was get_high_score. The **score** is how we are measuring how well the AI is doing at learning that concept.

If we are teaching the AI Pacman, and we are training the concept of `avoid_non_blue_ghosts`, we may measure how well the AI is doing at learning this concept by measuring the amount of time the AI manages to avoid non-blue ghosts. Our objective clause uses **time** as the reward.

In these examples, the objective, or reward, is one of the factors we use to measure how well the AI is training on the concept.

###### Determining Objectives

There are several factors you can use to determine what your objective should be. Before you even start determining your objectives, you need to know what your concepts and curricula are. A good objective should reward the AI more often and be proportional to the quality of of the behavior.

### Frequency

Frequency matters in training. The time between the AI's decision making and whether or not the decision was good needs to be kept short.  For example, if you're teaching an AI to play Pacman, you want to choose an objective like `score` instead of an objective like `level`.

In Pacman, your score changes more often, probably many times during a level, but your level can only change 256 times. Your AI would have to beat an entire level to be rewarded. The length of time between a decision the AI makes and the reward should have a higher frequency and should scale with the as the AI learns.

### Proportional

The reward should be in proportional to the quality of the behavior (or the correctness of the behavior). When you are deciding what your objective is going to be, you need to consider that the AI will learn exactly what you ask it to learn. This can result in learning what you specified but not necessarily what you wanted. For example, if you ask an AI to play Pong, and you use the objective of `time`, the AI will learn that to get the longest time played, the paddle should remain in the same place. The ball will bounce back and forth between the two unmoving paddles.

In the Pong example, the AI learned exactly what you told it to learn, how to maximize the amount of time, but it didn't really learn how to play the game.

You need to think about what training with a specific reward  will produce in terms of the quality or correctness of the behavior.

###### In Inkling

In an Inkling program, your objective is going to be part of your curriculum statement.

```inkling
curriculum _curriculumName
    train _conceptName
    with _trainingSpecifier
  objective _objectiveName
    # lessons are specified here.
end
```

[1]: #lesson
