#!mainFile "../../dev_main.opy"

#!include "heroes/cassidy/roll.opy"
#!include "heroes/cassidy/deadeye.opy"
#!include "heroes/cassidy/flashbang.opy"

rule "[mccree/init.opy]: Initialize Cassidy":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.CASSIDY
    
    setCustomHp(ADJ_MCCREE_HEALTH, 0, 0)
    setUltCost(ADJ_MCCREE_ULT_COST)
    removeSelfHealing()

    eventPlayer.call_init = false