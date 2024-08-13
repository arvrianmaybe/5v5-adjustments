#!mainFile "../../dev_main.opy"


rule "[ramattra/nemesis_form.opy]: Correct Nemesis Form  movement speed":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.RAMATTRA
    @Condition eventPlayer.getMaxHealthOfType(Health.ARMOR)
    
    eventPlayer.setMoveSpeed(percent(ADJ_RAMATTRA_NEMESIS_MOVESPEED/OW2_RAMATTRA_NEMESIS_MOVESPEED))
    waitUntil(not eventPlayer.isUsingAbility1(), Math.INFINITY)
    eventPlayer.setMoveSpeed(100)


rule "[ramattra/nemesis_form.opy]: Increase Pummel damage":
    @Event playerDealtDamage
    @Hero ramattra
    @Condition eventPlayer.getMaxHealthOfType(Health.ARMOR)
    @Condition eventDamage > 50 # This condition stops vortex from applying the damage increase
    @Condition eventAbility != Button.MELEE
    
    damage(victim, attacker, eventDamage * (ADJ_RAMATTRA_PUMMEL_DAMAGE/OW2_RAMATTRA_PUMMEL_DAMAGE) - eventDamage)


rule "[ramattra/nemesis_form.opy]: Bonus Annihilation movement speed":
    @Event eachPlayer
    @Hero ramattra
    @Condition eventPlayer.isUsingUltimate()
    
    wait(0.064)
    eventPlayer.setMoveSpeed(percent(ADJ_RAMATTRA_ANNIHILATION_MOVESPEED/OW2_RAMATTRA_NEMESIS_MOVESPEED))
    waitUntil(not eventPlayer.isUsingUltimate(), Math.INFINITY)
    eventPlayer.setMoveSpeed(100)
