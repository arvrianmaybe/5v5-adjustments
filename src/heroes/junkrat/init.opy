#!mainFile "../../dev_main.opy"


rule "[junkrat/init.opy]: Initialize Junkrat":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.JUNKRAT

    #Version or the "resetHealth" subroutine that keeps tire at 100 hp
    eventPlayer.removeAllHealthPools()
    wait()
    eventPlayer.setMaxHealth(100.001) # DO NOT REMOVE THIS LINE
    wait() # DO NOT REMOVE THIS LINE
    eventPlayer.setMaxHealth(100)

    eventPlayer.setHealingReceived(0)
    eventPlayer.setHealth(ADJ_JUNKRAT_HEALTH)
    eventPlayer.addHealthPool(Health.NORMAL, 1, true, true)
    eventPlayer.addHealthPool(Health.ARMOR, 1, true, true)
    eventPlayer.addHealthPool(Health.SHIELDS, 1, true, true)
    eventPlayer.removeAllHealthPools()

    resetStats()
    resetStatuses()
    enableAllAbilities()

    setUltCost(ADJ_JUNKRAT_ULT_COST)
    removeSelfHealing()

    setBaseDamage(eventPlayer, ADJ_JUNKRAT_FRAG_DAMAGE/OW2_JUNKRAT_FRAG_DAMAGE)

    eventPlayer.call_init = false


rule "[junkrat/init.opy]: Correct Junkrat invalid health": # Sometimes Junkrat can retain 250 HP between rounds
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.JUNKRAT
    @Condition eventPlayer.getMaxHealthOfType(Health.NORMAL) != ADJ_JUNKRAT_HEALTH
    @Condition not eventPlayer.call_init

    eventPlayer.call_init = true