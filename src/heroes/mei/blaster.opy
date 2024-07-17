#!mainFile "../../dev_main.opy"

playervar freeze_movement_progress
playervar freeze_slow_linger_time
playervar freeze_move_penalty

subroutine clearFreezeEffect

rule "[mei/blaster.opy]: Track movement on enemy":
    @Event playerDealtDamage
    @Hero mei
    @Condition eventAbility == Button.PRIMARY_FIRE
    @Condition victim.freeze_movement_progress < 100

    stopChasingVariable(victim.freeze_slow_linger_time)

    if victim.freeze_movement_progress == 0: # victims started taking freeze damage
        victim.freeze_movement_progress = ADJ_MEI_MINIMUM_FREEZE
    else:
        victim.freeze_movement_progress += ADJ_MEI_FREEZE_PERCENT_PER_TICK # 2.85% each tick from wiki

    victim.freeze_move_penalty = victim.freeze_movement_progress if victim.freeze_movement_progress < ADJ_MEI_FREEZE_MAX_SLOW else ADJ_MEI_FREEZE_MAX_SLOW
    # victim.setMoveSpeed(100-victim.freeze_move_penalty)
    
    victim.freeze_slow_linger_time = 0
    chase(victim.freeze_slow_linger_time, ADJ_MEI_FREEZE_SLOW_LINGER_DURATION, rate=1, ChaseReeval.NONE)


rule "[mei/blaster.opy]: Freeze enemy":
    @Event playerTookDamage
    @Hero all
    @Condition victim.freeze_movement_progress >= 100

    setBaseMovement(victim, eventPlayer._base_movement_scalar*(1-ADJ_MEI_FREEZE_DURATION))
    wait(1)
    clearFreezeEffect()
    

rule "[mei/blaster.opy]: clear freeze after exceeding linger time":
    @Event eachPlayer
    @Hero all
    @Condition eventPlayer.freeze_slow_linger_time >= ADJ_MEI_FREEZE_SLOW_LINGER_DURATION

    clearFreezeEffect()


def clearFreezeEffect():
    @Name "[mei/blaster.opy]: clearFreezeEffect()"
    
    stopChasingVariable(eventPlayer.freeze_slow_linger_time)
    eventPlayer.setMoveSpeed(100)
    eventPlayer.freeze_movement_progress = 0