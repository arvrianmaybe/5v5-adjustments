#!mainFile "../../dev_main.opy"


rule "[genji/init.opy]: Initialize Genji":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.GENJI
    
    setCustomHp(ADJ_GENJI_HEALTH, 0, 0)
    setUltCost(ADJ_GENJI_ULT_COST)
    removeSelfHealing()

    eventPlayer.call_init = false


rule "[genji/init.opy]: Correct Shurikens damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.GENJI
    @Condition eventAbility in [Button.PRIMARY_FIRE, Button.SECONDARY_FIRE]

    heal(victim, attacker, eventDamage * (ADJ_GENJI_SHURIKEN_DAMAGE/OW2_GENJI_SHURIKEN_DAMAGE) - eventDamage)


rule "[genji/init.opy]: Reduce Deflect duration":
    @Event eachPlayer
    @Hero genji
    @Condition eventPlayer.isUsingAbility2()

    wait(ADJ_GENJI_DEFLECT_DURATION)
    eventPlayer.forceButtonPress(Button.ABILITY_2)