# Install Prerequisites

If you *do not* have Anaconda installed on your system, go to our [Let's Get Started!][2] guide instead.

conda is a tool for installing and managing Python dependencies. For more information about pip, refer to the [Pip documentation](https://pip.pypa.io/en/stable/).

> Windows

```shell
conda create -n gym-env
activate gym-env
conda install pip
```

> Mac OS

```shell
conda create -n gym-env
source activate gym-env
conda install pip
```

# Setup the Bonsai CLI

Install the Bonsai Command Line Interface tool and configure it. You'll need to have your access code (accessKey). You can find your access code in your account settings at [Bonsai Account Settings](https://beta.bons.ai/accounts/settings).

```shell
pip install bonsai-cli
bonsai configure # Enter key when prompted
```

# Clone a sample project

Clone our sample project, Mountain Car. This project uses [OpenAI Gym's][3] Mountain Car simulation.

```shell
git clone https://github.com/BonsaiAI/gym-mountaincar-sample
```

# Install requirements

Install the mountain car requirements from OpenAI Gym.

```shell
cd gym-mountaincar-sample
pip install -r requirements.txt
```

# Create a BRAIN

Create your BRAIN and give it a name. You can also create a BRAIN from your beta.bons.ai BRAIN Dashboard. You will view your BRAIN's progress on the BRAIN Details page.

```shell
bonsai create myMountainCarBrain
```

# Load sample Inkling into your BRAIN

Load our sample Inkling file for the mountain car simulation.

```shell
bonsai load
```

# Train

Start the training mode for your BRAIN.

```shell
bonsai train start
```
‍

# Connect the simulator for training

Connect the simulator to the BRAIN. Training begins automatically. If the simulator gets disconnected, training resumes from the same point when the simulator is reconnected.

```shell
python mountaincar_simulator.py --train-brain=myMountainCarBrain --headless
```

# View your BRAIN training status

View your BRAIN's training status as it trains on the simulator.

 Go to [**beta.bons.ai**][4].

# Close the simulator

Training mountain car takes about 45 minutes.

**Stop the simulator by closing it.**

# Stop training

Stop the training mode.

```shell
bonsai train stop
```
‍
# Use your BRAIN

After your BRAIN is finished training, it can play the mountain car game.

```shell
python mountaincar_simulator.py --predict-brain=myMountainCarBrain --predict-version=latest
```

[1]: https://bons.ai
[2]: ./getting_started.html#let-39-s-get-started
[3]: https://gym.openai.com/envs/MountainCar-v0
[4]: https://beta.bons.ai
