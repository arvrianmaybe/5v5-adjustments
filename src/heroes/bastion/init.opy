#!mainFile "../../dev_main.opy"

#!include "heroes/bastion/reconfigure.opy"


rule "[bastion/init.opy]: Initialize Bastion":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.BASTION
    

    setCustomHp(
        ADJ_BASTION_HEALTH,
        ADJ_BASTION_DUPLICATE_ARMOR if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_DPS_HP else ADJ_BASTION_ARMOR,
        0)
    setUltCost(ADJ_BASTION_ULT_COST)
    removeSelfHealing()

    eventPlayer.startScalingSize(0.96, true)

    eventPlayer.call_init = false


rule "[bastion/init.opy]: Reduce grenade self-damage":
    @Event playerDealtDamage
    @Hero bastion
    @Condition attacker == victim
    
    heal(victim, null, eventDamage - (eventDamage*0.5))
