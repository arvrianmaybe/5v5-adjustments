#!mainFile "../../dev_main.opy"

rule "[pharah/barrage.opy]: Set Barrage damage and cooldowns":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.PHARAH
    @Condition eventPlayer.isUsingUltimate()

    eventPlayer.setAbilityCooldown(Button.ABILITY_1, 0)
    eventPlayer.setAbilityCooldown(Button.ABILITY_2, 0)
    eventPlayer.setAbilityCooldown(Button.SECONDARY_FIRE, 0)
    setBaseDamage(eventPlayer, (ADJ_PHARAH_BARRAGE_DAMAGE/OW2_PHARAH_BARRAGE_DAMAGE))
    wait(ADJ_PHARAH_BARRAGE__DURATION)
    eventPlayer.cancelPrimaryAction()
    eventPlayer.setDamageDealt(percent(eventPlayer._base_damage_scalar))