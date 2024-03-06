# identify marker with inventoryId matching player's PlayerId
execute positioned .5 0 .5 as @e[type=marker,distance=...000001] run scoreboard players operation @s temp = @s inventoryId
execute positioned .5 0 .5 run scoreboard players operation @e[type=marker,distance=...000001,scores={temp=1..}] temp -= @s PlayerId

clear @s


execute positioned .5 0 .5 run data modify storage temp_items_list data.Inventory set from entity @e[type=minecraft:marker,scores={temp=0},limit=1,distance=...0000001] data.Inventory

# get number of items
execute store result score #num_of_items temp run data get storage temp_items_list data.Inventory

# start loop
execute at @s if score #num_of_items temp matches 1.. run function keeptotem:loops/drop_loop

# kill armor stands used for loop
execute at @s if score #item_count temp matches 1.. run function keeptotem:loops/kill_item_loop