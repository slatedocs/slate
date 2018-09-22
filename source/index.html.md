---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - csharp
  - python
  - typescript

toc_footers:
  - <a href='#'>View project seeds here</a>
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

search: true
---

# Introduction

Welcome to the LHGames API resource page! You can use this document to understand the different functions in the AIHelper class provided in your seed project. We have 3 different languages you can use to code your bot ; all of them are present in this documentation.
We have language bindings in CSharp, Python, and TypeScript! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

#Your code
You must write your code in the Bot class of your project seed, inside the ExecuteTurn function. The function you can call are all located in the AIHelper class and are explained in the Action section of this documentation.

# Goal of the Game
Score as many points as possible. To earn points, you must gather resources and defeat your opponents.
This game is also meant to be an introduction opportunity into the world of artificial intelligence as a coder. You might want to read up on the subject, especially regarding path finding algorithms.

<aside class="notice">
You should read this doc carefully to understand the mechanics of this game. There are many ways you can code your bot. Discuss startegy with your team!
</aside>

#Resources
##Minerals
Minerals give you points when they are deposited in your house. They are also the currency of the game. Using your minerals to buy upgrades, potions and items will not decrease your score. To collect minerals, you need to mine them from resource tiles, steal them from other players or kill other players to earn what they were carrying.

To steal minerals, you need to be adjacent to another player's house. When you kill a player, you are awarded the resources they were carrying. If you do not have enough room to carry them, they will drop on the ground, where everyone can collect them. A player can only carry a certain amount of minerals before they need to be deposited into their base. This capacity can be increased by purchasin upgrades and items.
##Health
Run out of health and you are dead. When you die, the minerals you were carrying are awarded to the player who killed you. To regain health, you can buy potions from the stores. You can carry as many potions as you want. Each potion you drink regenerates 5HP.

##Items

* **Attack items** : These items will give you more Attack power, which means more damage output.

* **Defence items** : These items will give you more Defence, which means you take less damage when someone attacks you.

* **Carrying capacity items** : There items increase you capacity to carry minerals (think of it as a backpack).

* **Collecting speed items** : There items make you collect minerals faster.

* **Health potions** : They regenerate 5HP when they are used, they cost 5 000 minerals.

#Combat
Players can execute melee attacks. An attack deals damage based on the characters's attack, his items and the other character's defence and his items. Killing an enemy grants a number of points that depends on each's player position on the leaderboard. 

#Game Phases
##Phase I - Your Kingdom
Players spawn in their own "Kingdom" which is isolated from everyone else in the game. This allows Players to develop resource gathering and pathfinding. Players should also plan for future phases of the game by determining their strategy and adapting their upgrades accordingly. A player's house is located in his kingdom. This house is useful to store resources. Resources are automatically deposited when a player steps on his house tile.

<aside class="success">
Are you more a resource gathering bot? or a combat bot?
</aside>

##Phase II - Obstacles & New Points of Interest
Obstacles will start spawning on the map, which will force players to develop better pathfinding. Walls can be broken. They have 5HP, which means your bot will destroy them faster if you have more attack power.

