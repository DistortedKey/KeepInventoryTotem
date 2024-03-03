# if there is an untagged player, id them
execute as @a unless entity @s[scores={PlayerId=1..}] run function keeptotem:assign_playerid

# on the death of a player with a totem in their offhand, clear their inventory
execute at @a[scores={totemDeath=1..,keepPlayer=1}] positioned ~ ~1.32 ~ run kill @e[type=item,distance=...0001]

# keep all non-totem players at 0 deaths for when they pick up a totem
scoreboard players set @a[scores={totemDeath=1..,keepPlayer=-1}] totemDeath 0

# on respawn of a totem player, restore their inventory
execute as @e[type=player,scores={totemDeath=1..,keepPlayer=1}] run function keeptotem:restore_inventory

# all players are not totem players....
scoreboard players set @e[type=player] keepPlayer -1
# unless they have a totem in their offhand
scoreboard players set @a[nbt={Inventory:[{Slot:-106b,tag:{keeptotem:1}}]},scores={totemDeath=0}] keepPlayer 1

# save inventory of undead totem players
execute as @a[scores={keepPlayer=1,totemDeath=0}] run function keeptotem:save_inventory
