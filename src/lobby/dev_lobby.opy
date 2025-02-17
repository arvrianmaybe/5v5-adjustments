#!mainFile "../dev_main.opy"

# Environment Variables
#!define GAMEMODE_VERSION "Developer Build"
#!define GAMEMODE_NAME "5v5 Adjustments"
#!define GAMEMODE_DESCRIPTION (GAMEMODE_NAME + " " + GAMEMODE_VERSION + "\n" + \
                               "\n" + \
                               "Intended 5v5 gameplay, by viper" + "\n" + \
                               "\n" + \
                               "Main build: " + GAMEMODE_CODE + "\n" + \
                               "Staging build: " + STAGING_CODE + "\n" + \
                               "\n" + \
                               "Gamemode forked from" + "\n" + \
                               "Overwatch 1 Emulator v1.12.2 (KHTG0)" + "\n" + \
                               "by ecksdee#11729" + "\n" + \
                               "\n" + \
                               "Codebase Contributors:" + "\n" + \
                               "viper" + "\n" + \
                               "ecksdee#4643" + "\n" + \
                               "Toastie#11770" + "\n" + \
                               "\n" + \
                               "workshop.codes/ow1classic" + "\n" + \
                               "\n" + \
                               "Discord:" + "\n" + \
                               DISCORD_SHORT_LINK + "\n" + \
                               DISCORD_LONG_LINK + "\n" + \
                               "\n" + \
                               "Source code:" + "\n" + \
                               DISCORD_LONG_LINK + "\n" + \
                               SOURCE_CODE_LINK)
#!define GAMEMODE_CODE "NC336"
#!define STAGING_CODE "nothing"
#!define DISCORD_SHORT_LINK "dsc.gg/runece"
#!define DISCORD_LONG_LINK "discord.gg/vb5r2gfNTQ"
#!define SOURCE_CODE_LINK "https://github.com/arvrianmaybe/5v5-adjustments"


rule "Copyright (c) 2024 Overwatch 1 Emulator. See github.com/Overwatch-1-Emulator/ow1-emulator for license to use this code.":
    @Disabled
    disableInspector()


