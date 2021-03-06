config:
    availability:
        offering_npc: 194
    requirements:
        quests_completed:
        - "UnlockBlink"
        - "UnlockFarm"
        permissions:
        - magicspells.learn.farm-carrots
    rewards:
        money: 100
        quest_points: 3
    material: carrot
messages:
    offer: "<darkgreen>Skilled Sorcerer<white>: The Farm-Carrots spell allows you to channel nature magic to grow a large number of carrots around you. When you're ready to learn it, bring me what I need so that I can teach you."
    completion: "<darkgreen>Skilled Sorcerer<white>: Congratulations, you're ready to learn Farm-Carrots! Give it a try with <&dq>/cast farm-carrots.<&dq>"
player_data:
    UnlockFarm-Carrots:
        name: Learn the Farm-Carrots spell
        description: "Bring reagents to the Skilled Sorcerer and learn the Farm-Carrots spell!"
        stages:
            1:
                description: "Bring magical reagents to the Skilled Sorcerer."
                objectives:
                    1:
                        name: "Deliver redstone"
                        progress: 0
                        total: 256
                    2:
                        name: "Deliver carrots"
                        progress: 0
                        total: 2056
                    3:
                        name: "Deliver glowstone"
                        progress: 0
                        total: 512
                    4:
                        name: "Deliver gold ingots"
                        progress: 0
                        total: 128
                progress: 0
                total: 4
            2:
                description: "Bring crystallized experience to the Skilled Sorcerer."
                objectives:
                    1:
                        name: "Deliver a billet of crystallized experience"
                        progress: 0
                        total: 1
                progress: 0
                total: 1