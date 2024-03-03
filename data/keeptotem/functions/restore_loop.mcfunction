# get current item slot
execute positioned .5 0 .5 store result score #slot temp run data get entity @e[type=minecraft:marker,scores={temp=0},limit=1,distance=...0000001] data.Inventory[0].Slot

# replace armor stand's hand item with current item
execute positioned .5 0 .5 run data modify entity @e[type=armor_stand,distance=...00000001,tag=holding_items,limit=1] HandItems[0] set from entity @e[type=minecraft:marker,scores={temp=0},limit=1,distance=...0000001] data.Inventory[0]

# replace the player's slot with the item
function keeptotem:replace_item

# remove item that was just processed
execute positioned .5 0 .5 store result score #num_of_items temp run data remove entity @e[type=minecraft:marker,scores={temp=0},limit=1,distance=...0000001] data.Inventory[0]


# get number of items 
execute positioned .5 0 .5 store result score #num_of_items temp run data get entity @e[type=minecraft:marker,scores={temp=0},limit=1,distance=...0000001] data.Inventory

# start loop
execute positioned .5 0 .5 if score #num_of_items temp matches 1.. run function keeptotem:restore_loop