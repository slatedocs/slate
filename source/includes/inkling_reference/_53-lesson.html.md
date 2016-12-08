## lesson

Reference for the keyword **lesson**. Also, describes the keywords: **follows**, **configure**, **constrain**, **until**, **minimize**, **maximize**, **configure**, **with**, and **end.**

### What is it?

The **lesson** (keyword) declares an individual lesson for the concept being trained by the curriculum.  Lessons are contained within curriculum statements. A curriculum can contain multiple lessons.

### Why do I use it?

Lessons give you control over the training of the mental model. They allow you to break down the training of the concept into phases where each phase is implemented by a lesson.

### How do I use it?

> Below we show the clauses a lesson can contain.

```
lesson lessonName
  follows prevLessonName
  configureClause
trainClause
testClause
untilClause
```

Lessons allow the machine to learn the concept in stages rather than all at once. In the example below we show lessons that break into stages the task of  playing the game breakout. The first lesson, constant_breakout, trains the machine with a set of fixed values as configuration parameters. The second lesson, vary_breakout, which **follows** constant_breakout, trains the machine with a set of configuration parameters that vary according to specified type constraints.

```
schema BreakoutConfig   # configured in configureClause     UInt32 level,
    UInt8{1:4} paddle_width,
    Float32 bricks_percent
end

curriculum ball_location_curriculum
    train ball_location
    with simulator breakout_simulator
    objective ball_location_distance

        lesson constant_breakout
            configure           # configure to constant values
              constrain bricks_percent with Float32{0.5},
              constrain level with UInt32{1},    # e.g. level = 1 constrain paddle_width with UInt8{4}
            train
              from frame in breakout_simulator
              select frame
              send frame
            test
              from frame in breakout_simulator
              select frame
              send frame
            until
              minimize ball_location_distance

        lesson vary_breakout follows constant_breakout
            configure          # configure to type constraints
              constrain bricks_percent with Float32{0.1:0.01:1.0},
              constrain level with UInt32{1:100}, # e.g. level varies from 1..100
              constrain paddle_width with UInt8{1:4}
            train
              from frame in breakout_simulator
                select frame
                send frame
            test
                from frame in breakout_simulator
                select frame
                send frame
            until
                minimize ball_location_distance
end
```
‍
Lesson clauses have defaults so if a clause is not specified the default will be assumed. Also in certain circumstances not all  clauses are available. (The specific rules appear in the lesson clauses table below.)

The two lessons above are different in their configure clause. The first sets the fields in the configuration schema to constant values and the second lesson, vary_breakout, generates sets of values constrained by the type constraint. The syntax diagram below for constrainedType shows the syntactic rules for type constraints.

Note that the **constrain** name in the example above specifies a field in the configuration schema for the simulator. These fields in the example are bricks_percent, level, and paddle_width. When such fields are initialized with values from a type constraint they are often called placeholders.  This means that the name is is not the name of a specific value but rather it is the name of a range of values which will be input during training.

You can find more discussion of type constraint rules in the [schema][1] section. (Schema declarations can also use type constraints.)

###### -Lesson Syntax

> lessonStatement :=

```
lesson**
    [follows ]?
    configureClause?
    trainClause?
    untilClause?
    testClause?
```
‍

###### -Lesson Configure Clause Syntax

> configureClause :=

```
configure
       [constrain  with constrainedType]+
```

>  constrainedType :=

```
numericType
'{'
    start ':' [ step':']? stop   # 1:2:10. Called a 'colon range'.
                                # Specifies 'step' (default=1).
|
    start '.' '.' stop ':' numSteps # 1..10:5  Called a 'dot range'.
                                          # Specifies 'numsteps'.    '}'
```

> numericType :=

```
Double | Float64 | Float32 | Int8 | Int16 | Int32 |  Int64 | UInt8 | UInt16 | UInt32  | UInt64
```
‍

The testClause and the trainClause have identical syntax except for their keyword (**train** or **test**).  However they both vary depending on the trainingSpecifier in the curriculum. The **expect** is only available in those cases that have known expected values, and that occurs when the trainingSpecifier is **data** or **generator**.

###### -Lesson Train/Test Clause Syntax

> trainClause :=

```
train
  fromClause
    send
    [expect <name>]?    # only valid for data or generator trainingSpecifer
```

> testClause :=

```
test
  fromClause
    send
    [expect <name>]?    # only valid for data or generator trainingSpecifer
```
‍
The fromClause in the test/train syntax is used to name and describe the training data that is sent by the system (either from a labeled data set, in the **data** case, or by the generator or simulator) to the lesson.  Here is an example where the fromClause is shown in a curricululm which trains the machine to recognize line segments in an image. The generator segments_generator sends an image and expects num_segments in return. The returned num_segments is expected to match the generator's num_segments value.

```
‍generator segments_generator(UInt8 segmentCount)
    yield (segments_training_schema)     # training will yield data with this schema
end

schema segments_training_schema
    UInt8{0:10} num_segments,
    Luminance(28, 28) image
end

curriculum segments_curriculum
    train Segments
    with generator segments_generator
    objective segments_objective
        lesson segments
           configure
               constrain segmentCount with UInt8{0:10}
           train
               from item in segments_generator # segments_generator's yield clause
                   select item                 # specifies the appropriate schema.
                   send item.image             # A field in segments_training_schema
                   expect item.num_segments    # A field in segments_training_schema
end
```
‍
The untilClause in the lesson specifies the termination condition for training. The untilClause in our breakout example above was this:

```
until
  minimize ball_location_distance
```
‍
This means train until the curriculum objective (ball_location_distance) is minimized. Here is the syntax for the untilClause.

‍

###### -Lesson Until Clause Syntax

> untilClause :=

```
until
  (

    [ minimize | maximize ]
    |
    <objectiveFunctionName> relOp constantExpression               )
```

> relOp :=

```
           '==' | '<' | '>' | '<=' | '>='
```

The untilClause is only required if the curriculum trainingSpecifier is **simulator**.  If this curriculum has a trainingSpecifier of **data** or **generator**, the until clause is optional. If it is not present, a default with value minimize will be created.

###### -Lesson Clauses Table

Lesson clauses have defaults so if a clause is not specified the default will be assumed. Also in certain circumstances not all  clauses are available. This table specifies the rules. Recall that the trainingSpecifier appears after the keyword **with** in the curriculum.

![][2]

Table for Lesson Clauses

###### -Lesson Rules

* To summarize the table above, for a lesson associated with a trainingSpecifier of **data**: one or both of the lesson clauses **train** and **test** are required (and there are no default versions of these clauses).
* Test clause is optional for any particular lesson. However if the last lesson has no test clause it is an error.
* The _follows_ clause on the lesson is optional. **Note:** If there is no _follows_ clause and the lessons are executed in parallel, training will be slower.
* To summarize the table above: for a lesson associated with a trainingSpecifier of **generator** or **simulator**:
    - if neither the **test** or **train** lesson clauses are present, defaults for       both clauses are generated. (See the above table for default details.)       Otherwise, no defaults are generated.
* Lesson statements appear within curriculum statements.
* Lesson statements may contain the following keywords: configure, train, test, and until.
* Lessons appear after the objective clause in curriculums.
* Lessons can be ordered, using the **follows** clause. Note that this ordering is a suggestion to the instructor, not a hard and fast rule.

[1]: http://docs.bons.ai/inkling-guide-pages/54-schemas-inkling-types-and-type-constraints
[2]: https://daks2k3a4ib2z.cloudfront.net/57bf257ce45825764c5cb54b/57e8edb6507ff363506fcb75_Screen%20Shot%202016-09-26%20at%2005.42.50.png
