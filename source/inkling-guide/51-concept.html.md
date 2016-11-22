
[Source](http://docs.bons.ai/inkling-guide-pages/51-concept "Permalink to (5.1) concept - Bons.ai")

# (5.1) concept - Bons.ai

Reference for the keyword concept. Also, describes the keywords: **predicts, input**, **output**,** is**, **follows**, **end**, and **feeds**.

### What is it?

**concept** (the keyword) declares an abstract concept (the idea) for the system to learn.

### Why do I use it?

A concept statement describes what the computer will learn. It can be a feature (such as a curvy line in an image) or a goal (such as high score in a game).

### How Do I Use It?

A typical concept statement:

> **concept** _conceptName
_   **is** (classifier | estimator)
   **predicts** (_outputSchema_)
   **follows** _preceedingConcept1_, input(schemaName)
   **feeds** output, _subsequentconcept_
**end**

### Breakdown of Concept statement

* **concept:** declares an abstract concept for the system to learn.
* **is:** specifies the kind of prediction the trained concept will produce (**classifier** or **estimator**).
* **predicts: **declares the concept's output.
* **follows: **declares the concepts or streams the concept gets input from.
* **feeds: **declares the list of concepts and streams that have this concept's output as input.
* **end: **delimiter that declares the end of this statement.

### Curriculum Statement Syntax

> conceptStmt :=
**concept**
>
>    **is** [ _classifier_ | _estimator_ ]
>
>    **predicts** '(' _schemaRef_ ')'
   [
      **follows
**        _inputSource_ [',' _inputSource_ ]*                                   ]?
    [
      **feeds**
       _outputTarget_ [',' _outputTarget_ ]*
>
>     ]?
**end**
>
> inputSrc :=
   **input** '(' _schemaRef_? ')' |  // concept or stream name
>
> outputTarget :=
    **output** |                    // concept or stream name

### Rules

* The concept must be named after the **concept** keyword.
* The **is **keyword specifies the kind of prediction the trained concept will produce. For example, a concept can specify is classifier. This means that the trained concept will categorize its input. Email, for example, can be classified as spam or not spam. Another option with this keyword is estimator.
* The concept must declare an output schema after **predicts**. The output schema describes the data produced by the trained concept. For example if this concept classifies email into spam and not spam, the output schema for the concept would be a Bool. The output schema can be a named schema, where the name refers to a full schema definition elsewhere, or it can be anonymous, which is a parenthesized list of name, type pairs. See the section on schema declarations for more information.
* A trained concept gets input from streams or (if multiple concepts are used) from another concept. Input (the keyword) refers to the stream that is the original input to the system. All data flowing through the system has a schema associated with it. In some cases this is calculated rather than explicit.
* If the input keyword appears in the **follows** list, it means that the input stream flowing into this concept comes from outside the BRAIN. The input keyword must always be accompanied by a schema (named or anonymous) because the data stream originates outside the Brain; if no schema was present, data types and formats being input would be unknown.
* The **feeds** list is a list of concepts and streams (including the predefined output stream) for which this concept's output is a source.
* The input keyword cannot not appear in the feeds list and the output keyword cannot appear in the follows list.
* The concept statement is terminated by the **end** keyword.

### Examples

#### Get High Score

Our concept is get_high_score.

> **concept** get_high_score
   **is** classifier
   **predicts** PlayerMove
   **follows** input(GameState)
   **feeds** output
**end**

In this example:

* **conceptName:** get_high_score
* **class: **classifier
* **outputSchema:** PlayerMove
* **input(schemaName):** input(GameState)
* **dependent: **output

#### Digit

Our concept is a digit.

> **concept** Digit
     **is** classifier
     **predicts** MNIST_output
     **follows** Curvature, Segments, input(MNIST_input)
**end**
>
> **concept** Curvature
   **is** classifier
   **predicts** (curve_output)
   **follows** input(MNIST_input)
**end**
>
> **concept** Segments
   **is** classifier
   **predicts** (segments_output)
   **follows** input(MNIST_input)
**end**

In this example:

* **conceptName:** Digit
* **kind: **classifier
* **predicts:** MNIST_output
* **follows:**
* **     Curvature:** a concept
* **     Segments:** another concept
* **    input(MNIST_input):** The input keyword indicates the predefined input      stream with data formats defined by schema MNIST_input.
* **feeds: **output

‍

* **conceptName:** Curvature
* **kind: **classifier
* **predicts:** curve_output
* **follows:**
* **    input(MNIST_input):** The input keyword indicates the predefined input **    **stream with data formats defined by schema MNIST_input.

‍

* **conceptName:** Segments
* **kind: **classifier
* **predicts:** segments_output
* **follows:**
* **    input(MNIST_input):** The input keyword indicates the predefined input **    **stream with data formats defined by schema MNIST_input.

  
