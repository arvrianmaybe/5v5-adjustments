#!mainFile "../../dev_main.opy"

rule "[kiriko/wall_climb.opy]: set wall climb duration":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.KIRIKO
    @Condition eventPlayer.isOnWall()

    wait(ADJ_KIRIKO_WALL_CLIMB_DURATION, Wait.ABORT_WHEN_FALSE)
    eventPlayer.cancelPrimaryAction()