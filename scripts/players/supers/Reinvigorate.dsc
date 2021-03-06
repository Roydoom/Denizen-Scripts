"Reinvigorate Player Target Condition":
    debug: false
    type: world
    events:
        on mm denizen mechanic:
        - if <context.skill> == "reinvigorate-targeter"
        {
            - define cost 100
            - if <context.targettype> != "ENTITY"
            {
                - determine false
            }
            - if <context.target.is_player.not>
            {
                - determine false
            }
            - if <context.caster.location.distance[<context.target.location>]> > 20
            {
                - determine false
            }
#            - narrate "Target name: <context.target.name>" targets:<context.caster>
#            - narrate "Is not player: <context.target.is_player.not>" targets:<context.caster>
#            - narrate "Distance between caster and target: <context.caster.location.distance[<context.target.location>]>" targets:<context.caster>
#            - heal <context.target> 30
            - narrate "<&a>You imbue <&b><context.target.name><&a> with a surge of healing magic!" targets:<context.caster>
            - yaml id:super-counter set energy.<context.caster.uuid>:<yaml[super-counter].read[energy.<context.caster.uuid>].sub[<def[cost]>]>
#            - narrate "mmskillcast caster:<context.caster> target:<context.target> skill:Reinvigorate-Heal" targets:<context.caster>
            - define reinvigorate-particle-count 40
            - repeat 40
            {
                - playeffect <context.target.location.add[0,<def[reinvigorate-particle-count].div[2]>,0]> effect:VILLAGER_HAPPY visibility:500 quantity:4 offset:0.4,0,0.4
                - define reinvigorate-particle-count <def[reinvigorate-particle-count].sub[1]>
                - if <def[reinvigorate-particle-count].mod[2]> == 0
                {
                    - wait 1t
                }
                - if <def[reinvigorate-particle-count]> == 0
                {
                    - mmcastplayer caster:<context.caster> target:<context.target> skill:Reinvigorate-Heal
                }
            }
            - define reinvigorate-particle-count 0
            - repeat 160
            {
                - playeffect <context.target.location.add[0,<def[reinvigorate-particle-count].div[4]>,0]> effect:VILLAGER_HAPPY visibility:500 quantity:8 offset:0.8,0,0.8
                - playeffect <context.target.location> effect:VILLAGER_HAPPY visibility:500 quantity:10 offset:<def[reinvigorate-particle-count].div[32]>,<def[reinvigorate-particle-count].div[32]>,<def[reinvigorate-particle-count].div[32]>
                - define reinvigorate-particle-count <def[reinvigorate-particle-count].add[1]>
            }
        }