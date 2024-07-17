#!mainFile "../../dev_main.opy"


rule "[pharah/barrage.opy]: Correct Barrage damage":
    @Event playerDealtDamage
    @Hero pharah
    @Condition eventAbility == Button.ULTIMATE


    setBaseDamage(eventPlayer, (ADJ_PHARAH_BARRAGE_DAMAGE/OW2_PHARAH_BARRAGE_DAMAGE))
    waitUntil(not eventPlayer.isUsingUltimate(), Math.INFINITY)
    eventPlayer.setDamageDealt(100)

rule "[pharah/barrage.opy]: Set Barrage":
    @Event eachPlayer
    @Hero pharah
    @Condition eventPlayer.isUsingUltimate()

    eventPlayer.setAbilityCooldown(Button.ABILITY_1, 0)
    eventPlayer.setAbilityCooldown(Button.ABILITY_2, 0)
    eventPlayer.setAbilityCooldown(Button.SECONDARY_FIRE, 0)
    wait(ADJ_PHARAH_BARRAGE__DURATION, Wait.ABORT_WHEN_FALSE)
    eventPlayer.cancelPrimaryAction()