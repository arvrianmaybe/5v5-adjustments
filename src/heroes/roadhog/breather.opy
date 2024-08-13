#!mainFile "../../dev_main.opy"

rule "[roadhog/breather.opy]: Breather cooldown logic":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.ROADHOG
    @Condition eventPlayer.isFiringSecondaryFire()
    
    wait(ADJ_ROADHOG_BREATHER_DURATION, Wait.ABORT_WHEN_FALSE)
    eventPlayer.setAbilityCooldown(Button.SECONDARY_FIRE, 0)
    eventPlayer.setAbilityCooldown(Button.SECONDARY_FIRE, ADJ_ROADHOG_BREATHER_COOLDOWN)

rule "[roadhog/breather.opy]: Allow self healing during Breather":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.ROADHOG
    @Condition eventPlayer.isFiringSecondaryFire()

    damage(eventPlayer, null, MIN_DAMAGE)
    pushSelfHealing(Button.SECONDARY_FIRE)
    waitUntil(not eventPlayer.isFiringSecondaryFire(), Math.INFINITY)
    popSelfHealing(Button.SECONDARY_FIRE)
