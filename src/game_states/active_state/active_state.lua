--make active state
function mk_active_state(level_config)
    music(0)
    local active_state = {
        p = mk_player(20,110),
        bullets= mk_ent_tbl(),
        enemy_bullets=mk_ent_tbl(),
        enemies = mk_ent_tbl(),
        rows = mk_ent_tbl(),
        explo_mgr=mk_explo_mgr(),
        update = function(self)
            self.level:update()
            self.p:update()
            self.enemies:update()
            self.bullets:update()
            self.enemy_bullets:update()
            self.explo_mgr:update()
            self.rows:update()
            handle_input(self)
            handle_col(self)

            for e in all(self.enemies.tbl) do
                if(e.y>128) e.y=-10
            end

            if(not self.p.alive and not self.explo_mgr:isExploding()) then
                game_state = mk_game_over_state()
            end
        end,
        
        draw = function(self)
            cls()
            self.p:draw()
            self.enemies:draw()
            self.bullets:draw()
            self.enemy_bullets:draw()
            self.explo_mgr:draw()
            rect(0,0,127,127,2)
        end,
        
    }

    active_state.level = mk_level(active_state, mk_level_1(active_state))
    return active_state
end