Trees start spawning on the map, which means paths can get obstructed. If you do not start dealing with trees, your bot might get stuck. Points of interests start becoming available (shops, high density resources, other player's houses)

<aside class="warning">
Watch your step!
</aside>

##Phase III - NPCs
NPCs (non-player character) will start spawning on the map, your bot will have no other option but to fight them.

<aside class="warning">
Watch your back!
</aside>

##Phase IV - Lava
The floor is lava, the map will slowly become more and more dangerous. A player may step on lava but will suffer heavy damage.

# Actions
Use actions to make you bot move, gather ressources, attack, steal, purchase, heal and upgrade.

<aside class="notice">
Actions are the basis for everything your bot does.
</aside> 
   
##Move 
>AIHelper.CreateMoveAction(Point direction)

This action is the most basic of all. When a move action is attempted, the destination tile must be within reachable distance and it must be empty. If another player is standing on that tile, the action will fail. Players cannot step on walls. A player can walk on lava but will suffer heavy damage.

Parameter | Type | Description
--------- | ------- | -----------
direction | Point | The position where you want your bot to move

##Collect
>AIHelper.CreateCollectAction(Point position)

This action is to collect resources at a particular location. You may for example collect minerals on the ground after another player's death. To collect resources, a player must adjacent to the resource. The amount of resources collected each turn is determined by a player's upgrades collecting speed upgrades, his items and the density of the resource patch. A player cannot carry more than his *Carrying capacity* allows. When his inventory is full, he needs to visit his home to deposit his resources. Resources are automatically deposited when a player steps on his house tile.

Parameter | Type | Description
--------- | ------- | -----------
position | Point | The position where you want your bot to collect items such as minerals

##Heal
>AIHelper.CreateHealAction()

This action heals your player. A healing potion increases your player's health by 5HP per potion. You must have at least one HealhPotion for this action to execute.

##Purchase
>AIHelper.CreatePurchaseAction(PurchasableItem item)

You can visit shops in the game. They are located randomly in the map. To buy form a shop you must in it. You must also have enough currency, minerals, to buy the item. Minerals that you are carrying are used first.
Here are all the purchasable items in the shops:

public enum PurchasableItem
    {
        Sword,
        Shield,
        Backpack,
        Pickaxe,
        HealthPotion,
    }
	
Parameter | Type | Description
--------- | ------- | -----------
item | PurchasableItem | The item you wish to purchase at the shop.

Here are the advantage of all items:

Item | Type | Bonus Value
--------- | ------- | -----------
Sword | Attack | 2
Shield | Defence | 2
Backpack | CarryingCapacity | 2
Pickaxe | CollectingSpeed | 2
HealhPotion | HealthPotion | 5

##Upgrade
>AIHelper.CreateUpgradeAction()

To purchase an upgrade, the player must be in his house. Resources that you are carrying are used first, then the ones stored in your house. If you do not have enough resources, the upgrade will fail. All upgrades have 5 levels that can be purchased.

|  Level   | Health  | Attack 	| Defence 	| Collecting speed 	| Carrying capacity 	|
|---------- |-------- |--------	|---------- |------------------	|-------------------	|
|  L0 	| 5       | 1      	| 1       	| 1                	| 1000              	|
|  L1 	| 8       | 3      	| 3       	| 1.25             	| 1500              	|
| L2 	| 10      | 5      	| 5       	| 1.5              	| 2500              	|
| L3 	| 15      | 7      	| 7       	| 2                	| 5000              	|
| L4 	| 20      | 9     	| 9      	| 2.5              	| 10000              	|
| L5 	| 30      | 11     	| 11      	| 3.5              	| 25000              	|

### Upgrade prices
|   	    | Level 0   | Level 1 	| Level 2    | Level 3 | Level 4 | Level 5 |
|---------- |---------- | --------- | ---------- | ------- | ------- | ------- |
| Price		| 0			| 15000     | 50000      | 100000  | 250000  | 500000  |


##Attack
>AIHelper.CreateAttackAction(Point position)

Parameter | Type | Description
--------- | ------- | -----------
position | Point | The position of the player you want to attack.

To be able to attack a target, it must be within striking distance. If the target dies, the player responsible for the last hit is awarded the kill.

Players can execute melee attacks. An attack deals damage based on the characters's attack, his items and the other character's defence and his items. Killing an enemy grants a number of points that depends on each's player position on the leaderboard. Killing a player that is better than you will give 1000 points per leaderboard position, with a minimum of 5000 points. Killing someone below you will give 5000 points - 250 points per position below you. With a difference of more than 20 positions, the player gets 1000 points.

For example:

1st player kills the last player: 1000 points.
4th best player kills the 10th best player, he gets 4700 points.
10th best player kills the 4th best player, he gets 6000 points.
25th player kills the 1st player, he gets 24 000 points!
Damage is calculated with this formula:

Floor(3 + attacker's power + offensive items - 2 * (defender's defence + defensive items)^0.6 )

| Attack | Defence | Damage | Damage with sword | Damage with shield | Damage with sword & shield |
|--------|---------|--------|-------------------|--------------------|----------------------------|
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

##Steal
>AIHelper.CreateStealAction(Point position)

To steal from an other player, you must be on a tile adjacent to their house. Stealing quantity scales with collecting speed.

Parameter | Type | Description
--------- | ------- | -----------
position | Point | The position where you want to steal from another player


