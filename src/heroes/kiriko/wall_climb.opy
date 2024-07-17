#!mainFile "../../dev_main.opy"

rule "[kiriko/wall_climb.opy]: set wall climb duration":
    @Event eachPlayer
    @Hero kiriko
    @Condition eventPlayer.isOnWall()

    wait(ADJ_KIRIKO_WALL_CLIMB_DURATION, Wait.ABORT_WHEN_FALSE)
    eventPlayer.cancelPrimaryAction()