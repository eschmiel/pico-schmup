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
    local active_state = {
        wave=1,
        p = mk_player(20,110),
        bullets= mk_ent_tbl(),
        enemy_bullets=mk_ent_tbl(),
        -- enemies=mk_ent_tbl({unpack(init_enemies), mk_shield_bug(30,30), mk_shield_bug(50,30)}),
        enemies = mk_ent_tbl(),
        rows = mk_ent_tbl(),
        -- row = mk_row({sb1, sb2}),
        explo_mgr=mk_explo_mgr(),
        update = function(self)
            self.p:update()
            self.enemies:update()
            self.bullets:update()
            self.enemy_bullets:update()
            self.explo_mgr:update()
            self.rows:update()
            handle_input(self)
            handle_col(self)

            if(not self.p.alive and not self.explo_mgr:isExploding()) then
                game_state = mk_game_over_state()
            end
            if(#self.enemies.tbl < 1) then
                if(self.wave==1) then
                    self:setup_wave_2()
                elseif(self.wave==2) then
                    self:setup_wave_3()
                else
                    game_state = mk_game_over_state(true)
                end
                self.wave+=1
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
        setup_wave_1=function(self)
            self.enemies=mk_ent_tbl({unpack(init_enemies)})
        end,
        setup_wave_2=function(self)
            local sb1 = mk_shield_bug(15,60)
            local sb2 =  mk_shield_bug(32,60)
            local init_enemies = {}
            for pos in all(init_enemies_pos) do
                add(init_enemies, mk_bug(pos[1],pos[2]))
            end
            self.enemies=mk_ent_tbl({sb1, sb2, unpack(init_enemies)})      
            self.rows = mk_ent_tbl({mk_row({sb1, sb2},1,100)})
        end,
        setup_wave_3=function(self)
            
            local r1 ={
                mk_shoot_bug(self,30,10),
                mk_shoot_bug(self,50,10),
                mk_shoot_bug(self,70,10),
                mk_shoot_bug(self,90,10),
                -- mk_shoot_bug(self,11,10),
                mk_shoot_bug(self,10,10),
            }
            local r2 ={
                mk_shoot_bug(self,30,20),
                mk_shoot_bug(self,50,20),
                mk_shoot_bug(self,70,20),
                mk_shoot_bug(self,90,20),
                -- mk_shoot_bug(self,110,20),
                mk_shoot_bug(self,10,20),
            }
            local r3 ={
                mk_shoot_bug(self,30,30),
                mk_shoot_bug(self,50,30),
                mk_shoot_bug(self,70,30),
                mk_shoot_bug(self,90,30),
                -- mk_shoot_bug(self,110,30),
                mk_shoot_bug(self,10,30),
            }
            local r4 ={
                mk_shoot_bug(self,30,40),
                mk_shoot_bug(self,50,40),
                mk_shoot_bug(self,70,40),
                mk_shoot_bug(self,90,40),
                -- mk_shoot_bug(self,110,40),
                mk_shoot_bug(self,10,40),
            }
            local r5 ={
                mk_shield_bug(15,60), mk_shield_bug(32,60),mk_shield_bug(60,60), mk_shield_bug(77,60)
            }

            self.rows=mk_ent_tbl({
                mk_row(r1,.5,25),mk_row(r2,.5,25),mk_row(r3,.5,25),mk_row(r4,.5,25),mk_row(r5,.2,40)
            })

            for row in all(self.rows.tbl) do
                for e in all(row.enemies) do
                    add(self.enemies:add(e))
                end
            end
            
        end
    }

    active_state:setup_wave_1()
    

    return active_state
end

function mk_row(enemies,spd,endX)
    return {
        spd = spd,
        d = 1,
        x = 0,
        endX = endX,
        enemies=enemies,
        update=function(self)
            self.x += self.spd * self.d
            for enemy in all(enemies) do
                enemy.x+= self.spd * self.d
                if(self.x > self.endX or self.x < 0) enemy.y += 2
            end

            if(self.x > self.endX or self.x < 0) then
                self.d *= -1
                self.spd+=.02
            end
        end
    }
end