settings {
    "main": {
        "modeName": GAMEMODE_NAME + " " + GAMEMODE_VERSION,
        "description": GAMEMODE_DESCRIPTION,
    },
    "lobby": {
        "allowPlayersInQueue": true,
        "mapRotation": "afterGame",
        "enableMatchVoiceChat": true,
        "spectatorSlots": 12,
        "team1Slots": 5,
        "team2Slots": 0,
        "returnToLobby": "afterGame",
        "teamBalancing": "off",
        # "minimumLatencyInNs": 50000000
    },
    "gamemodes": {
        "practiceRange": {
            "enabledMaps": [ "practiceRange" ]
        },
        "general": {
            "heroLimit": "1PerTeam",
            "roleLimit": "off",
            "gamemodeStartTrigger": "allSlotsFilled",
            "tankPassiveHealthBonus": "disabled",
            "enableCompetitiveRules": true
        }
    },
    "heroes": {
        "allTeams": {
            "ana": {
                "ability1Cooldown%": percent(ADJ_ANA_SLEEP_DART_COOLDOWN_TIME/OW2_ANA_SLEEP_DART_COOLDOWN_TIME),
                "ultGen%": percent(OW2_ANA_ULT_COST/ADJ_ANA_ULT_COST)
            },
            "ashe": {
                "ability1EnemyKb%": 112,
                "health%": percent(ADJ_ASHE_BOB_HEALTH/OW2_ASHE_BOB_HEALTH),
                "ultGen%": percent(OW2_ASHE_ULT_COST/ADJ_ASHE_ULT_COST)
            },
            "baptiste": {
                "ability1Cooldown%": percent(ADJ_BAPTISTE_REGEN_BURST_COOLDOWN/OW2_BAPTISTE_REGEN_BURST_COOLDOWN),
                "health%": percent(ADJ_BAPTISTE_LAMP_HP/OW2_BAPTISTE_LAMP_HP),
                "ultGen%": percent(OW2_BAPTISTE_ULT_COST/ADJ_BAPTISTE_ULT_COST)
            },
            "bastion": {
                "ultGen%": percent(OW2_BASTION_ULT_COST/ADJ_BASTION_ULT_COST),
                "ability1Cooldown%": percent(ADJ_BASTION_RECONFIGURE_COOLDOWN/OW2_BASTION_RECONFIGURE_COOLDOWN)
            },
            "brigitte": {
                "ability2Cooldown%": percent(ADJ_BRIGITTE_REPAIR_PACK_COOLDOWN/OW2_BRIGITTE_REPAIR_PACK_COOLDOWN),
                "ultGen%": percent(OW2_BRIGITTE_ULT_COST/ADJ_BRIGITTE_ULT_COST)
            },
            "cassidy": {
                "ultGen%": percent(OW2_MCCREE_ULT_COST/ADJ_MCCREE_ULT_COST)
            },
            "dva": {
                "secondaryFireMaximumTime%": percent(ADJ_DVA_MATRIX_DURATION/OW2_DVA_MATRIX_DURATION),
                "health%": percent(ADJ_DVA_PILOT_HEALTH/OW2_DVA_PILOT_HEALTH), # for pilot dva hp
                "ultGen%": percent(OW2_DVA_ULT_COST/ADJ_DVA_ULT_COST)
            },
            "doomfist": {
                # for some reason, overpy thinks power block is ability 1 and slam is ability 2
                "ability1Cooldown%": percent(ADJ_DOOMFIST_POWER_BLOCK_COOLDOWN/OW2_DOOMFIST_POWER_BLOCK_COOLDOWN),
                "ability2Cooldown%": percent(ADJ_DOOMFIST_SEISMIC_SLAM_COOLDOWN/OW2_DOOMFIST_SEISMIC_SLAM_COOLDOWN),
                "ultGen%": percent(OW2_DOOMFIST_ULT_COST/ADJ_DOOMFIST_ULT_COST)
            },
            "echo": {
                "ultGen%": percent(OW2_ECHO_ULT_COST/ADJ_ECHO_ULT_COST)
            },
            "genji": {
                "ultGen%": percent(OW2_GENJI_ULT_COST/ADJ_GENJI_ULT_COST)
            },
            "hanzo": {
                "ability1Cooldown%": percent(ADJ_HANZO_SONIC_ARROW_COOLDOWN/OW2_HANZO_SONIC_ARROW_COOLDOWN),
                "ability2Cooldown%": percent(ADJ_HANZO_STORM_COOLDOWN/OW2_HANZO_STORM_COOLDOWN),
                "ability2Quantity%": ADJ_HANZO_STORM_QUANTITY,
                "ultGen%": percent(OW2_HANZO_ULT_COST/ADJ_HANZO_ULT_COST)
            },
            "illari": {
                "ability2Cooldown%": percent(ADJ_ILLARI_PYLON_COOLDOWN/OW2_ILLARI_PYLON_COOLDOWN),
                "ultGen%": percent(OW2_ILLARI_ULT_COST/ADJ_ILLARI_ULT_COST)
            },
            "junkerQueen": {
                "ability1Cooldown%": percent(ADJ_JUNKERQUEEN_SHOUT_COOLDOWN_TIME/OW2_JUNKERQUEEN_SHOUT_COOLDOWN_TIME),
                "health%": percent(ADJ_JUNKERQUEEN_SHOUT_OVERHEALTH/OW2_JUNKERQUEEN_SHOUT_OVERHEALTH), # for shout overhealth
                "ultGen%": percent(OW2_JUNKERQUEEN_ULT_COST/ADJ_JUNKERQUEEN_ULT_COST)
            },
            "junkrat": {
                "ability1Cooldown%": percent(ADJ_JUNKRAT_CONCUSSION_MINE_COOLDOWN/OW2_JUNKRAT_CONCUSSION_MINE_COOLDOWN),
                "ultGen%": percent(OW2_JUNKRAT_ULT_COST/ADJ_JUNKRAT_ULT_COST)
            },
            "kiriko": {
                "ability1Cooldown%": percent(ADJ_KIRIKO_SWIFT_STEP_COOLDOWN/OW2_KIRIKO_SWIFT_STEP_COOLDOWN),
                "ultGen%": percent(OW2_KIRIKO_ULT_COST/ADJ_KIRIKO_ULT_COST)
            },
            "lifeweaver": {
                "secondaryFireCooldown%": percent(ADJ_LIFEWEAVER_PLATFORM_COOLDOWN/OW2_LIFEWEAVER_PLATFORM_COOLDOWN),
                "secondaryFireHealth%": percent(ADJ_LIFEWEAVER_PLATFORM_HEALTH/OW2_LIFEWEAVER_PLATFORM_HEALTH),
                "ultHealth%": percent(ADJ_LIFEWEAVER_TREE_HEALTH/OW2_LIFEWEAVER_TREE_HEALTH),
                "ultGen%": percent(OW2_LIFEWEAVER_ULT_COST/ADJ_LIFEWEAVER_ULT_COST)
            },
            "lucio": {
                "ability2Cooldown%": percent(ADJ_LUCIO_AMP_COOLDOWN/OW2_LUCIO_AMP_COOLDOWN),
                "secondaryFireCooldown%": percent(ADJ_LUCIO_AMP_COOLDOWN/OW2_LUCIO_AMP_COOLDOWN),
                "secondaryFireKb%": percent(ADJ_LUCIO_SOUNDWAVE_KNOCKBACK/OW2_LUCIO_SOUNDWAVE_KNOCKBACK),
                "ultGen%": percent(OW2_LUCIO_ULT_COST/ADJ_LUCIO_ULT_COST)
            },
            "mauga": {
                "primaryFireIgniteDamage": percent(ADJ_MAUGA_BURN_DPS/((ADJ_MAUGA_CHAINGUN_DAMAGE/OW2_MAUGA_CHAINGUN_DAMAGE)*OW2_MAUGA_BURN_DPS)),
                "primaryFireIgniteRate": percent(OW2_MAUGA_BURN_RATE/ADJ_MAUGA_BURN_RATE),
                "ability1Cooldown%": percent(ADJ_MAUGA_OVERRUN_COOLDOWN/OW2_MAUGA_OVERRUN_COOLDOWN),
                "ability2Cooldown%": percent((ADJ_MAUGA_CARDIAC_COOLDOWN + OW2_MAUGA_CARDIAC_DURATION)/(OW2_MAUGA_CARDIAC_COOLDOWN + OW2_MAUGA_CARDIAC_DURATION)),
                "ultGen%": percent(OW2_MAUGA_ULT_COST/ADJ_MAUGA_ULT_COST)
            },
            "mei": {
                "ammoClipSize%": percent(ADJ_MEI_AMMO_COUNT/OW2_MEI_AMMO_COUNT),
                "health%": percent(ADJ_MEI_ICEWALL_HP/OW2_MEI_ICEWALL_HP),
                "ultGen%": percent(OW2_MEI_ULT_COST/ADJ_MEI_ULT_COST)
            },
            "mercy": {
                "ability1Cooldown%": percent(ADJ_MERCY_GA_COOLDOWN/OW2_MERCY_GA_COOLDOWN),
                "ultGen%": percent(OW2_MERCY_ULT_COST/ADJ_MERCY_ULT_COST),
            },
            "moira": {
                "ultGen%": percent(OW2_MOIRA_ULT_COST/ADJ_MOIRA_ULT_COST),
            },
            "orisa": {
                "ability1Cooldown%": percent(ADJ_ORISA_FORTIFY_COOLDOWN/OW2_ORISA_FORTIFY_COOLDOWN),
                "ability2Cooldown%": percent(ADJ_ORISA_JAVELIN_SPIN_COOLDOWN/OW2_ORISA_JAVELIN_SPIN_COOLDOWN),
                "ultGen%": percent(OW2_ORISA_ULT_COST/ADJ_ORISA_ULT_COST)
            },
            "pharah": {
                "passiveExtraFuel%": 0,
                "ability2Cooldown%": percent(ADJ_PHARAH_CONCUSSIVE_BLAST_COOLDOWN/OW2_PHARAH_CONCUSSIVE_BLAST_COOLDOWN),
                "ultGen%": percent(OW2_PHARAH_ULT_COST/ADJ_PHARAH_ULT_COST)
            },
            "ramattra": {
                "ability1Cooldown%": percent(ADJ_RAMATTRA_NEMESIS_COOLDOWN/OW2_RAMATTRA_NEMESIS_COOLDOWN),
                "ability2Cooldown%": percent(ADJ_RAMATTRA_VORTEX_COOLDOWN/OW2_RAMATTRA_VORTEX_COOLDOWN),
                "health%": percent(ADJ_RAMATTRA_BARRIER_HEALTH/OW2_RAMATTRA_BARRIER_HEALTH),
                "ultGen%": percent(OW2_RAMATTRA_ULT_COST/ADJ_RAMATTRA_ULT_COST),
            },
            "reaper": {
                "ability2Cooldown%": percent(ADJ_REAPER_SHADOW_STEP_COOLDOWN/OW2_REAPER_SHADOW_STEP_COOLDOWN),
                "ultGen%": percent(OW2_REAPER_ULT_COST/ADJ_REAPER_ULT_COST)
            },
            "reinhardt": {
                "secondaryFireRechargeRate%": percent(ADJ_REINHARDT_BARRIER_REGEN/OW2_REINHARDT_BARRIER_REGEN),
                "ability1Cooldown%": percent(ADJ_REINHARDT_CHARGE_COOLDOWN_TIME/OW2_REINHARDT_CHARGE_COOLDOWN_TIME),
                "health%": percent(ADJ_REINHARDT_BARRIER_HEALTH/OW2_REINHARDT_BARRIER_HEALTH),
                "ultGen%": percent(OW2_REINHARDT_ULT_COST/ADJ_REINHARDT_ULT_COST)
            },
            "roadhog": {
                "secondaryFireMaximumTime%": percent(ADJ_ROADHOG_BREATHER_DURATION/OW2_ROADHOG_BREATHER_DURATION),
                "secondaryFireRechargeRate%": percent(ADJ_ROADHOG_BREATHER_RECHARGE_DURATION/OW2_ROADHOG_BREATHER_RECHARGE_DURATION),
                "ability1Cooldown%": percent(ADJ_ROADHOG_HOOK_COOLDOWN_TIME/OW2_ROADHOG_HOOK_COOLDOWN_TIME),
                "ultGen%": percent(OW2_ROADHOG_ULT_COST/ADJ_ROADHOG_ULT_COST)
            },
            "sigma": {
                "secondaryFireRechargeRate%": percent(ADJ_SIGMA_BARRIER_REGEN/OW2_SIGMA_BARRIER_REGEN),
                "ability1Cooldown%": percent(ADJ_SIGMA_KINETIC_GRASP_COOLDOWN/OW2_SIGMA_KINETIC_GRASP_COOLDOWN),
                "ultGen%": percent(OW2_SIGMA_ULT_COST/ADJ_SIGMA_ULT_COST),
            },
            "sojourn": {
                "ability1Cooldown%": percent(ADJ_SOJOURN_SLIDE_COOLDOWN/OW2_SOJOURN_SLIDE_COOLDOWN),
                "ultGen%": percent(OW2_SOJOURN_ULT_COST/ADJ_SOJOURN_ULT_COST)
            },
            "soldier": {
                "ability2Cooldown%": percent(ADJ_SOLDIER_BIOTIC_FIELD_COOLDOWN/OW2_SOLDIER_BIOTIC_FIELD_COOLDOWN),
                "ultGen%": percent(OW2_SOLDIER_ULT_COST/ADJ_SOLDIER_ULT_COST)
            },
            "sombra": {
                "ability1Cooldown%": percent(ADJ_SOMBRA_VIRUS_COOLDOWN/OW2_SOMBRA_VIRUS_COOLDOWN),
                "ultGen%": percent(OW2_SOMBRA_ULT_COST/ADJ_SOMBRA_ULT_COST)
            },
            "symmetra": {
                "health%": percent(ADJ_SYMMETRA_TURRET_HEALTH/OW2_SYMMETRA_TURRET_HEALTH),
                "ultGen%": percent(OW2_SYMMETRA_ULT_COST/ADJ_SYMMETRA_ULT_COST)
            },
            "torbjorn": {
                "health%": percent(ADJ_TORBJORN_TURRET_HEALTH/OW2_TORBJORN_TURRET_HEALTH),
                "ultGen%": percent(OW2_TORBJORN_ULT_COST/ADJ_TORBJORN_ULT_COST)
            },
            "tracer": {
                "ability2Cooldown%": percent(ADJ_TRACER_RECALL_COOLDOWN/OW2_TRACER_RECALL_COOLDOWN),
                "health%": percent(ADJ_TRACER_HEALTH/OW2_TRACER_HEALTH),
                "ultGen%": percent(OW2_TRACER_ULT_COST/ADJ_TRACER_ULT_COST)
            },
            "venture": {
                "secondaryFireCooldown%": percent(ADJ_VENTURE_DRILL_DASH_COOLDOWN/OW2_VENTURE_DRILL_DASH_COOLDOWN),
                "health%": percent(ADJ_VENTURE_EXPLORER_SHIELDS/OW2_VENTURE_EXPLORER_SHIELDS),
                "ultGen%": percent(OW2_VENTURE_ULT_COST/ADJ_VENTURE_ULT_COST),
            },
            "widowmaker": {
                "ultGen%": percent(OW2_WIDOWMAKER_ULT_COST/ADJ_WIDOWMAKER_ULT_COST)
            },
            "winston": {
                "health%": percent(ADJ_WINSTON_BARRIER_HEALTH/OW2_WINSTON_BARRIER_HEALTH),
                "ability1Cooldown%": percent(ADJ_WINSTON_JUMP_PACK_COOLDOWN_TIME/OW2_WINSTON_JUMP_PACK_COOLDOWN_TIME),
                "ultGen%": percent(OW2_WINSTON_ULT_COST/ADJ_WINSTON_ULT_COST)
            },
            "hammond": {
                "ability1Kb%": percent(ADJ_WRECKING_BALL_FIREBALL_KB/OW2_WRECKING_BALL_FIREBALL_KB),
                "ability3Cooldown%": percent(ADJ_WRECKING_BALL_PILEDRIVER_COOLDOWN_TIME/OW2_WRECKING_BALL_PILEDRIVER_COOLDOWN_TIME),
                "health%": percent(ADJ_WRECKING_BALL_SHIELD_PER_TARGET/OW2_WRECKING_BALL_SHIELD_PER_TARGET),
                "ultGen%": percent(OW2_WRECKING_BALL_ULT_COST/ADJ_WRECKING_BALL_ULT_COST),
            },
            "zarya": {
                "health%": percent(ADJ_ZARYA_BARRIER_HEALTH/OW2_ZARYA_BARRIER_HEALTH),
                "ultGen%": percent(OW2_ZARYA_ULT_COST/ADJ_ZARYA_ULT_COST)
            },
            "zenyatta": {
                "ultGen%": percent(OW2_ZENYATTA_ULT_COST/ADJ_ZENYATTA_ULT_COST)
            },
        }
    }
}