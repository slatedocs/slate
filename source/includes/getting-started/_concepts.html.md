# Architecture

[//]: # (If any commented statements become false, change prior text)

There are some things you might want to know before you get started. In this section, we're going to walk you through the Bonsai Platform components and some of the basic Bonsai concepts. Let's jump right in!

## What are the components of the Bonsai Platform?

The image below displays all of the components of Bonsai's platform. It enables developers to more efficiently build, teach and use intelligence models:

![The Bonsai Platform][1]

## Build

* **Bonsai Command Line Interface (CLI):** is a command line tool that enables you to configure and control the Bonsai Artificial Intelligence (AI) Engine.
* **beta.bons.ai:** The address for Bonsai's beta web interface; this is the browser based tool that includes your *BRAIN Dashboard* and *BRAIN Details* page.
* **Simulators:** are currently the only training source available. Simulators are often a complex, interactive virtual environment. They usually have state, which is a representation of the world inside the virtual environment.
* **Generators:** are a training source. They produce labeled data programmatically. This data is effectively infinite. A generator could, for example, produce a random (but known) integer, set of line segments, etc.
* **Data:** is another training source. It is information related to the concepts being trained that are used for training or test and evaluate how well the training is implemented. Non-generated data may sometimes be difficult to find, and the data that exists may be a very small set or difficult to label. An example of a data set you could train with is the MNIST database, which is a collection of handwritten digits used for training image processing systems and other machine learning systems.

**Note:** Currently, during our private beta, you can only train with simulators as your training source.

[//]: # (Simulators are the only training source, beta.bons.ai is current website instead of brains.bons.ai)

## Teach

* **Inkling:** our unique, special purpose, pedagogical programming language. Pedagogical programming is a new programming paradigm. It expresses the solution to a problem in terms of how you teach the computer to find the solution as opposed to how to calculate the solution.
* **Bonsai Artificial Intelligence (AI) Engine:** abstracts away and automates the low-level mechanics of artificial intelligence. Each Inkling program developed is fed into the Bonsai AI Engine in order to generate and train appropriate models (referred to as BRAINs).

## Use

* **Mastermind:** the Bonsai AI application for building AI. This tool will contain our Integrated Development Environment (IDE). **Note:** This tool will not be available for the private beta.
* **SDK & Libraries:** enables you to connect your own simulators to the Bonsai AI Engine. They also enable you to integrate your application with your BRAIN.
* **HTTP API:** enables AI creators and AI users to interact with the Bonsai AI Engine.

###  After your BRAIN is created and trained, you can use it with your app. Ultimately, our platform enables you to build AI agents that work (or play) for you without a deep knowledge of machine learning.

[//]: # (Mastermind not available)

# What is a BRAIN? What is the Bonsai Artificial Intelligence Engine?

A BRAIN, **Basic Recurrent Artificial Intelligence Network**, is an individual AI agent, and it is programmed to learn using Inkling. Each BRAIN lives in the **Bonsai AI Engine** which manages and automates much of the lower level complexities of working with artificial intelligence.

The Bonsai AI Engine contains a vast array of machine learning algorithms, manages data streaming and data storage, and provides the efficient allocation of hardware resources. It is built with an infrastructure that supports streaming data efficiently through the system, and it uses a set of heuristics to make choices about which learning algorithms to use to train each BRAIN. The set of heuristics also make it possible for it to choose from any number of possible algorithms, topologies, etc., train all of them in parallel, and pick the best result.

For example, if the BRAIN Server picked Deep Q-Learning, which is a machine learning algorithm, then the system also picks the appropriate topology, hyper-parameters, and initial weight values.

The Bonsai AI Engine also determines when to train each concept, how much (or little) to train each concept based on its relevance, and, ultimately, produces a trained BRAIN. Furthermore, it does something we call **meta-learning**. Meta-learning means that the system keeps a kind of memory or record about each program it's seen, the data it used for training, and the generated AIs that it's made. It also records how fast those AIs trained and how accurate they became. The BRAIN server is continuously learning and improving over that dataset.

### You might say the system learns to make learning systems.

## What is a simulator?

A simulator imitates a real world situation in a virtual environment, which enables a user to model and test situations that would often, otherwise be very complicated to set up and test. Your simulator could be a game, such as breakout, or an emulation of a real world process, such as a self driving car. Training with simulators is especially useful for optimization, or for use with complex control problems that can be modeled in a simulator.

**IMPORTANT:**  Currently, a simulation runs on your local machine and streams data to the BRAIN server for training. This means your computer needs to remain connected to the Bonsai AI Engine while your BRAIN is training. If your computer is disconnected from the server you can reconnect within an hour and it will pick back up where it left off. Otherwise, your training will start on a new version (your old training is still saved to the previous version). If you want to leave your training running overnight, please make sure that your computer will stay connected by turning off sleep functionality. 

[//]: # (1 hour timeout, no auto-reconnect)

Today, we only support simulators written in python. To learn more about connecting your own simulator, refer to our SDK Reference (Coming soon!).

[//]: # (Simulators only in Python, No SDK Reference)

## What is training?

Training means teaching a simulator to get a specific outcome. The training involves using a specific set of concepts, a curriculum, and lessons, which are described in the Inkling file.

## What is Inkling?

**Inkling** is a our programming language designed to express higher level abstractions related to teaching.

Inkling enables us to use a teaching-oriented approach, also known as Pedagogical Programming, for training AI. It provides a set of foundational primitives that can be used to represent AI without specifying how the AI is created. By abstracting away the underlying algorithms and techniques, you can focus on creative ways to describe your problems and leave the heavy lifting to us.

This means that you, the developer, can leverage your domain-specific expertise about the problem space and leverage our expertise about machine learning.

Inkling is designed to enable you to solve any AI problem whether learning to label images or controlling a simulation. In the current version, Bonsai's technology is focused on solving control and optimization problems using simulation. When you train a BRAIN to solve an AI problem, you write a file in Inkling that teaches the AI to solve it. Inkling files describe the concepts that you want to teach and the curriculum and lessons for teaching them.

To learn more about Inkling, refer to our [Inkling Guide][2].

## What is the Bonsai Command Line Interface?

The Bonsai Command Line Interface (CLI) is a command line tool that enables you to configure the Bonsai AI Engine. The CLI is especially useful for automation and connection to other tools. Currently, there are some actions that can only be performed using the CLI, such as loading your Inkling file and connecting your simulator.

To learn more about the Bonsai CLI, refer to our [CLI Reference][3].

## beta.bons.ai

The Bonsai Beta Website is a browser-based tool for configuring and analyzing BRAINs stored in the Bonsai AI Engine. In the future, this website will be useful for sharing BRAINs, collaborating, and learning. There is some information you can only get from beta.bons.ai, such as a visualization of a BRAIN's training progress.

[//]: # (Website is directed at beta.bons.ai, there are no BRAIN sharing features)

### **BRAIN Dashboard**

Your BRAIN Dashboard contains all of your BRAINs. The BRAIN Dashboard is also where you can create new BRAINs.

### **BRAIN Details**

There is a BRAIN Details page for each of your BRAINs. Each page shows that BRAIN's status, training graph, and commands you can use in the CLI specifically for this BRAIN.

[1]: https://daks2k3a4ib2z.cloudfront.net/57bf257ce45825764c5cb54b/57e5bb2cab226c7d49d033f5_bonsai_infographic_2x_1024.png
[2]: ./inkling.html
[3]: ./reference.html#cli-reference
