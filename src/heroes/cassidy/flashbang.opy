#!mainFile "../../dev_main.opy"

rule "[cassidy/flashbang.opy]: Set flashbang":
    @Event playerDealtDamage
    @Hero cassidy
    @Condition eventAbility == Button.ABILITY_2

    victim.setMoveSpeed(percent(1/ADJ_MCCREE_FLASHBANG_SPEED_REDUCTION))
    wait(OW2_MCCREE_FLASHBANG_HINDER_DURATION)
    victim.setMoveSpeed(100)