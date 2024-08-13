#!mainFile "../../dev_main.opy"

rule "[brigitte/bash.opy]: Add stun to shield bash":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.BRIGITTE
    @Condition attacker.isFiringSecondaryFire()
    @Condition eventAbility == Button.PRIMARY_FIRE
    
    victim.setStatusEffect(attacker, Status.STUNNED, ADJ_BRIGITTE_SHIELD_BASH_STUN_DURATION)