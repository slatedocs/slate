# Curriculum and Lessons

A **curriculum** in Inkling is used to define what and how to teach a concept. Each concept needs a corresponding curriculum to teach it, and every Inkling program must contain at least one curriculum. A **lesson** is part of a curriculum; it teaches a specific piece of the concept by specifying training and testing parameters and a stopping point (**until**). Lessons enable the AI to learn the concept bit-by-bit instead of all at once. Lessons are contained within curriculum statements. Each curriculum must contain at least one lesson.

Curriculum contain the lesson plan for the lessons that you are using to train your BRAINs. You must have one curriculum for every concept. A curriculum contains information about the training material that you're using to train the BRAIN; this is a simulator, generator, or data set, and it contains an objective, which measures the performance of the BRAIN as it learns your concept. Curricula may also contain expressions that assign portions of your training material for testing. Finally, your curriculum contains lessons. Each lesson teaches a piece of the concept. A curriculum can contain multiple lessons to teach a single concept.  Each lesson may contain different configurations for training the BRAIN. Configurations change how the Bonsai AI Engine uses the training source for training.

<aside class="notice">
Currently, during our private beta, you can only train with simulators as your training sources. Additionally, you are limited to one lesson in your curriculum.
</aside> 

## Determining Curriculum

Each curriculum trains a single concept, and every concept must have a curriculum. After you've determined your concepts, you will know how many curricula you need for your Inkling program. Curricula contain the information the Bonsai AI Engine uses to train your BRAIN on the concepts you've specified. They also specify the reward function (**objective**) for teaching a given concept. The reward function is a way the system concretely measures the AI's performance as it learns the concept.

```inkling
curriculum balance_curriculum
    train balance
    with simulator cartpole_simulator(CartPoleConfig) : (GameState)
    objective open_ai_gym_default_objective
      #lessons
end
```

For more information and examples, refer to the [Curriculum Reference][1].

## Determining Lessons

Each lesson specifies a portion of the training and, depending on the training sources, may contain information on configuring the training sources, training, testing, and a stopping point (**until**). When you're determining your lessons, you need to consider what your training sources are and what piece of the concept you are training. For example, if you're training with a simulator, you can place constraints on your simulation during training.

### Configure Clause

The configure clause is part of a lesson statement. Configure clauses are used with simulators and generators. They inform the computer how to set up the simulator or generator for training. You use configure to make sure you're not always training from the beginning, but from a point that makes sense to enhance how your BRAIN is learning the concepts.

The configure clause uses the **constrain** keyword to create a set of conditions for the AI to train on the simulator or generator with. **constrain** references a schema that is associated with the simulator.

```inkling
lesson get_high_score
  configure
    constrain episode_length with Int8{-1},
    constrain num_episodes with Int8{-1},
    constrain deque_size with UInt8{1}
  until
    maximize open_ai_gym_default_objective
```

The configure clause supports placeholders as well. The placeholder name does not hold a specific value, but is a name of a range of values that the the Bonsai AI Engine inputs during training. The configure clause provides guidance to the Bonsai AI Engine on how the training for that lesson should be configured. It is not the same as an assignment in an imperative language, because it does not represent a unique value. The AI Engine has some degree of freedom in determining how to configure for training.

For more information and examples, refer to the [Lesson Reference][1].

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

You need to think about what training with a specific reward will produce in terms of the quality or correctness of the behavior.

### In Inkling

In an Inkling program, your objective is going to be part of your curriculum statement.

```inkling
curriculum _curriculumName
    train _conceptName
    with _trainingSpecifier
  objective _objectiveName
    # lessons are specified here.
end
```

[1]: ./inkling-reference.html#curriculum
[2]: ./inkling-reference.html#lesson
