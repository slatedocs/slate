---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - csharp : C#
  - python : Python
  - typescript : Typescript

toc_footers:
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

search: true
---

# Introduction
Welcome to the LHGames API resource page! You can use this document to understand the different functions in the AIHelper class provided in your seed project. We have 5 different languages you can use to code your bot ; all of them are present in this documentation.
We have language bindings in CSharp, Python and TypeScript! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

# Required specs
The game server runs on .NET CORE 2.1 which is multi-platform. In short whether you have a Windows, Mac or Linux based machine, you will be fine.

You can use any IDE/Text editor you wish to write your bot. Depending on what language you wish to code in you might need to download some stuff. Make sure you have downloaded everything you need before the day of the event (save all your time to code!)

* Using C# ?

    Have .NET CORE ^2.1 downloaded before the day of the event. 
    Choose a download with SDK : [.NetCore] (https://www.microsoft.com/net/download)
    
* Using python ?

    Have Python 3.6 downloaded [Python] (https://www.python.org/downloads/)
    
* Using TypeScript ?

    Have TypeScript ^2.4.2 downloaded [TypeScript] (https://www.typescriptlang.org/index.html#download-links)

    Have NodeJs 8.12.0 [NodeJs] (https://nodejs.org/dist/v8.12.0/node-v8.12.0-x64.msi)
    
# Testing Locally
If you wish to experiment with a local server you can run a local copy of the game on your machine.
We will provide instructions on that later on.

Once you have started the project and have your bot running you can use these URLs to active certain events in the game:

* Walls are breakable: http://localhost:4000/api/game/wallsAreBreakable
* Make obstacles appear at random: http://localhost:4000/api/game/toggleWalls
* Activate lava : http://localhost:4000/api/game/activateLava
* Make goblins appear at random: http://localhost:4000/api/game/toggleGoblins

# Your Dashboard

You have many useful sections in your [dashboard] (https://dashboard.polyhx.io/). Here are the three most important sections:

* **Profile - GitHub entry** : Please enter a valid GitHub account in this field. When the game starts, you will receive an invitation to a repository we will have created for you. The invitation will be sent to your email (the one associated with your GitHub account). In this repository you will have your seed project for the language you choose.

* **Team Setup** : Here is where you select the language in which you want to code for the day.

* **Team Deployment** : In this page you can view logs regarding the Build, Deployment and Run of your team. Therefore, if you think you have a problem with your code, build deployment and such, please look at this section before asking an organizer.

To see the logs, you must click on a step. This step should expand and you should see logs in a short amount of time.
We will automatically make a push in your repository as we launch the game. If you do not see any "Build" then "Deployment" then "Run" section as the game starts, you may have a problem.

```csharp
    Console.WriteLine("This will be visible from the dashboard.");
```

```typescript
    console.log("This will be visible from the dashboard.");
```

```python
    print("This will be visible from the dashboard.")
```

<aside class="notice">
    Here is a tip!
    If you write to standard output in your code, they will be displayed in the Run section of Team Deployment. This could help you in figuring out if an action you requested actually occured.
</aside>

# What not to do
Do NOT change any Jenkins, Docker files or any other file with the comment "Do not touch this file". If you are experiencing a problem with your repository, your code or if you have any concerns, please ask someone from the organizing team (Pink T-Shirts!) to help you. Don't start changing any configurations, you will only make your lifes and our lifes harder.

**FULL DISCLAIMER**

If you try to sabotage another team, you will be kicked out of the event. We understand that some of you want to test your hackerman skills, just don't -
If you are cought trying to sabotage another team you will be automatically disqualified from the competition and any other event organized by PolyHx for the following year.
Let's have fun but not at the expense of others.

<aside class="warning">
**FULL DISCLAIMER** -- 
If you try to sabotage another team, you will be kicked out of the event.
</aside>

# Your code
Let's get started!

You must write your code in the **Bot** class of your project seed. The functions you can call are all located in the AIHelper class and are explained in the Action section of this documentation.

### Useful links

* [The bible of AI] (http://aima.cs.berkeley.edu/)
* [Notes on AI from Francis Tseng] (https://frnsys.com/ai_notes/)
* [Videos from Michel Gagnon, teacher at Polytechnique] (https://www.youtube.com/channel/UC2V7ubG5XJZAPiP_bpLby6A/videos)
* [Search Algorithms on Tutorial Points] (https://www.tutorialspoint.com/artificial_intelligence/artificial_intelligence_popular_search_algorithms.htm)
* [PDDL] (http://users.cecs.anu.edu.au/~patrik/pddlman/writing.html)
* [FF] (https://fai.cs.uni-saarland.de/hoffmann/ff.html)
* [SHOP] (http://www.cs.umd.edu/projects/shop/index.html)
* [Reinforcement Learning, Beginner's guide] (https://www.analyticsvidhya.com/blog/2017/01/introduction-to-reinforcement-learning-implementation/)
* [Reinforcement Learning] (https://web.stanford.edu/class/psych209/Readings/SuttonBartoIPRLBook2ndEd.pdf)
* [Python resources] (https://sites.google.com/site/pydatalog/home)

### Note on GitHub
If you are not familiar with the common git commands, start reading up! 

Here is a link explaining how to install git : [install git] (https://git-scm.com/book/en/v2/Getting-Started-The-Command-Line)

Here is a link explaining the most pertinent commands : [git documentation] (https://git-scm.com/book/en/v2/Getting-Started-Summary)

In short you will want to read up on the clone, status, add, commit, checkout and push commands

### Simple chain of events rundown
To put it shortly, here is the chain of events you need to do to have your bot up and running on our server.
First, make sure you clone the repository we invited you to. In this repository, code your bot in the **Bot** class. When you are ready to see what it looks like, make a push on the master branch. We will build, deploy and run the code you pushed. You can see all those steps and their logs on your dashboard, in the team deployment section. If your build failed you should push some new code as soon a possible because your bot will be idle during this time. On the other hand, if all goes well, you should see your bot interact in the manner you coded. We will provide the link to the front end part of the game at a later time, but rest assured, you will be able to see your player move around, gather resources, etc.

# Goal of the Game

Score as many points as possible. To earn points, you must gather resources and defeat your opponents.
This game is also meant to be an introduction opportunity into the world of artificial intelligence as a coder. You might want to read up on the subject, especially regarding path finding algorithms.

<aside class="notice">
You should read this doc carefully to understand the mechanics of this game. There are many ways you can code your bot. Discuss startegy with your team!
</aside>

# Resources
## Minerals
Minerals give you points when they are deposited in your house. They are also the currency of the game. Using your minerals to buy upgrades, potions and items will not decrease your score. To collect minerals, you need to mine them from resource tiles, steal them from other players or kill other players to earn what they were carrying.

To steal minerals, you need to be adjacent to another player's house.

When you kill a player, you are awarded the resources they were carrying. If you do not have enough room to carry them, they will drop on the ground, where everyone can collect them.

A player can only carry a certain amount of minerals before they need to be deposited into their house. This capacity can be increased by purchasing the *Carrying Capacity* upgrade and the *Backpack* item.

<aside class="warning">
Keep in mind that when we say "adjacent to a tile" we mean that your player must be at X+/- one or Y+/- one. In other terms, standing on a tile diagonal to the target tile will NOT work.
</aside>

## Health
If your health falls to 0 or below, you die. When you die, the minerals you were carrying are awarded to the player who killed you, or dropped if the killer doesn't have enough room to carry them.

To regain health, you can buy potions from the stores. You can carry up to 10 health potions. Each potion you drink regenerates 5HP. When you die you will automatically respawn in your house.

## Items

| Item          | Type                  | Description                                  |
| ------------- | --------------------- | -------------------------------------------- |
| Sword         | Attack Power          | This item will give you more Attack power, which means more damage output. |
| Shield        | Defence               | This item will give you more Defence, which means you take less damage when someone attacks you. |
| Backpack      | Carrying capacity     | This item increases you capacity to carry minerals. |
| Pickaxe       | Collecting speed      | This item makes you collect minerals faster. |
| Health Potion | Health                | They regenerate 5HP when they are used, they cost 2000 minerals. |


All the items are the same price (except the health potion of course) at 30000 minerals. These items give a big increase in that state for a lower price than what the upgrades cost. However, you will need to find your way to one of the shops to buy them.
# Combat
Players can execute melee attacks (close physical encounter). An attack deals damage based on the characters's attack, his items and the other character's defence and his items. Killing an enemy grants a number of points that depends on each's player position on the leaderboard (between 2000 and 10000) and the number of times the enemy was killed in a row. 

# Game Phases
There are four phases in the game, everyone starts at phase I. We will announced during the day when we move from phase to phase.

### Phase I - Your Kingdom
Players spawn in their own "Kingdom" which is isolated from everyone else in the game. This allows players to develop resource gathering and pathfinding. Players should also plan for future phases of the game by determining their strategy and adapting their upgrades accordingly. 

In each kingdom, there is a house. This is where a player goes to deposit resources and also where he respawns when he dies. To deposit resources you need to **walk** on your house.

<aside class="success">
Are you more a resource gathering bot? a thief bot? or a combat bot?
</aside>

### Phase II - Exploring
During this phase, players can start breaking the walls (trees) that isolate them from other players. You will be able to find one of the many shops, other players and high density minerals.

Trees have 5HP, which means your bot will destroy them faster if you have more attack power.

<aside class="warning">
Watch out, other players might try to kill you or steal from your house!
</aside>

### Phase III - Obstacles, Combat & Points of Interest
More obstacles will start spawning on the map, which will force players to develop better pathfinding. 
Trees start spawning on the map, which means paths can get obstructed. If you do not start dealing with trees, your bot might get stuck. 

Start thinking about buying items, you will need potions to survive combat and the pickaxe, backpack, shield and sword give a big power boost to your bot.

<aside class="warning">
Watch your step in this phase!
</aside>

### Phase IV - NPCs
NPCs (non-player character) will start spawning on the map, your bot will have no other option but to fight them.

<aside class="warning">
Watch your back in this phase!
</aside>

### Phase V - Lava
The floor is lava, the map will slowly become more and more dangerous. A player may step on lava but will suffer heavy damage, which will cause instant death.

# Actions
Use actions to make your bot move, gather ressources, attack, steal, purchase, heal and upgrade. All the actions are directional. As such, you don't provide a position (player.x + 1, player.y) but a direction (1,0).

<aside class="notice">
Actions are the basis for everything your bot does.
</aside> 
   
## Move 
>CreateMoveAction(Point direction)

```csharp
internal string ExecuteTurn(Map map, IEnumerable<IPlayer> visiblePlayers)
{
    return AIHelper.CreateMoveAction(
        new Point(1, 0)
    );
}
```

```typescript
public executeTurn(map: Map, visiblePlayers: IPlayer[]): string {
    return AIHelper.createMoveAction(new Point(1, 0));
}
```

```python
def execute_turn(self, gameMap, visiblePlayers):
    return create_move_action(Point(1, 0))
```

This action is the most basic of all. When a move action is attempted, the destination tile must be adjacent and empty. If another player is standing on that tile, the action will fail. Players cannot step on walls. A player can walk on lava but will suffer heavy damage. You can only move a single tile per turn (X+/-, Y+/-). The origin of the map (0,0) is located in the **top left corner**.

In such, to go :

| Direction | Point     |
| --------- | --------- |
| Up        | (0, -1)   |
| Down      | (0, 1)    |
| Left      | (-1, 0)   |
| Right     | (1, 0)    |

| Parameter | Type  | Description                                  |
| --------- | ----- | -------------------------------------------- |
| direction | Point | The position where you want your bot to move |

<aside class="warning">
Keep in mind your bot ** CANNOT ** move in a diagonal direction. You must first move in X then Y, or Y then X.
</aside>

## Collect
>CreateCollectAction(Point position)

```csharp
internal string ExecuteTurn(Map map, IEnumerable<IPlayer> visiblePlayers)
{
    return AIHelper.CreateCollectAction(
        new Point(1, 0)
    );
}
```

```typescript
public executeTurn(map: Map, visiblePlayers: IPlayer[]): string {
    return AIHelper.createCollectAction(new Point(1, 0));
}
```

```python
def execute_turn(self, gameMap, visiblePlayers):
    return create_collect_action(Point(1, 0))
```

This action is to collect resources at a particular location. You may for example collect minerals on the ground after another player's death. To collect resources, a player must be adjacent to the resource. 

For every action, you collect 100 resources. This amount improves when a player upgrades his collecting speed, his items and if a resource patch has a higher density. A player cannot carry more than his *Carrying capacity* allows. When his inventory is full, he needs to visit his home to deposit his resources. Resources are automatically deposited when a player steps on his house tile.


| Parameter | Type  | Description                                                   |
| --------- | ----- | ------------------------------------------------------------- |
| direction | Point | The direction in which you want your bot to collect minerals, (X+/- or Y+/-)|

## Heal
>CreateHealAction()

```csharp
internal string ExecuteTurn(Map map, IEnumerable<IPlayer> visiblePlayers)
{
    return AIHelper.CreateHealAction();
}
```

```typescript
public executeTurn(map: Map, visiblePlayers: IPlayer[]): string {
    return AIHelper.createHealAction();
}
```

```python
def execute_turn(self, gameMap, visiblePlayers):
    return create_heal_action()
```

This action heals your player. A healing potion increases your player's health by 5HP per potion. You must have at least one HealhPotion for this action to execute.

## Purchase
>CreatePurchaseAction(PurchasableItem item)

```csharp

// In this example, your player will purchase an item, a shield. 
// The player needs to be adjacent to a tile shop and have enough currency to buy the item.

internal string ExecuteTurn(Map map, IEnumerable<IPlayer> visiblePlayers)
{
    return AIHelper.CreatePurchaseAction(PurchasableItem.Shield);
}
```

```typescript

// In this example, your player will purchase an item, a shield. 
// The player needs to be adjacent to a tile shop and have enough currency to buy the item.

public executeTurn(map: Map, visiblePlayers: IPlayer[]): string {
        return AIHelper.createPurchaseAction(PurchasableItem.Shield);
    }
```

```python
""" 
In this example, your player will purchase an item, a shield.
The player needs to be adjacent to a tile shop and have enough currency to buy the item.
"""
def execute_turn(self, gameMap, visiblePlayers):
    return create_purchase_action(PurchasableItem.Shield)
```

You can visit shops in the game. They are located randomly in the map. To buy from a shop you must be adjacent to it. You must also have enough minerals to buy the item. Minerals that you are carrying are used first, then the ones in your house are collected.

### PurchasableItems

public enum PurchasableItem
{
    Sword,
    Shield,
    Backpack,
    Pickaxe,
    HealthPotion
}
    
| Parameter | Type            | Description                                |
| --------- | --------------- | ------------------------------------------ |
| item      | PurchasableItem | The item you wish to purchase at the shop. |

### Items stats

| Item        | Type             | Bonus Value |
| ----------- | ---------------- | ----------- |
| Sword       | Attack           | 2           |
| Shield      | Defence          | 2           |
| Backpack    | CarryingCapacity | 2000        |
| Pickaxe     | CollectingSpeed  | 0.75        |
| HealhPotion | HealthPotion     | 5           |

## Upgrade
>CreateUpgradeAction(UpgradeType type)

```csharp
// In this example, your player will upgrade his collecting speed level

internal string ExecuteTurn(Map map, IEnumerable<IPlayer> visiblePlayers)
{
    return AIHelper.CreateUpgradeAction(UpgradeType.CollectingSpeed);
}
```

```typescript

// In this example, your player will upgrade his collecting speed level

public executeTurn(map: Map, visiblePlayers: IPlayer[]): string {
    return AIHelper.createUpgradeAction(UpgradeType.CollectingSpeed);
}
```

```python
# In this example, your player will upgrade his collecting speed level

def execute_turn(self, gameMap, visiblePlayers):
    return create_upgrade_action(UpgradeType.CarryingCapacity)
```

To purchase an upgrade, the player must be in his house. Resources that you are carrying are used first, then the ones stored in your house. If you do not have enough resources, the upgrade will fail. All upgrades have 5 levels that can be purchased.

| Level | Health  | Attack 	| Defence   | Collecting speed  | Carrying capacity     |
|-------|-------- |-------- |---------- |------------------	|-------------------	|
| L0    | 10      | 1      	| 1         | 1                 | 1000                  |
| L1    | 13      | 3       | 3         | 1.25              | 1250                  |
| L2    | 15      | 5       | 5         | 1.5               | 1500                  |
| L3    | 20      | 7       | 7         | 2                 | 2000                  |
| L4    | 25      | 9       | 9         | 2.5               | 3000                  |
| L5    | 35      | 11      | 11        | 3.5               | 5000                  |

### Upgrade prices
|           | Level 0   | Level 1   | Level 2    | Level 3 | Level 4 | Level 5 |
|---------- |---------- | --------- | ---------- | ------- | ------- | ------- |
| Price     | 0         | 10000     | 15000      | 25000   | 50000   | 100000  |

### Upgrade types

public enum UpgradeType { CarryingCapacity, AttackPower, Defence, MaximumHealth, CollectingSpeed }

## Attack
>CreateAttackAction(Point position)

```csharp
// In this example, your player will attack someone or something at x+1 where x is his position.

internal string ExecuteTurn(Map map, IEnumerable<IPlayer> visiblePlayers)
{
    return AIHelper.CreateMeleeAttackAction(
        new Point(1, 0)
    );
}
```

```typescript
// In this example, your player will attack someone or something at x+1 where x is his position.

public executeTurn(map: Map, visiblePlayers: IPlayer[]): string {
    return AIHelper.createAttackAction(new Point(1, 0));
}
```

```python
# In this example, your player will attack someone or something at x+1 where x is his position.

def execute_turn(self, gameMap, visiblePlayers):
    return create_attack_action(Point(1, 0))
```

| Parameter | Type  | Description                                |
| --------- | ----- | ------------------------------------------ |
| position  | Point | The direction in which you want to attack. |

To be able to attack a target, it must be within striking distance. If the target dies, the player responsible for the last hit is awarded the kill.

Players can execute melee attacks. An attack deals damage based on the characters's attack, his items and the other character's defence and his items. Killing an enemy grants a number of points that depends on each's player position on the leaderboard. Killing a player that is better than you will give 1000 points per leaderboard position, with a minimum of 10000 points. Killing someone below you will give 10000 points - 500 points per position below you. The minimum amount of points you will receive for a kill is 2000.

If you kill the same player multiple times in a row, the number of points you receive will be divided by the number of times you killed him.

For example:

1st player kills the last player: 1000 points.
4th best player kills the 10th best player, he gets 4700 points.
10th best player kills the 4th best player, he gets 6000 points.
25th player kills the 1st player, he gets 24 000 points!
Damage is calculated with this formula:

Floor(3 + attacker's power + offensive items - 2 * (defender's defence + defensive items)^0.6 )

| Attack | Defence | Damage | Damage with sword | Damage with shield | Damage with sword & shield |
| ------ | ------- | ------ | ----------------- | ------------------ | -------------------------- |
| 1      | 1       | 2      | 4                 | 0                  | 2                          |
| 1      | 3       | 0      | 2                 | 0                  | 0                          |
| 1      | 5       | 0      | 0                 | 0                  | 0                          |
| 3      | 1       | 4      | 6                 | 2                  | 4                          |
| 3      | 3       | 2      | 4                 | 0                  | 2                          |
| 3      | 5       | 0      | 2                 | 0                  | 1                          |
| 3      | 7       | 0      | 1                 | 0                  | 0                          |
| 3      | 9       | 0      | 0                 | 0                  | 0                          |
| 5      | 1       | 6      | 8                 | 4                  | 6                          |
| 5      | 3       | 4      | 6                 | 2                  | 4                          |
| 5      | 5       | 2      | 4                 | 1                  | 3                          |
| 5      | 7       | 1      | 3                 | 0                  | 2                          |
| 5      | 9       | 0      | 2                 | 0                  | 1                          |
| 5      | 11      | 0      | 1                 | 0                  | 0                          |
| 7      | 1       | 8      | 10                | 6                  | 8                          |
| 7      | 3       | 6      | 8                 | 4                  | 6                          |
| 7      | 5       | 4      | 6                 | 3                  | 5                          |
| 7      | 7       | 3      | 5                 | 2                  | 4                          |
| 7      | 9       | 2      | 4                 | 1                  | 3                          |
| 7      | 11      | 1      | 3                 | 0                  | 2                          |
| 9      | 1       | 10     | 12                | 8                  | 10                         |
| 9      | 3       | 8      | 10                | 6                  | 8                          |
| 9      | 5       | 6      | 8                 | 5                  | 7                          |
| 9      | 7       | 5      | 7                 | 4                  | 6                          |
| 9      | 9       | 4      | 6                 | 3                  | 5                          |
| 9      | 11      | 3      | 5                 | 2                  | 4                          |
| 11     | 1       | 12     | 14                | 10                 | 12                         |
| 11     | 3       | 10     | 12                | 8                  | 10                         |
| 11     | 5       | 8      | 10                | 7                  | 9                          |
| 11     | 7       | 7      | 9                 | 6                  | 8                          |
| 11     | 9       | 6      | 8                 | 5                  | 7                          |
| 11     | 11      | 5      | 7                 | 4                  | 6                          |

## Steal
>CreateStealAction(Point position)

```csharp
// In this example, your player will steal on the adjacent tile at position X+1

internal string ExecuteTurn(Map map, IEnumerable<IPlayer> visiblePlayers)
{
    return AIHelper.CreateStealAction(
        new Point(1, 0)
    );
}
```

```typescript
// In this example, your player will steal on the adjacent tile at position X+1

public executeTurn(map: Map, visiblePlayers: IPlayer[]): string {
    return AIHelper.createStealAction(new Point(1, 0));
}
```

```python
# In this example, your player will steal from the adjacent tile

def execute_turn(self, gameMap, visiblePlayers):
    return create_steal_action(Point(0,1)):
```

To steal from another player, you must be on a tile adjacent to their house. 

Stealing quantity scales with collecting speed, the base amount is 250 per action (which makes it a lot faster than collecting from resource tiles)

| Parameter | Type  | Description                                              |
| --------- | ----- | -------------------------------------------------------- |
| position  | Point | The position where you want to steal from another player |
