## Curricula and Lessons

A **curriculum** in Inkling is used to define what and how to teach a concept. Each concept needs a corresponding curriculum to teach it, and every Inkling program must contain at least one curriculum. A **lesson** is part of a curriculum; it teaches a specific piece of the concept by specifying training and testing parameters and a stopping point (**until**). Lessons enable the AI to learn the concept bit-by-bit instead of all at once. Lessons are contained within curriculum statements. Each curriculum must contain at least one lesson.

###### Determining a Curriculum

Each curriculum trains a single concept, and every concept must have a curriculum. After you've determined your concepts, you will know how many curricula you need for your Inkling program. Curricula contain the information the Bonsai AI Engine uses to train your BRAIN on the concepts you've specified. They also specify the reward function (**objective**) for teaching a given concept. The reward function is a way the system concretely measures the AI's performance as it learns the concept.

```inkling
curriculum balance_curriculum
    train balance
    with simulator cartpole_simulator(CartPoleConfig) : (GameState)
    objective open_ai_gym_default_objective
      #lessons
end
```

###### Determining Lessons

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

For more information and examples, refer to the [curriculum reference][1].

[1]: #curriculum
