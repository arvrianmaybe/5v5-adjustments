#!mainFile "../dev_main.opy"

playervar stat_helper_pvar
#!defineMember _base_damage_scalar stat_helper_pvar[0]
#!defineMember _base_healing_scalar stat_helper_pvar[1]
#!defineMember _base_movement_scalar stat_helper_pvar[2]

#!define setBaseDamage(player, scalar) \
    player._base_damage_scalar = scalar \
    player.setDamageDealt(percent(player._base_damage_scalar))

#!define setBaseHealing(player, scalar) \
    player._base_healing_scalar = scalar \
    player.setHealingDealt(percent(player._base_healing_scalar))

#!define setBaseMovement(player, scalar) \
    player._base_movement_scalar = scalar \
    player.setMoveSpeed(percent(player._base_movement_scalar))