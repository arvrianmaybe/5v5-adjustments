#!mainFile "../../dev_main.opy"

#!include "heroes/zenyatta/discord.opy"

rule "[zenyatta/init.opy]: Initialize Zenyatta":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.ZENYATTA

    setCustomHp(
        ADJ_ZENYATTA_HEALTH,
        0,
        ADJ_ZENYATTA_DUPLICATE_SHIELD if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_SUPPORT_HP else ADJ_ZENYATTA_SHIELDS)
    
    setUltCost(ADJ_ZENYATTA_ULT_COST)
    removeSelfHealing()

    eventPlayer.call_init = false