scoreboard objectives add totemDeath deathCount
scoreboard objectives add keepPlayer dummy
scoreboard objectives add temp dummy

scoreboard objectives add inventoryId dummy
scoreboard objectives add PlayerId dummy
execute unless score nextId PlayerId matches 1.. run scoreboard players set nextId PlayerId 1

forceload add 0 0