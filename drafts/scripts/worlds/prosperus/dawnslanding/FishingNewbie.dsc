FishingNewbieAssignment:
    type: assignment
    interact scripts:
    - 10 FishingNewbieInteract
    actions:
        on assignment:
        - teleport npc 'location:<anchor:fishingnewbie>'
        - trigger name:proximity toggle:true
        - trigger name:chat toggle:true
    
FishingNewbieFormat:
    type: format
    format: "<gray>Fishing Newbie<white><&co> <text>"

FishingNewbieInteract:
    type: interact
    steps:
        Unmet*:
            proximity trigger:
                script:
                - narrate format:FishingNewbieFormat "Oh, hi! I'm trying to learn how to fish. Maybe you can help me!"
                - zap TeachFishingNewbieOffer
        TeachFishingNewbieOffer:
            proximity trigger:
                script:
                - narrate format:FishingNewbieFormat "Do you think you can help me learn how to fish?"
            click trigger:
                script:
                - narrate format:PlayerChatformat "Sure, I can help you out."
                - run QuestAcceptHandler def:TeachFishingNewbie player:<player>
                - zap TeachFishingNewbieActive
            chat trigger:
                TeachFishingNewbieOffer:
                    trigger: /yes|sure|okay|great/
                    hide trigger message: true
                    script:
                    - narrate format:PlayerChatFormat "Sure, I can help you out."
                    - run QuestAcceptHandler def:TeachFishingNewbie player:<player>
        TeachFishingNewbieActive:
            proximity trigger:
                script:
                - narrate format:FishingNewbieFormat "Still fishing, huh? Be sure to look for those bubbles in the water!"
                - run QuestProgressHandler def:TeachFishingNewbie player:<player>
        DailyFishingOffer:
            proximity trigger:
                script:
                - narrate format:FishingNewbieFormat "Ready to catch some more fish?"
            chat trigger:
                DailyFishingOffer:
                    trigger: /yes|sure|okay|great/
                    hide trigger message: true
                    script:
                    - narrate format:PlayerChatFormat "Sure am!"
                    - run QuestAcceptHandler def:DailyFishing player:<player>
        DailyFishingActive:
            proximity trigger:
                script:
                - narrate format:FishingNewbieFormat "How's your fishing going? Good haul today?"
                - run QuestProgressHandler def:DailyFishing player:<player>
        DailyFishingChallengeOffer:
            proximity trigger:
                script:
                - narrate format:FishingNewbieFormat "Your fishing skills are pretty swell. But I've got a challenge for you - are you up for it?"
            chat trigger:
                DailyFishingChallengeOffer:
                    trigger: /yes|sure|okay|great/
                    hide trigger message: true
                    script:
                    - narrate format:PlayerChatFormat "Sure, I'm in!"
                    - run QuestAcceptHandler def:DailyFishingChallenge player:<player>

FishingNewbieFishingHandler:
    type: world
    debug: false
    events:
        on player fishes while caught_fish:
        - define data <player.uuid>_quest_data
        - if <yaml[<[data]>].contains[quests.active.DailyFishing].not> && <yaml[<[data]>].contains[quests.active.DailyFishingChallenge].not> && <yaml[<[data]>].contains[quests.active.TeachFishingNewbie].not>:
            - stop
        - if <yaml[<[data]>].contains[quests.active.DailyFishing]>:
            - yaml id:<[data]> set player_data.DailyFishing.stages.1.objectives.1.progress:++
            - if <yaml[<[data]>].read[player_data.DailyFishing.stages.1.objectives.1.progress]> >= 16:
                - run QuestCompletionHandler def:DailyFishing player:<player>
        - else if <yaml[<[data]>].contains[quests.active.DailyFishingChallenge]>:
            - yaml id:<[data]> set player_data.DailyFishingChallenge.stages.1.objectives.1.progress:++
            - if <yaml[<[data]>].read[player_data.DailyFishingChallenge.stages.1.objectives.1.progress]> >= 32:
                - run QuestCompletionHandler def:DailyFishingChallenge player:<player>
        - else if <yaml[<[data]>].contains[quests.active.TeachFishingNewbie]>:
            - yaml id:<[data]> set player_data.TeachFishingNewbie.stages.1.objectives.1.progress:++
            - if <yaml[<[data]>].read[player_data.TeachFishingNewbie.stages.1.objectives.1.progress]> >= 16:
                - run QuestCompletionHandler def:TeachFishingNewbie player:<player>