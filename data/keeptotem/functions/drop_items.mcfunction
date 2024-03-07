# stuff
data modify storage temp_items_list data.Inventory set from entity @s Inventory

clear @s
xp set @s 0 levels
xp set @s 0 points


# get number of items
execute store result score #num_of_items temp run data get storage temp_items_list data.Inventory

# start loop
execute at @s if score #num_of_items temp matches 1.. run function keeptotem:loops/drop_loop

execute at @s run summon experience_orb ~ ~ ~