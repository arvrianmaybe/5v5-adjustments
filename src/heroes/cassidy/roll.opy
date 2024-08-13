#!mainFile "../../dev_main.opy"


rule "[cassidy/roll.opy]: Remove damage reduction during roll":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.CASSIDY
    @Condition eventPlayer.isUsingAbility1()

    eventPlayer.setDamageReceived(percent(100/(100-OW2_MCCREE_COMBAT_ROLL_DAMAGE_REDUCTION)))
    waitUntil(not eventPlayer.isUsingAbility1(), Math.INFINITY)
    eventPlayer.setDamageReceived(100)