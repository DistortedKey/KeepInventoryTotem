gamerule keepInventory true

# if there is an untagged player, id them
execute as @a unless entity @s[scores={PlayerId=1..}] run function keeptotem:assign_playerid

# on the death of a nontotem player, run item drop function
execute as @a[scores={totemDeath=1..,keepPlayer=-1}] at @s run function keeptotem:drop_items

execute as @e[type=player,scores={totemDeath=1..,keepPlayer=1}] run function keeptotem:totem_death



# all players are not totem players....
scoreboard players set @e[type=player] keepPlayer -1
# unless they have a totem in their offhand
scoreboard players set @a[nbt={Inventory:[{Slot:-106b,components:{"minecraft:custom_data":{keepTotem:1b}}}]},scores={totemDeath=0}] keepPlayer 1

# keep all non-totem players at 0 deaths after dealing with them
scoreboard players set @e[type=player] totemDeath 0