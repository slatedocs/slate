# Mental Models

Mental models are a way of organizing concepts so that you can structure your data flow. Concepts are the ideas that you want to teach your BRAIN.

## Determining Mental Models

Your mental models should help you plan the concepts you're going to write in your Inkling file. Therefore, when you're determining your mental models, we suggest that you think about the condition that means the AI has successfully learned what you wanted it to learn. This could be:

* Learning to play a game
* Learning to recognize what a handwritten digit is
* Learning to tell if something is red or what color something is
* Learning to save electricity in your home
* Learning to manage a process to specific guidelines

After you've determined your success condition or criteria, you want to decide what the AI can do to prove it has successfully learned that condition. In a game, this could be, "I think if the AI can get a high score, it has successfully learned to play the game." For recognizing red things, this could be, "I think if the AI can successfully tell when something it is shown is red or not red it will have learned to recognize red things." This becomes your final** concept**, and it also ties into your objective (reward), which measures how successful the AI is at learning this concept.

For more complex goals and many use cases, you need multiple concepts that all become part of training your final concept. These additional concepts support your final concept and can also reduce the time it takes to train your BRAIN. For more information about determining concepts, refer to the next chapter.

For each concept, you will need to determine what the AI needs to take in to make its decision and what the AI returns after it has decided. All of the information your AI needs to take in before it can train on any of the concepts is bundled together and labeled as **input**. Each concept returns some information, but additional concepts feed their returned information to assist in training the final concept. Training on the final concept returns information that is sent from the BRAIN to the simulation. This is the **output**.

Your mental model can be mapped from left to right, starting with your input. Your other concepts come next, followed by your final concept, and finally, to the right, is your output. Your output is fed back through the Bonsai AI Engine to the application. You can draw arrows between the various nodes to represent data flow. Your concepts are trained in order. To visualize this more clearly, see our expanded example below.

## Examples

### Example: Breakout

```
concept get_high_score
    is classifier
    predicts (PlayerMove)
   follows input(GameState)
   feeds output
end
```

For example, our mental model for teaching an AI to play the game Breakout looks like this:

![][1]

Single concept model for learning breakout

The **input** is a snapshot of the game in its current state.

The **concept**, get_high_score, is our final** concept**. It describes what we want our BRAIN to learn to play the Breakout simulation, which means we've decided that being able to get a high score means that it's learned how to play the game. This single concept mental model is sufficient to train a BRAIN to play the game, but this training may take a long time.

The **output** is the move that the AI wants to make. It chooses from left, right, or no move. The input and output are described in the schemas portion of the Inkling file.

To speed up training time and enable to learn the get_high_score concept more concretely, you can expand this mental model and include more concepts.

```
concept get_high_score
    is classifier
    predicts (PlayerMove)
    follows input(GameState), keep_paddle_under_ball
   feeds output
end

concept keep_paddle_under_ball
  is classifier
   predicts (PlayerMove)
   follows input(GameState), ball_location
  feeds output
end
```

In this example, we've added two extra concepts that support our final concept and give our BRAIN more information to work with. The concept of ball_location feeds information into the concept keep_paddle_under_ball, and that concept feeds information into get_high_score.

The input remains the same as above. The AI has two additional concepts to train. When it is training the ball_location concept, it takes in the input and returns the coordinates of the ball. On the keep_paddle_under_ball concept, it takes in the input and the ball coordinates from ball_location. Then, that concept returns the best move to attempt to keep the paddle underneath the ball. The final concept, get_high_score, takes in the input and the move returned from keep_paddle_under_ball and returns the move it wants, which is the output sent to the simulator through the Bonsai AI Engine. Each of these concepts are trained from input to output.

[1]: https://daks2k3a4ib2z.cloudfront.net/57bf257ce45825764c5cb54b/57e8306180de1910630554d7_Screen%20Shot%202016-09-12%20at%2005.58.28.png
