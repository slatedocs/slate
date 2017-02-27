# Install Prerequisites

[//]: # (If any commented statements become false, change prior text)

Before you begin, you will need to have access to our Beta. If you don't have access yet, request access at [bons.ai][1].

The next section walks you through how to install Git, Python, and pip, but if you're already ahead of the curve and **have them all installed**, skip down to [Setup the Bonsai CLI][2]. 

<aside class="notice">
We highly recommend macOS users download Python directly in the Manual Install instructions or use <a href="http://brew.sh/">Homebrew</a> so you can perform the following steps on user-land Python rather than <a href="https://github.com/MacPython/wiki/wiki/Which-Python">system Python</a>.
</aside>

**There are three sets of install instructions, please pick the one that suits your situation:**

1. If you have **Anaconda** installed on your system, skip down to [Install with Anaconda][9].
2. If you have **Chocolatey (Windows)** or **Homebrew (macOS)** installed on your system, skip down to [Install with Chocolatey or Homebrew][17].
3. If you *do not* have Chocolatey, Homebrew, or Anaconda installed on your system continue to follow our **Manual Install** intructions below.

<aside class="notice">
The two tabs to the right allow you to follow this guide as a macOS or Windows user. Instructions also vary slightly between Python 2 and Python 3 so please be sure to follow your version's instructions.
</aside>

## Manual Install

### Windows

* **Git**: Download and install Git from [Git for Windows][11]. 
* **Python**: Download and install Python (3.6 or 2.7) from [python.org][3].

<aside class="warning">
For users installing <b>Python 2.7</b>: Make sure to include adding Python to your PATH when customizing your install on the third screen. <br>
For users installing <b>Python 3.6</b>: Make sure to check the box on the first screen of the install to add Python to your PATH.
</aside>

* **pip**: Python version 2.7.9 and greater come with pip, but if for some reason you need to use a different version of Python please follow [these instructions][12].

<aside class="notice">
Please remember to reboot your computer after installing Python and Git to make sure all install settings take effect.
</aside>

**Great!** Now that you have Git, Python, and pip installed, you can skip down to [Setup the Bonsai CLI][2]. 

### macOS

* **Git**: Git is more than likely already installed on your computer if you have Xcode, but if not, run `git` from your command prompt and the system will prompt you to install.
* **Python**: Download and install Python (3.6 or 2.7) from [python.org][3].

<aside class="notice">
We highly recommend macOS users download Python directly so you can follow this guide on user-land Python rather than <a href="https://github.com/MacPython/wiki/wiki/Which-Python">system Python</a>.
</aside>

* **pip**: Python version 2.7.9 and greater come with pip (or pip3 for version 3+), but if for some reason you need to use a different version of Python please follow [these instructions][12].

**Great!** Now that you have Git, Python, and pip installed, you can skip down to [Setup the Bonsai CLI][2]. 

## Install with Chocolatey or Homebrew

If you *do not* have Chocolatey or Homebrew installed on your system, please go to the [Manual Install][18] or [Install with Anaconda][9] instructions.

> Python 2

```powershell
choco install git
choco install python2
```
```shell
brew install python
```

> Python 3

```powershell
choco install git
choco install python
```
```shell
brew install python3
```

### Windows

**If you're already familiar with [Chocolatey][14], follow these instructions.**

<aside class="notice">
Please remember to run choco commands in administrator powershell or command prompt.
</aside>

### macOS

**If you're already familiar with [Homebrew][6], follow these instructions.**

* **Git**: Git is more than likely already installed on your computer if you have Xcode, but if not, run `git` from your command prompt and the system will prompt you to install.
* **Python**: Run the install command on the tab to the right to `brew install` the Python version of your choice.

## Install with Anaconda

```
conda install git
```

If you *do not* have Anaconda installed on your system, please go to the [Manual Install][18] or [Install with Chocolatey or Homebrew][17] instructions.

`conda` is a tool for installing and managing Python and R dependencies. Anaconda includes Python and pip, so all you need to do is install Git if you haven't already. For more information, refer to the [Anaconda website][10].

# Setup the Bonsai CLI

> Python 2 and Anaconda

```
pip install bonsai-cli
bonsai configure
```

> Python 3

```powershell
# same as above
```
```shell
pip3 install bonsai-cli
bonsai configure
```

From your command prompt, install the Bonsai Command Line Interface tool and configure it. `bonsai configure` will ask for your Access Key. You can find your Access Key in your [Bonsai Account Settings][8].

## Clone a sample project

Clone a sample simulation project with `git clone`. For this guide we'll be walking you through [OpenAI Gym's Mountain Car][4] environment, one of the supported Bonsai simulators.

