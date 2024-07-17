#!mainFile "../../dev_main.opy"

#!include "heroes/brigitte/bash.opy"
#!include "heroes/brigitte/rally.opy"


rule "[brigitte/init.opy]: Initialize Brigitte":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.BRIGITTE

    setCustomHp(ADJ_BRIGITTE_HEALTH, ADJ_BRIGITTE_ARMOR, 0)
    setUltCost(ADJ_BRIGITTE_ULT_COST)
    removeSelfHealing()

    setBaseDamage(eventPlayer, ADJ_BRIGITTE_FLAIL_DAMAGE/OW2_BRIGITTE_FLAIL_DAMAGE)
    setBaseHealing(eventPlayer, ADJ_BRIGITTE_INSPIRE_TOTAL_HEALING/OW2_BRIGITTE_INSPIRE_TOTAL_HEALING)

    eventPlayer.call_init = false