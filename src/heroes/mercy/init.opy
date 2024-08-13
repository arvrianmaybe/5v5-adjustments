#!mainFile "../../dev_main.opy"

rule "[mercy/init.opy]: Initialize Mercy":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.MERCY

    setCustomHp(ADJ_MERCY_HEALTH, 0, 0)
    setUltCost(ADJ_MERCY_ULT_COST)

    eventPlayer.call_init = false