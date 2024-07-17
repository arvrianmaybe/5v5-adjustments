#!mainFile "../../dev_main.opy"

rule "[reinhardt/firestrike.opy]: Increase Firestrike damage":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.REINHARDT
    @Condition eventPlayer.isUsingAbility2()

    eventPlayer.setDamageDealt(percent(ADJ_REINHARDT_FIRESTRIKE_DAMAGE/OW2_REINHARDT_FIRESTRIKE_DAMAGE))
    wait(OW2_REINHARDT_FIRESTRIKE_CAST_TIME)
    eventPlayer.setDamageDealt(percent(eventPlayer._base_damage_scalar))
