
[Source](http://docs.bons.ai/inkling-guide-pages/24-concepts "Permalink to (2.4) Concepts - Bons.ai")

# (2.4) Concepts - Bons.ai

A concept in Inkling is an (abstract) idea. In Inkling, the concept defines what you are going to teach the AI. For more information about using the concept keyword, refer to the [concept reference][1].

Every inkling program needs at least one concept. If there is more than one, determine which one is your main concept. You may have additional concepts to assist in teaching the main concept to your AI.

## Fact and Strategy

When you're thinking about concepts, you can categorize them into two groups: fact and strategy. A fact concept describes the _**state **_of a thing or things, such as an object, a ball, a character, an enemy, a light, a person, etc. The fact concept could be the state of whether that thing is on or off, is hot or cold, is a number or a letter, etc. It can also be a location. A strategy concept describes a _**method **_or _**behavior**_, such as "avoid ghosts", "keep the paddle under the ball", "don't run into walls", "turn lights off".

For a simulator, your final concept is a strategy concept. Generator and data training sources don't permit strategy concepts.

### In a game

If you want to teach your AI to play a game, first choose a main concept. The result of the AI learning this concept should be that it knows how to play the game.

* A **fact concept **would describe something about the current state of the game.
* A **strategy concept** would describe a behavior that, if learned, would help the AI achieve its goal.

For example, consider an Inkling program that teaches an AI to play Pacman. This is a game where you eat dots and run away from ghosts, and the higher the score you get, the better you do. Your main concept could be to get a high score.

Supporting concepts might include "eat dots", "avoid ghosts", "eat fruit", and "avoid blue ghosts". These are strategy concepts. You may also have concepts called "dot location", "ghost location", or "ghost color". These are fact concepts.

You can use a mental model to help you plan out your concepts and data flow.

## Determining Concepts

Determining what concepts to teach may take time. You can use mental models to work out what concepts to write and how data should flow between them.

### Example: Tetris

Consider the game [Tetris][2]. The main concept we want to teach our AI will be the same as the main concept of PacMan. We want the AI to get the highest score possible. This represents that the AI has learned the game. To assist in teaching the main concept, we need to think through the various facts that the AI needs to learn. Here's a short list, but you might be able to think of other facts you'd want to use:

* **active_tetrimino:** the tetrimino (piece) that is active. (fact)
* **tetrimino_location:** the location of the active tetrimino. (fact)
* **tetrimino_speed:** how fast the tetrimino is moving. (fact)
* **clear_base:** fit tetriminos into the base to clear pieces of it. (strategy)

Any of these facts could be written into supporting concepts that would give information to your main concept.

### Example: Home Automation

In our home automation example, let's imagine that we want to save energy by turning off the lights in empty rooms. Our main concept is going to be something like turn_off_lights_empty_rooms. If the AI learns to do the main concept, then we'll have solved our problem. To support this main concept, we need to think about the various facts that the AI needs to know in order to accomplish that behavior. Here's a short list, but you might be able to think of other facts that you'd want to use:

* **light_state:** the on/off state of the lights in each room. (fact)
* **people_home:** The total number of people in the house. (fact)
* **person_location:** The location of each person/the room each person is in. (fact)
* **done_with_it:** The amount of time a person has been out of a room. Or, possibly, the location of the person who left this room. (fact)
* **definitely_empty:** don't shut off lights if someone is coming right back. (strategy)
* **still_in_use:** (a variant of the one above) don't turn off the lights if an empty room might be reoccupied soon.

Any of these facts could be written into supporting concepts that would give information to your main concept.

## Writing Concept Statements

### Classifier and Estimator

In Inkling, your concepts are written as concept statements. The Inkling concept statement includes an ** is **clause which specifies whether the concept is a **classifier **or an **estimator**. This tells the AI what kind of information or prediction it is going to return.

In its simplest form, a classifier is taking in input and returning a classification. In reality, the classifier is taking in input and assigning a score to the possible classifications of that input from a given set. You would specify **is classifier** on your concept if your outcome set is small and unchanging. For example, you want your AI to recognize a written number from 0-10. Your outcome set is 0,1,2,3,4,5,6,7,8,9,10. For every handwritten number that it is shown, it assigns a probability to each number and returns the most likely value (the one with the highest probability).

Estimators are used for larger outcome sets.  You would specify **is estimator **on your concept if you are estimating a value in a very large range, potentially near infinite range. Estimators are often used for control. For example, if you need to turn a dial a certain amount, the AI has to return the direction and how much the dial is being turned. Your AI is estimating both of those from a potentially nearly-infinite range and returning the most likely combination.

## Determining Concept Statements

Determining what concepts to teach may take time. You can use mental models to work out what concepts need.  After you've created your mental model, you can write your schemas (input and output) as well as your concepts. You need to:

* pick a descriptive name for your concept.
* determine whether it is a **classifier **or **estimator**.
* know where it comes in the mental model, and list any concepts that come before it.
* for more information on the concept statement see (reference).

Every concept is trained by a curriculum. For more information about curricula, refer to [curricula and lessons][3].

We suggest you check out all of our examples and tutorials to build your understanding of how to extract concepts out of your problems to enhance the training of your BRAINs.

[1]: http://docs.bons.ai/inkling-guide-pages/51-concept
[2]: https://en.wikipedia.org/wiki/Tetris
[3]: http://docs.bons.ai/inkling-guide-pages/25-curricula-and-lessons
