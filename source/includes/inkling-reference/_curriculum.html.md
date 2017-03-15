# Curriculum

Reference for the keyword **curriculum**. Also, describes the keywords: **train**, **with**, **data**

### What is it?

The **curriculum** (keyword) declares a set of lessons that are used to teach concepts. Each curriculum contains a lesson or set of lessons and trains a single concept.

### Why do I use it?

A curriculum is used to teach a concept. The curriculum defines what concept is being taught (see the train clause below). Every concept needs a corresponding curriculum to teach it. A curriculum defines a set of lessons used to train the concept.

### How do I use it?

Select the Inkling tab to see a simple form of a curriculum statement.

```inkling
curriculum curriculumName
  train conceptName
  with trainingSpecifier  # one of data, simulator, or generator
  objective objectiveName
    # lessons are specified here.
end
```

The _trainingSpecifier_ specifies either `data`, `simulator`, or `generator` as the training source. These support different approaches to training. For **data**, a set of labeled data is available for training and testing. A labeled dataset contains data plus meta information about the data, for example an image of a hat plus the category of the image ('hat'). The labels assist training and also support testing. The availability of labeled data means that coded simulators are unnecessary. After training with the labeled data of images of hats, the BRAIN is able to identify a hat in an unlabeled image.

In the **simulator** case, all the data is unlabeled and the response to training data will be fed back into the training. A separately coded `simulator` (written in python for example) provides implementations of the lessons and keep the state of training. 

The **generator** case is like the **simulator** case (in that there is a separately coded generator and the data is unlabeled), but the generator is stateless.

**Note:** Currently, during our private beta, you can **only** train with simulators as your training source. That is, training specifier **simulator** is supported, but **data** and **generator** are not.

The **objective** specifies the termination condition for training.

**Note:** When the _trainingSpecifier_ is **data**, the objective must be either the keywords `equality` or `linear_distance`. When the training specifier is **simulator** or **generator**, the objective names a function which is specified in the associated simulator or generator. The use of simulators or generators requires an auxiliary clause, the `simulator` or `generator` clause respectively. The example below uses the game Mountain Car from OpenAI Gym to illustrate the simulator clause.  To explore this example more fully, refer to it in our [Examples chapter][1].

```inkling
simulator mountaincar_simulator(MountainCarConfig) 
  state (GameState)
  control (Action)
end
```

```inkling
curriculum high_score_curriculum
train high_score
with simulator mountaincar_simulator 
objective open_ai_gym_default_objective
  lesson get_high_score
    configure
      constrain episode_length with Int8{-1},
      constrain num_episodes with Int8{-1},
      constrain deque_size with UInt8{1}
    until
      maximize open_ai_gym_default_objective
end
```
‍
The simulator clause declares the simulator name and two schemas. The first specifies the schema for configuration of the simulator and it appears in parentheses immediately after the simulator name. In this instance, the configuration schema is named `MountainCarConfig`. In the example, the configure clause of lesson `get_high_score` initializes this configuration.

```inkling
# Configuration schema declaration
schema MountainCarConfig
  Int8 episode_length,
  Int8 num_episodes,
  UInt8 deque_size
end
```

The names in the configuration schema are the names referenced in the configure
clause of `lesson get_high_score`. When the lesson is
initiated, the configuration data as described in the configuration schema is sent
to the simulator. The configuration data will be generated according to the
range expression in the lesson configure clause for a field. 

The second schema specified in the simulator clause is the state schema. It is
specified after the **state** keyword in the simulator clause. This is the schema that defines what is sent to the lesson. Recall that a simulator has state. That means that input to the lesson will consist of the state of the game as a result of the previous lesson execution. For mountaincar this schema is called `GameState` and prior state consists of prior position.


```inkling
# State schema definition
schema GameState
  Float32 x_position,
  Float32 x_velocity
end
```

In order to determine what our next move will be, the training will use the previous position as input.

