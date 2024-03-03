# Create temporary armor stand to transfer items
summon armor_stand 0 0 0 {Invisible:1b,Invulnerable:1b,NoBasePlate:1b,NoGravity:1b,Tags:[holding_items]}


# identify marker with inventoryId matching player's PlayerId
execute positioned .5 0 .5 as @e[type=marker,distance=...000001] run scoreboard players operation @s temp = @s inventoryId
execute positioned .5 0 .5 run scoreboard players operation @e[type=marker,distance=...000001,scores={temp=1..}] temp -= @s PlayerId


# get number of items
execute positioned .5 0 .5 store result score #num_of_items temp run data get entity @e[type=minecraft:marker,scores={temp=0},limit=1,distance=...0000001] data.Inventory

# start loop
execute positioned .5 0 .5 if score #num_of_items temp matches 1.. run function keeptotem:restore_loop

# kill temporary armor stand
execute positioned .5 0 .5 run kill @e[type=armor_stand,distance=...00000001,tag=holding_items]