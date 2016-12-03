---
title: Getting Started with Anaconda

language_tabs:
  - shell

toc_footers:
  - <a href='https://bons.ai/sign-up'>Sign Up for our Private Beta!</a>
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

includes:

search: true
---

# Getting Started with Anaconda - Bons.ai

<aside class="success">Before you begin, you will need to have access to our Beta. If you don't have access yet, request access at [bons.ai][1].</aside>

# Step 1. Install Prerequisites

<aside class="warning">If you *do not* have Anaconda installed on your system, go to our <a href=http://docs.bons.ai/getting-started/lets-get-started>'Let's Get Started</a>! guide instead.</aside>

<aside class="notice"> conda is a tool for installing and managing Python dependencies. For more information about pip, refer to <a href='https://pip.pypa.io/en/stable/'>the Pip documentation</a>.</aside>

## Windows

```
conda create -n gym-env
activate gym-env
conda install pip
```

## Mac OS X  

```
conda create -n gym-env
source activate gym-env
conda install pip
```

# Step 2. Setup the Bonsai CLI

Install the Bonsai Command Line Interface tool and configure it. You'll need to have your access code (accessKey). You can find your access code in your account settings at .

```
pip install bonsai-cli
bonsai configure # Enter key when prompted
```

# Step 3. Clone a sample project

Clone our sample project, Mountain Car. This project uses[ OpenAI Gym's][3] Mountain Car simulation.

```
git clone https://github.com/BonsaiAI/gym-mountaincar-sample
```

# Step 4. Install requirements

Install the mountain car requirements from OpenAI Gym.

```
cd gym-mountaincar-sample
pip install -r requirements.txt
```

# Step 5. Create a BRAIN

Create your BRAIN and give it a name. You can also create a BRAIN from your beta.bons.ai BRAIN Dashboard. You will view your BRAIN's progress on the BRAIN Details page.

```
bonsai brain create myMountainCarBrain
```

# Step 6. Load sample inkling into your BRAIN

Load our sample inkling file for the mountain car simulation.

```
bonsai brain load myMountainCarBrain mountaincar.ink
```

# Step 7. Train

Start the training mode for your BRAIN.

```
bonsai brain train start myMountainCarBrain
```
‍

# Step 8. Connect the simulator for training

Connect the simulator to the BRAIN. Training begins automatically. If the simulator gets disconnected, training resumes from the same point when the simulator is reconnected.

```
python mountaincar_simulator.py --train-brain=myMountainCarBrain --headless
```

# Step 9. View your BRAIN training status

View your BRAIN's training status as it trains on the simulator.

 Go to [**beta.bons.ai**][4].

# Step 10. Close the simulator

Training mountain car takes about 45 minutes.

**Stop the simulator by closing it.**

# Step 11. Stop training

Stop the training mode.

```
bonsai brain train stop myMountainCarBrain
```
‍
#Step 12. Use your BRAIN

After your BRAIN is finished training, it can play the mountain car game.

```
python mountaincar_simulator.py --predict-brain=myMountainCarBrain --predict-version=latest
```

[1]: https://bons.ai
[2]: http://docs.bons.ai/getting-started/lets-get-started
[3]: https://gym.openai.com/envs/MountainCar-v0
[4]: https://beta.bons.ai