Finally, note that `high_score_curriculum` trains a concept called `high_score`.  (It's quite clear what we are aiming for with this curriculum!)


```inkling
# Predict schema Action (see concept high_score)
schema Action
  Int8{0, 1, 2} action # these values describe game moves
end

concept high_score
  is classifier
  predicts (Action)
  follows input(GameState)    
  feeds output
end
```

The concept `high_score` trains the Brain to select the next move, which will have
one of the values specified in the `Action` schema range expression. 

Note that the predefined input stream **input** has the schema `GameState`. This reflects that fact that the simulator has state. The previous move is the state which is input into the selection of the next move.

The **predicts** schema `Action` also appears in the simulator clause discussed above. It is after the keyword **control**. In general the **control** schema is the **predicts** schema of the concept being trained.

So far we have presented a simple version of the curriculum. Inkling supports
multiple simulators and generators within a single curriculum. Here is the full
syntax for the curriculum statement, which introduces a **using** clause and a
**with** clause (where **using** and **with** will specify simulators). These were not needed in our example above because we were using a single simulator.

## Curriculum Rules

* One curriculum per concept. 
* Every concept must have a curriculum.
* You can train with **data**, **simulators**, or **generators**. These are the values allowed as training specifiers (see the Curriculum syntax). 
* Every simulator or generator must be declared with a simulator or generator clause, respectively.

**Note:** Currently, during our private beta, you can **only** train with simulators as your training material. That is, only the **simulator** training specifier is supported.

* Lessons, tests, and assignments can occur in any order. (Assignments are used for data handling when the training specifier is **data**.)
* If the **using** clause is present (that is, if the simplified curriculum syntax
* is not being used), there must be one **using** clause for every **with** clause.
* The objective is always required but if the _trainingSpecifier_ is **data**, the objective must be either `equality` or `linear_distance`.

## Curriculum Statement Syntax

Select the syntax tab to see the syntax.

```plaintext
curriculumStatement ::=
curriculum <name>
    train <conceptName>
[
  withClause                        # with clause

]+
[
  using  [ <simulatorName> | data ] # using clause
  [
    assignClause # assignment for training and test data
    lessonClause # lesson set for this simulator
  ]+

  end # using
]+
end # curriculum
```


```plaintext
withClause ::=
with data
  objective <objectiveFunctionName>

| with simulator
  objective <objectiveFunctionName>

| with generator
  objective <objectiveFunctionName>
```

Any simulator or generator referenced in a curriculum must have an associated simulator or generator clause.

## Simulator Clause Syntax

When a simulator is used for training, use the simulator clause.

The keyword **simulator** indicates that the responses of the system to the training
data will feed back into the training. Simulators are coded implementations of
the lessons. They are time variant. A simulator coded for example in python
keeps state and thus it will use deep-q learning. The simulator clause has a
state schema that describes simulator state.  

```plaintext
simulator <simulatorName>'('<configurationSchema>')' 
  state '('<stateSchema>')'     # simulator state
  control '('<controlSchema>')' # training concept predicts schema
end
```
## Generator Clause Syntax

When a generator is used for training, use the generator clause.

The keyword **generator** indicates that the simulator generates the training data.
Generators can be thought of as a stateless simulators. They do have coded
simulators but the training output does not get fed back into simulator. The
generator clause has a yield schema that defines the training output.

```plaintext
generator <generatorName>'('<configurationSchema>')'  
  yield '('<outputSchema>')'    # generator output (yield)
end
```

## Curriculum Example

This curriculum will train the concept `get_high_score`.

Select the Inkling tab to see the Inkling code.

```inkling
curriculum get_high_score_curriculum
  train get_high_score
  with simulator breakout_simulator
  objective score
    # lessons listed here
end
```

### get high score
‍
In this example:

* **curriculumName:** get_high_score_curriculum
* **conceptName:** get_high_score
* **trainingSpecifier:** simulator
* **simulator** the keyword to indicate that this is training on a simulator
* **simulatorName**: breakout_simulator
* **objectiveName:** score

### digit

This curriculum trains the Digit concept. This example references the MNIST database which is used to train for recognition of handwritten digits.  This example shows the use of the **data** training specifier (which is not supported during private beta) for that data set. When training **with data** the labeled data set must be read in from a file and then prepared and split into training and test partitions. That is shown below.

```inkling
from utils import split

schema MNIST_schema
  String text,
  Luminance(28, 28) image
end
```


```inkling
# Here the MNIST labeled data set is brought into Inkling:

datastore MNIST_data(MNIST_schema)
copy "mnist-training.csv" into MNIST_data with format = "csv"

 # Training 'with data'
curriculum digit_curriculum
  train Digit
  with data
  objective equality  
  training_data, test_data = split(MNIST_data, 0.8, shuffle=True)
    # lessons specified here
end
```

In this example:

* **curriculumName:** digit_curriculum
* **conceptName:** Digit
* **trainingSpecifier:** data
* **objectiveName:** equality
* **assignment**:
* **training_data:** variable name for subset of data portioned aside for training.
* **test_data:** variable name for subset of data portioned aside for testing.
* '**=**': represents the assignment of the result of the split function to the two variable names.
* **split function:** splits the data and labels it.
* **MNIST_data:** the data set used for training and testing.
* **0.8:** the amount to split the data by. 80% of the data goes to training. The remaining data (20%) goes to testing.
* **shuffle=True:** sets the shuffle parameter to true.

[1]: ./inkling-guide.html#example-mountain-car
