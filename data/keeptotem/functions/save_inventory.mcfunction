# boolean to check if marker already exists, set to true
scoreboard players set #generateNew temp 1
# operation to store player's id
scoreboard players operation #targetId temp = @s PlayerId

# if there is a marker with the matching inventoryId, set boolean to false
execute as @e[type=marker,scores={inventoryId=1..}] if score @s inventoryId = #targetId temp run scoreboard players set #generateNew temp 0

# if generateNew is true, do so and tag it with the correct id
execute if score #generateNew temp matches 1 run summon marker 0 0 0 {Tags:["creating"]}
scoreboard players operation @e[type=marker,tag=creating] inventoryId = @s PlayerId

# remove unneeded tag
tag @e[tag=creating] remove creating

# remove temp players
scoreboard players reset #generateNew
scoreboard players reset #targetId

# get the marker matching the playerId, correct id will end up as 0
execute as @e[type=marker,scores={inventoryId=1..}] run scoreboard players operation @s temp = @s inventoryId
scoreboard players operation @e[type=marker,scores={temp=1..}] temp -= @s PlayerId

# store player inventory in marker
data modify entity @e[type=marker,scores={temp=0},limit=1] data.Inventory set from entity @s Inventory
