
[Source](http://docs.bons.ai/getting-started/lets-get-started "Permalink to Let's Get Started! - Bons.ai")

# Let's Get Started! - Bons.ai

Before you begin, you will need to have access to our Beta. If you don't have access yet, request access at [bons.ai][1].

### Step 1. Install Prerequisites

If you have Anaconda installed on your system, go to Step 1 of our [Getting Started with Anaconda][2] guide instead.

###### Windows

1. Download and install Python from [python.org][3].
2. Install Git (e.g. via GitHub desktop for windows - ).
3. You may need to reboot your computer after installing Python and Git to make sure all install settings take effect.

###### Mac OS X

1. Install pip

> **sudo** **easy_install** pip

##### pip is a tool for installing and managing Python dependencies. For more information about pip, refer to .

‍

### Step 2. Setup the Bonsai CLI

Install the Bonsai Command Line Interface tool and configure it. You'll need to have your access code (accessKey). You can find your access code in your account settings at .

> **pip install **bonsai-cli
**bonsai** **configure** _# Follow the instructions to retrieve your key, and enter it when prompted_

###
Step 3. Clone a sample project

Clone our sample project, Mountain Car. This project uses[ OpenAI Gym's][4] Mountain Car simulation.

> **git clone** https://github.com/BonsaiAI/gym-mountaincar-sample

###
Step 4. Install requirements

Install the mountain car requirements from OpenAI Gym.

> **c****d **gym-mountaincar-sample
**pip install **-r requirements.txt

### Step 5. Create a BRAIN

Create your BRAIN and give it a name. You can also create a BRAIN from your beta.bons.ai BRAIN Dashboard. You will view your BRAIN's progress on the BRAIN Details page.

> **bonsai brain create **myMountainCarBrain

###
Step 6. Load sample inkling into your BRAIN

Load our sample inkling file for the mountain car simulation.

> **bonsai brain load** myMountainCarBrain mountaincar.ink

###
Step 7. Train

Start the training mode for your BRAIN.

> **bonsai brain train start **myMountainCarBrain

‍

### Step 8. Connect the simulator for training

Connect the simulator to the BRAIN. Training begins automatically. If the simulator gets disconnected, training resumes from the same point when the simulator is reconnected.

> **python **mountaincar_simulator.py --train-brain=myMountainCarBrain --headless

###
Step 9. View your BRAIN training status

View your BRAIN's training status as it trains on the simulator.

 **Go to** [**beta.bons.ai**][5]**.**

‍

### Step 10. Close the simulator

Training mountain car takes about 45 minutes.

**Stop the simulator by closing it.**

‍

### Step 11. Stop training

Stop the training mode.

> **bonsai brain train stop** myMountainCarBrain

‍

### Step 12. Use your BRAIN

After your BRAIN is finished training, it can play the mountain car game.

> **python **mountaincar_simulator.py --predict-brain=myMountainCarBrain --predict-version=latest

[1]: https://bons.ai
[2]: http://docs.bons.ai/getting-started/getting-started-with-anaconda
[3]: https://www.python.org
[4]: https://gym.openai.com/envs/MountainCar-v0
[5]: https://beta.bons.ai

  