```
git clone https://github.com/BonsaiAI/gym-mountaincar-sample
```

## Install requirements

> Python 2 and Anaconda

```
cd gym-mountaincar-sample
pip install -r requirements.txt
```
> Python 3

```powershell
# same as above
```
```shell
cd gym-mountaincar-sample
pip3 install -r requirements.txt
```

Enter into the Mountain Car folder and then install the Mountain Car requirements from OpenAI Gym.

# Create your BRAIN

Create your BRAIN and give it a name. You can also create a BRAIN from your [beta.bons.ai][5] BRAIN Dashboard instead of using the command line. Either way, you will view your BRAIN's progress on the BRAIN Details page.

### Create from Web

![BRAINS Dashboard Page][15]

The dashboard has a NEW BRAIN button, pictured above. Click on it to start the BRAIN creation process, where you're provided a form to give your brain a name and description. Name can contain alpha, numerals, or hyphens; the description is arbitrary and should contain human-readable text that explains your intent for the BRAIN.

### Create from Command Line

```
bonsai create myMountainCarBrain
```
You may give your brain a name with `bonsai create brainName` but there is no option for a description with this method but after you create your BRAIN, you can change its description from the web on the BRAIN Details page.

# Train your BRAIN

## Load sample Inkling into your BRAIN

```
bonsai load
```

Load your sample Inkling file for the Mountain Car simulation.

## Start Training Mode

```
bonsai train start
```

Almost there! Time to tell the AI engine to prepare a new BRAIN version for training. Start the training mode for your BRAIN.

## Connect the simulator for training

> Python 2

```
python mountaincar_simulator.py --train-brain=myMountainCarBrain --headless
```
> Python 3

```powershell
# same as above
```
```shell
python3 mountaincar_simulator.py --train-brain=myMountainCarBrain --headless
```

Everything is in place, it's time to start the simulator and test things out. To do this, call Python and then the simulator file. Training will begin automatically and if the simulator gets disconnected, training resumes from the same point when the simulator is reconnected if it's within an hour of the disconnect. Remember, as mentioned in [What is a simulator?][7] if you want your training to take place overnight, make sure that your computer won't go to sleep and disconnect for more than an hour or that training time will be lost!

<aside class="notice">
We use headless here to indicate we don't need to see a graphical display from the simulator; if you'd like to see it and watch the simulator learn, omit this option.
</aside>

## View your BRAIN training status

View your BRAIN's training status as it trains on the simulator by going to the BRAIN's Dashboard page on [beta.bons.ai][5]. Training Mountain Car takes about an hour to get sufficient training to beat the game most of the time. If you want flawless victories each time the simulator can take up to 2 hours before you'll see the graph level out.

![Fully Trained BRAIN][16]

There is no automatic ending to training, you can train forever, but there will be diminishing returns after a couple of hours. You can play around with training for 15 mins, 30 mins, 1 hour, etc and use your BRAIN to see how well it plays each time! It takes about 700 episodes to train the BRAIN correctly. Our ideal target is an average reward of -195 or higher over 100 consecutive episodes.

[//]: # (Update this when we have multiple concepts and smart ending)

## Stop training

```
bonsai train stop
```

Once we've gotten to this level of performance (or sooner if you prefer), CTRL-C to disconnect the simulator, then `bonsai train stop` will end the training, and proceed to prediction.

# Use your BRAIN

> Python 2

```
python mountaincar_simulator.py --predict-brain=myMountainCarBrain --predict-version=latest
```
> Python 3

```powershell
# same as above
```
```shell
python3 mountaincar_simulator.py --predict-brain=myMountainCarBrain --predict-version=latest
```

After your BRAIN is finished training it can play the Mountain Car game. How well it does depends on how long you let it train! Using your BRAIN involves calling Python on the same simulator file, but now in predict mode, and `--predict-version=latest` will use the latest training session that you just ran.


[1]: http://pages.bons.ai/apply.html
[2]: #setup-the-bonsai-cli
[3]: https://www.python.org
[4]: https://gym.openai.com/envs/MountainCar-v0
[5]: https://beta.bons.ai
[6]: http://brew.sh/
[7]: #what-is-a-simulator
[8]: https://beta.bons.ai/accounts/settings
[9]: #install-with-anaconda
[10]: https://www.continuum.io/anaconda-overview
[11]: https://git-for-windows.github.io/
[12]: https://pip.pypa.io/en/stable/installing/
[13]: https://github.com/MacPython/wiki/wiki/Which-Python
[14]: https://chocolatey.org/
[15]: ../images/no_brains_image.png
[16]: ../images/fully_trained_brain.png
[17]: #install-with-chocolatey-or-homebrew
[18]: #manual-install