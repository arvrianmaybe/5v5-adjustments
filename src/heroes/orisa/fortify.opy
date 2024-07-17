#!mainFile "../../dev_main.opy"


rule "[orisa/init.opy]: Correct Fortify overhealth and movement speed":
    @Event eachPlayer
    @Hero orisa
    @Condition eventPlayer.isUsingAbility1()
    
    eventPlayer.setMoveSpeed(percent(ADJ_ORISA_FORTIFY_MOVESPEED/OW2_ORISA_FORTIFY_MOVESPEED))
    damage(eventPlayer, null, OW2_ORISA_FORTIFY_OVERHEALTH/(1-OW2_ORISA_FORTIFY_DAMAGE_REDUCTION))
    heal(eventPlayer, null, 1) # without this, orisa is 449/450 hp due to internal rounding
    waitUntil(not eventPlayer.isUsingAbility1(), Math.INFINITY)
    eventPlayer.setMoveSpeed(100)
    eventPlayer.setAbilityCooldown(Button.ABILITY_1, ADJ_ORISA_FORTIFY_COOLDOWN)
    