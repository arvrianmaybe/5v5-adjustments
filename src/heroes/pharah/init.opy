#!mainFile "../../dev_main.opy"

#!include "heroes/pharah/barrage.opy"

rule "[pharah/init.opy]: Initialize Pharah":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.PHARAH
    
    setCustomHp(ADJ_PHARAH_HEALTH, 0, 0)
    setUltCost(ADJ_PHARAH_ULT_COST)
    removeSelfHealing()

    eventPlayer.setAbilityCooldown(Button.ABILITY_1, ADJ_PHARAH_JUMP_JET_SPAWN_COOLDOWN)

    eventPlayer.call_init = false

rule "[pharah/init.opy]: Reduce Primary Fire attack speed":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.PHARAH
    @Condition eventPlayer.isFiringPrimaryFire()
    
    eventPlayer.setPrimaryFireEnabled(false)
    wait(ADJ_PHARAH_ATTACK_RECOVERY)
    eventPlayer.setPrimaryFireEnabled(true)
    if eventPlayer.isHoldingButton(Button.PRIMARY_FIRE): # if the player is holding down primary fire, this is necessary to allow automatic firing
        eventPlayer.forceButtonPress(Button.PRIMARY_FIRE)
    
rule "[pharah/init.opy]: Force jump jets cooldown after spawning":
    @Event playerDied
    @Hero pharah

    waitUntil(eventPlayer.isAlive() and eventPlayer.isInSpawnRoom(), Math.INFINITY)
    eventPlayer.setAbilityCooldown(Button.ABILITY_1, ADJ_PHARAH_JUMP_JET_SPAWN_COOLDOWN)