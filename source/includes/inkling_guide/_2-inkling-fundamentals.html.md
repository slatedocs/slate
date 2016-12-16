## Introduction to Artificial Intelligence

This chapter is intended for developers who have never worked with machine learning.

Inkling is a programming language specifically designed for artificial intelligence (AI); it's a special purpose language. It abstracts away the vast world of dynamic AI algorithms that require expertise in machine learning and enables more developers to program AI. Before you read through this section about the Inkling language, you should familiarize yourself with the various components of the Bonsai Artificial Intelligence Engine, which you can read about in our Getting Started Guide.

###### A Ten-Thousand Foot View

A [ten-thousand foot view][1] of Inkling is described below, and includes a general description of the various components of an Inkling file.

### Schemas: Inputs and Outputs

**Input** is a stream of information that is fed into your BRAIN (your AI). The Bonsai AI Engine uses this information to help train the BRAIN or make a prediction.

In Inkling, **Output** is a stream of information returned as a prediction that your BRAIN sends back to an application. It could be sent back to a simulator, if training is in process, or it could be send back to your deployed application, where it might be used for control or optimization. The data in input and output streams are described by schemas. Schemas are declared in your Inkling program, and they contain information about the data types contained in the stream. For example, if you want to teach your AI,  to recognize the shape 'square', you might give it a picture of a shape. That picture would be an input. The BRAIN answers yes (this is a square) or no (this is not a square). That answer is the output. Your inkling file to teach your AI would contain one schema for describing the data type of the input (Luminance, an image type) and another for the output (Bool). For more information about schemas, refer to [schema][2] in the reference section.

### Mental Models and Concepts

Mental models are a way of organizing concepts so that you can structure a solution to your AI problem as a workflow. Concepts are the ideas that you want to teach your BRAIN. When you create your concepts, you're going to start with the final concept that you want to teach your BRAIN and support it with other fact and strategy concepts. These additional concepts appear upstream of your main concept because the information output from those concepts helps the Bonsai AI Engine teach your main concept to your BRAIN. Mental Models enable you to determine and plan the concepts that are taught to your BRAIN.

For more information about Concepts, refer to [Concepts][3] and the [concept Reference][4].

### Curricula and Lessons

Curricula contain the lesson plan for the lessons that you are using to train your BRAINs. You must have one curriculum for every concept. A curriculum contains information about the training material that you're using to train the BRAIN; this is a simulator, generator, or data set, and it contains an objective, which measures the performance of the BRAIN as it learns your concept. Curricula may also contain expressions that assign portions of your training material for testing. Finally, your curriculum contains lessons. Each lesson teaches a piece of the concept. A curriculum can contain multiple lessons to teach a single concept.  Each lesson may contain different configurations for training the BRAIN. Configurations change how the Bonsai AI Engine uses the training source for training.

**Note:** Currently, during our private beta, you can only train with simulators as your training sources. Additionally, you are limited to one lesson in your curriculum.

### Chapter Summary

In our Fundamentals Chapter, we go into greater detail about the various Inkling components mentioned above. These are broken into the following topics:

[1]: http://dictionary.cambridge.org/us/dictionary/english/10000-foot-view
[2]: https://bonsai.quip.com/TsrpAgmShndg
[3]: #concepts
[4]: #5-1-concept
