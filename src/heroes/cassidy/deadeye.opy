#!mainFile "../../dev_main.opy"


subroutine startDeadeye


rule "[cassidy/deadeye.opy]: OW1 deadeye damage + remove OW2 damage reduction during deadeye":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.CASSIDY
    @Condition eventPlayer.isUsingUltimate()

    async(startDeadeye, AsyncBehavior.RESTART)
    waitUntil(not eventPlayer.isUsingUltimate(), Math.INFINITY)
    eventPlayer.setAmmo(0, 6)
    eventPlayer.setDamageDealt(percent(eventPlayer._base_damage_scalar))
    eventPlayer.setDamageReceived(100)
    eventPlayer.setMoveSpeed(100)


def startDeadeye():
    @Name "[cassidy/deadeye.opy]: startDeadeye()"

    eventPlayer.setDamageDealt(percent(ADJ_MCCREE_DEADEYE_DAMAGE/OW2_MCCREE_DEADEYE_DAMAGE))
    eventPlayer.setDamageReceived(percent(100/(100-OW2_MCCREE_DEADEYE_DAMAGE_REDUCTION_MAX)))
    wait(OW2_MCCREE_DEADEYE_PENALTY_DURATION)
    if not eventPlayer.isUsingUltimate(): return
    eventPlayer.setDamageReceived(percent(100/(100-OW2_MCCREE_DEADEYE_DAMAGE_REDUCTION_MIN)))
    eventPlayer.setMoveSpeed(percent(OW2_MCCREE_DEADEYE_MOVE_SPEED_MIN/OW2_MCCREE_DEADEYE_MOVE_SPEED_MAX))