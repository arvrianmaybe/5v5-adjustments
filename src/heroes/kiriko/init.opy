#!mainFile "../../dev_main.opy"

#!include "heroes/kiriko/swift_step.opy"
#!include "heroes/kiriko/wall_climb.opy"

playervar suzu_flying

rule "[kiriko/init.opy]: Initialize Kiriko":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.KIRIKO

    setCustomHp(ADJ_ASHE_HEALTH, 0, 0)
    setUltCost(ADJ_ASHE_ULT_COST)
    removeSelfHealing()

    setBaseDamage(eventPlayer, (ADJ_KIRIKO_KUNAI_HEADSHOT_DAMAGE/OW2_KIRIKO_KUNAI_HEADSHOT_DAMAGE))

    eventPlayer.setAbilityCooldown(Button.ABILITY_1, ADJ_KIRIKO_SWIFT_STEP_SPAWN_COOLDOWN)

    eventPlayer.call_init = false


rule "[kiriko/init.opy]: Track Protection Suzu healing":
    @Event playerDealtHealing
    @Hero kiriko
    @Condition eventAbility == Button.ABILITY_2
    
    eventPlayer.suzu_flying = false


rule "[kiriko/init.opy]: Allow self healing during Protection Suzu":
    @Event eachPlayer
    @Hero kiriko
    @Condition eventPlayer.isHoldingButton(Button.ABILITY_2) == true
    @Condition eventPlayer.getAbilityCooldown(Button.ABILITY_2) == 0
    
    damage(eventPlayer, null, MIN_DAMAGE)
    eventPlayer.suzu_flying = true
    pushSelfHealing(Button.ABILITY_2)
    waitUntil(not eventPlayer.suzu_flying, ADJ_THROWABLES_WAIT_TIME)
    wait(0.65)
    popSelfHealing(Button.ABILITY_2)
