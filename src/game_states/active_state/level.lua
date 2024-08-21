-- mark checkpoints
-- narrative screen to change to on lvl complete
--

--triggers
---timer
---death of a unit
---when all units are dead


-- waves
--- units
TRIGGER_TYPES={
    INIT='init'
}

function mk_level(state, config) 

    for unit in all(config.units) do
        if(unit.trigger.type==TRIGGER_TYPES.INIT) then
            for e in all(unit.enemies) do
                state.enemies:add(e)
            end
        end
    end

    return {
        update=function(self)
            for u in all(config.units) do
                if(
                    u.trigger.type==TRIGGER_TYPES.CLEAR
                    and #state.enemies.tbl < 1
                ) then
                    for e in all(u.enemies) do
                        state.enemies:add(e)
                    end
                end
            end
        end
    }
end

function mk_level_1(state) 
    return {
    units = {
        {
            enemies={
                mk_charge_bug( state, 30,30),
                mk_charge_bug(state,40,30)
            },
            trigger={
                type=TRIGGER_TYPES.INIT
            }
        },
        {
            enemies={
                mk_charge_bug(state,80,30),
                mk_charge_bug(state,90,30)
            },
            trigger={
                type=TRIGGER_TYPES.INIT
            }
        },
        {
            enemies={
                mk_charge_bug(state,30,20),
                mk_charge_bug(state,40,20)
            },
            trigger={
                type=TRIGGER_TYPES.CLEAR
            }
        }
    }
    -- unit = {
    --     enemies = {},
    --     trigger = {}
    -- }
}
end
