#!mainFile "../../dev_main.opy"

rule "[brigitte/rally.opy]: Set rally":
    @Event eachPlayer
    @Hero brigitte
    @Condition eventPlayer.isUsingUltimate()

    eventPlayer.setMoveSpeed(percent(ADJ_BRIGITTE_RALLY_SPEED_BUFF/OW2_BRIGITTE_RALLY_SPEED_BUFF)) # 30% movement speed buff during ralley

    waitUntil(not eventPlayer.isUsingUltimate(), 10)

    eventPlayer.setMoveSpeed(100)