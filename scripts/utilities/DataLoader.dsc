Data_Loader:
    type: world
    debug: false
    events:
        on server start:
        - yaml load:scriptdata/Events.yml id:events
        - yaml load:scriptdata/Rates.yml id:rates
        - yaml load:scriptdata/DropTables.yml id:droptables
        - yaml load:scriptdata/quests/QuestNPCList.yml id:quest_npc_list