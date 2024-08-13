#!mainFile "../../dev_main.opy"


rule "[venture/tectonic_shock.opy]: Increase Tectonic Shock damage":
    @Event playerDealtDamage
    @Hero venture
    @Condition eventAbility == Button.ULTIMATE

    if distance(attacker, victim) <= ADJ_VENTURE_TECTONIC_SHOCK_CRIT_RADIUS:
        damage(
            victim, 
            attacker, 
            ((eventDamage/eventPlayer._base_damage_scalar) * ((ADJ_VENTURE_TECTONIC_SHOCK_CRIT_MULTIPLIER*ADJ_VENTURE_TECTONIC_SHOCK_DAMAGE)/OW2_VENTURE_TECTONIC_SHOCK_DAMAGE) - eventDamage)/eventPlayer._base_damage_scalar)
    else:
        damage(
            victim, 
            attacker, 
            ((eventDamage/eventPlayer._base_damage_scalar) * (ADJ_VENTURE_TECTONIC_SHOCK_DAMAGE/OW2_VENTURE_TECTONIC_SHOCK_DAMAGE) - eventDamage)/eventPlayer._base_damage_scalar)

rule "[venture/tectonic_shock.opy]: Disallow Abilities during Tectonic Shock":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.VENTURE
    @Condition eventPlayer.isUsingUltimate()

    eventPlayer.setAbilityCooldown(Button.ABILITY_1, 0)
    eventPlayer.setAbilityCooldown(Button.SECONDARY_FIRE, 0)

    eventPlayer.setAbility1Enabled(false)
    eventPlayer.setSecondaryFireEnabled(false)

    waitUntil(not eventPlayer.isUsingUltimate(), Math.INFINITY)
    
    eventPlayer.setAbility1Enabled(true)
    eventPlayer.setSecondaryFireEnabled(true)