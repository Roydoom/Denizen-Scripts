#socket_gem_defense_max_health_handler:
#    type: world
#    debug: false
#    events:
#        on player damages entity priority:-10:
#        - define critchance 0
#        - define gem_count 0
#        - foreach <context.damager.equipment.include[<context.damager.item_in_hand>]>
#        {
#            - define gem_count <def[gem_count].add[<def[value].nbt.filter[matches[socket[0-9]+_gem/socket_gem_attack_crit_chance]].size||0>]>
#        }
#        - define critchance <def[gem_count].mul[5]>
#        - if <util.random.int[1].to[1000]> <= <def[critchance]>
#        {
#            - determine <context.damage.mul[1.5]>
#            - playeffect <context.entity.location.add[0,0.5,0]> effect:crit quantity:20 offset:0.0 
#        }

socket_gem_defense_max_health_head:
    debug: false
    type: item
    material: emerald[flags=li@HIDE_ATTRIBUTES|HIDE_ENCHANTS;nbt=li@uncraftable/true|gem_type/defense|gem_specific/socket_gem_defense_max_health_chest|gem_attribute1/generic&dotmaxHealth/head/0/2.0]
    display name: "<&9>Gem of Helmet Maximum Health"
    lore:
    - "<&6>Gem"
    - "<&9>Defense"
    - "<&f>+2 Max Health when added to Helmet"
    enchantments:
    - MENDING:1