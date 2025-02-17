#!mainFile "../../dev_main.opy"

#!include "heroes/venture/excavator.opy"
#!include "heroes/venture/tectonic_shock.opy"


rule "[venture/init.opy]: Initialize Venture":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.VENTURE

    setCustomHp(ADJ_VENTURE_HEALTH, 0, 0)
    setUltCost(ADJ_VENTURE_ULT_COST)
    removeSelfHealing()

    if not eventPlayer.isDuplicatingAHero():
        setBaseDamage(eventPlayer, ADJ_VENTURE_DRILL_DASH_DAMAGE / OW2_VENTURE_DRILL_DASH_DAMAGE)
    eventPlayer.setKnockbackDealt(70)
    eventPlayer.setMoveSpeed(percent(ADJ_VENTURE_SPEED/OW2_VENTURE_SPEED))

    eventPlayer.call_init = false
    eventPlayer.max_health_scaler = (ADJ_VENTURE_EXPLORER_SHIELDS/OW2_VENTURE_EXPLORER_SHIELDS)


rule "[venture/init.opy]: Correct Venture bonus shields":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.VENTURE
    @Condition eventPlayer.getMaxHealthOfType(Health.SHIELDS) >= floor(ADJ_VENTURE_EXPLORER_SHIELDS/OW2_VENTURE_EXPLORER_SHIELDS * OW2_VENTURE_EXPLORER_SHIELDS_ULTIMATE)
    
    eventPlayer.addHealthPool(
        Health.SHIELDS,
        ADJ_VENTURE_EXPLORER_SHIELDS_ULTIMATE - (ADJ_VENTURE_EXPLORER_SHIELDS/OW2_VENTURE_EXPLORER_SHIELDS * OW2_VENTURE_EXPLORER_SHIELDS_ULTIMATE),
        true,
        true)
    # subtract 1 to account for rounding error
    waitUntil(eventPlayer.getMaxHealthOfType(Health.SHIELDS) < (ADJ_VENTURE_EXPLORER_SHIELDS_ULTIMATE - 1), Math.INFINITY)
    removeHealthPool(getLastCreatedHealthPool())

rule "[venture/init.opy]: Correct Venture melee damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.VENTURE
    @Condition eventAbility == Button.MELEE
    
    damage(
        victim, 
        attacker, 
        ((eventDamage/eventPlayer._base_damage_scalar) * (ADJ_VENTURE_CLOBBER_DAMAGE / OW2_VENTURE_CLOBBER_DAMAGE) - eventDamage)/eventPlayer._base_damage_scalar)