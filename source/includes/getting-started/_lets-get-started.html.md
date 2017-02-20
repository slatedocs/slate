# Let's Get Started!

Before you begin, you will need to have access to our Beta. If you don't have access yet, request access at [bons.ai][1].

## Install Prerequisites

If you have Anaconda installed on your system, go to Step 1 of our [Getting Started with Anaconda][2] guide instead.

### Windows

1. Download and install Python from [python.org][3].
2. Install Git (e.g. via GitHub desktop for windows).
3. You may need to reboot your computer after installing Python and Git to make sure all install settings take effect.

> Mac OS

```shell
sudo easy_install pip
```

### Mac OS X

1. Install pip

**pip is a tool for installing and managing Python dependencies. For more information about pip, refer to the [Python Package Authority][6].**

## Setup the Bonsai CLI

Install the Bonsai Command Line Interface tool and configure it. You'll need to have your access code (accessKey). You can find your access code in your account settings at [Bonsai Account Settings](https://beta.bons.ai/accounts/settings).

```shell
pip install bonsai-cli
bonsai configure # Follow the instructions to retrieve your key, and enter it when prompted
```

## Clone a sample project

Clone our sample project, Mountain Car. This project uses [OpenAI Gym's][4] Mountain Car simulation.

```shell
git clone https://github.com/BonsaiAI/gym-mountaincar-sample
```

## Install requirements

Install the mountain car requirements from OpenAI Gym.

```shell
cd gym-mountaincar-sample
pip install -r requirements.txt
```

## Create a BRAIN

Create your BRAIN and give it a name. You can also create a BRAIN from your beta.bons.ai BRAIN Dashboard. You will view your BRAIN's progress on the BRAIN Details page.

```shell
bonsai brain create myMountainCarBrain
```

## Load sample inkling into your BRAIN

Load our sample inkling file for the mountain car simulation.

```shell
bonsai brain load myMountainCarBrain mountaincar.ink
```

## Train

Start the training mode for your BRAIN.

```shell
bonsai brain train start myMountainCarBrain
```

## Connect the simulator for training

Connect the simulator to the BRAIN. Training begins automatically. If the simulator gets disconnected, training resumes from the same point when the simulator is reconnected.

```shell
python mountaincar_simulator.py --train-brain=myMountainCarBrain --headless
```

## View your BRAIN training status

View your BRAIN's training status as it trains on the simulator.

 **Go to [beta.bons.ai][5].**

## Close the simulator

Training mountain car takes about 45 minutes.

**Stop the simulator by closing it.**

## Stop training

Stop the training mode.

```shell
bonsai brain train stop myMountainCarBrain
```

## Use your BRAIN

After your BRAIN is finished training, it can play the mountain car game.

```shell
python mountaincar_simulator.py --predict-brain=myMountainCarBrain --predict-version=latest
```

[1]: https://bons.ai
[2]: ./getting-started-with-anaconda.html
[3]: https://www.python.org
[4]: https://gym.openai.com/envs/MountainCar-v0
[5]: https://beta.bons.ai
[6]: https://pip.pypa.io/en/stable/
