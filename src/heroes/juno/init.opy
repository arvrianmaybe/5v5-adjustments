#!mainFile "../../dev_main.opy"

rule "[kiriko/init.opy]: Initialize Kiriko":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.JUNO

    setCustomHp(ADJ_JUNO_HEALTH, 0, ADJ_JUNK_SHIELDS)
    setUltCost(ADJ_JUNO_ULT_COST)
    removeSelfHealing()

    setBaseDamage(eventPlayer, 0.9)
    setBaseHealing(eventPlayer, 0.85)

    eventPlayer.setAmmo(0, ADJ_JUNO_CLIP_SIZE)
    eventPlayer.setMaxAmmo(0, ADJ_JUNO_CLIP_SIZE)

    eventPlayer.call_init = false