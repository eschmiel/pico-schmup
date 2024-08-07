init_enemies_pos = {
    {20, 10},
    {30, 10},
    {40, 10},
    {50, 10},
    {60, 10},
    {70, 10},
    {80, 10},
    {90, 10},
    {100, 10},
    {110, 10},
    {20, 20},
    {30, 20},
    {40, 20},
    {50, 20},
    {60, 20},
    {70, 20},
    {80, 20},
    {90, 20},
    {100, 20},
    {110, 20},
    {20, 30},
    {30, 30},
    {40, 30},
    {50, 30},
    {60, 30},
    {70, 30},
    {80, 30},
    {90, 30},
    {100, 30},
    {110, 30},
    {20, 40},
    {30, 40},
    {40, 40},
    {50, 40},
    {60, 40},
    {70, 40},
    {80, 40},
    {90, 40},
    {100, 40},
    {110, 40},
    {20, 50},
    {30, 50},
    {40, 50},
    {50, 50},
    {60, 50},
    {70, 50},
    {80, 50},
    {90, 50},
    {100, 50},
    {110, 50},
}

--make active state
function mk_active_state()
    music(0)
    init_enemies = {}
    for pos in all(init_enemies_pos) do
        add(init_enemies, mk_bug(pos[1],pos[2]))
    end
    return {
        p = mk_player(20,110),
        bullets= mk_ent_tbl(),
        enemies=mk_ent_tbl(init_enemies),
        explo_mgr=mk_explo_mgr(),
        update = function(self)
            self.p:update()
            self.enemies:update()
            self.bullets:update()
            self.explo_mgr:update()
            handle_input(self)
            handle_col(self)

            if(not self.p.alive and not self.explo_mgr:isExploding()) then
                game_state = mk_game_over_state()
            end
            if(#self.enemies.tbl < 1) game_state = mk_game_over_state(true)
        end,
        
        draw = function(self)
            cls()
            self.p:draw()
            self.enemies:draw()
            self.bullets:draw()
            self.explo_mgr:draw()
            rect(0,0,127,127,2)
        end,
    }
end