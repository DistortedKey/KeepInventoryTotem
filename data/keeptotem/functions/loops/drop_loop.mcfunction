#summon armor stand to drop item
summon armor_stand ~ ~ ~ {Tags:[temp_holding_items],Invulnerable:0b}

# get current item slot
execute store result score #slot temp run data get storage temp_items_list data.Inventory[0].Slot

# replace armor stand's helmet item with current item
execute run data modify entity @e[type=armor_stand,distance=...00000001,tag=temp_holding_items,limit=1] ArmorItems[3] set from storage temp_items_list data.Inventory[0]

# kill armor stand with damage so it drops item
execute as @e[type=armor_stand,tag=temp_holding_items] run damage @s 10 arrow

# remove item that was just processed
data remove storage temp_items_list data.Inventory[0]

# get number of items 
execute store result score #num_of_items temp run data get storage temp_items_list data.Inventory

scoreboard players operation #item_count temp = #num_of_items temp

kill @e[distance=..5,type=item,nbt={Item:{id:"minecraft:armor_stand",Count:1b}},limit=1]

# continue loop
execute if score #num_of_items temp matches 1.. run function keeptotem:loops/drop_loop
