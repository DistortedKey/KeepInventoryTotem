# stuff
data modify storage temp_items_list data.Inventory set from entity @s Inventory

execute store result score @s XP run xp query @s levels
execute at @s if score @s XP matches 7.. run summon experience_orb ~ ~ ~ {Value:100}
clear @s
xp set @s 0 levels
xp set @s 0 points


# get number of items
execute store result score #num_of_items temp run data get storage temp_items_list data.Inventory

# start loop
execute at @s if score #num_of_items temp matches 1.. run function keeptotem:loops/drop_loop