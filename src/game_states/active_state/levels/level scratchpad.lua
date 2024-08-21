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
end,
setup_test_wave=function(self)
    local sr = mk_step_row({
        mk_march_bug(30,30),
        mk_march_bug(40,30),   
        mk_march_bug(50,30),  
        mk_march_bug(35,20), 
        mk_march_bug(45,20)    
    },45)
    local sr2 = mk_step_row({
        mk_march_bug(80,30),
        mk_march_bug(90,30),   
        mk_march_bug(100,30),
        mk_march_bug(70,30),
        mk_march_bug(110,30),   
        mk_march_bug(120,30),  
        mk_march_bug(75,20), 
        mk_march_bug(105,20),  
        mk_march_bug(85,20), 
        mk_march_bug(95,20)    
        },45)
    local sr3 = mk_step_row({
        mk_march_bug(80,0),
        mk_march_bug(90,0),   
        mk_march_bug(100,0),
        mk_march_bug(70,0),
        mk_march_bug(110,0),   
        mk_march_bug(120,0),  
        mk_march_bug(75,-10), 
        mk_march_bug(105,-10),   
        mk_march_bug(85,-10), 
        mk_march_bug(95,-10)    
        },45)
    local sr4 = mk_step_row({
        mk_march_bug(0,0),
        mk_march_bug(10,0),   
        mk_march_bug(20,0),
        mk_march_bug(30,0),
        mk_march_bug(40,0),   
        mk_march_bug(50,0),  
        mk_march_bug(5,-10), 
        mk_march_bug(15,-10),   
        mk_march_bug(25,-10), 
        mk_march_bug(35,-10)    
        },45)
    self.rows=mk_ent_tbl({
        mk_march_bat(20,-135),
        mk_march_bat(60,-150),
        mk_march_bat(70,-110),
        mk_march_bat2(self,10,-150),
        mk_march_bat2(self,20,-40),
        mk_march_bat2(self,60,-90),
        mk_march_bat(5,10),
        mk_march_bat(70,10)
    })
    for row in all(self.rows.tbl) do
        for e in all(row.enemies) do
            add(self.enemies:add(e))
        end
    end 
end,
setup_test_wave_2=function(self)
    self.enemies = mk_ent_tbl({
        mk_aimy_bug(self,30,30),
        mk_aimy_bug(self,100,30),
        mk_aimy_bug(self,30,40),
        mk_aimy_bug(self,100,40),
        mk_aimy_bug(self,60,30),
        mk_march_bug(40,30),
        mk_march_bug(50,30),
        mk_march_bug(70,30),
        mk_march_bug(80,30),
        mk_march_bug(40,40),
        mk_march_bug(50,40),
        mk_march_bug(40,50),
        mk_march_bug(70,40),
        mk_march_bug(80,40),
        mk_march_bug(50,50),
        mk_march_bug(70,50),
        mk_march_bug(80,50)

    })
end,
setup_test_wave_3=function(self)
    self.enemies = mk_ent_tbl({
        mk_aimy_bug(self,30,30),
        mk_aimy_bug(self,100,30),
        mk_aimy_bug(self,30,40),
        mk_aimy_bug(self,100,40),
        mk_aimy_bug(self,60,30),
        mk_shoot_bug(self,40,30),
        mk_shoot_bug(self,50,30),
        mk_shoot_bug(self,70,30),
        mk_shoot_bug(self,80,30),
        mk_shoot_bug(self,40,40),
        mk_shoot_bug(self,50,40),
        mk_shoot_bug(self,40,50),
        mk_shoot_bug(self,70,40),
        mk_shoot_bug(self,80,40),
        mk_shoot_bug(self,50,50),
        mk_shoot_bug(self,70,50),
        mk_shoot_bug(self,80,50)

    })
end


function mk_march_bat(x,y)
    return mk_step_row({
        mk_march_bug(x,y),
        mk_march_bug(x+10,y),   
        mk_march_bug(x+20,y),
        mk_march_bug(x+30,y),
        mk_march_bug(x+40,y),  
        mk_march_bug(x+5,y+10), 
        mk_march_bug(x+15,y+10),   
        mk_march_bug(x+25,y+10), 
        mk_march_bug(x+35,y+10)    
        },30)
end

function mk_march_bat2(state,x,y)
    return mk_step_row({
        mk_shoot_bug(state,x+5,y-10),
        mk_shoot_bug(state,x+15,y-10),
        mk_shoot_bug(state,x+25,y-10),
        mk_shoot_bug(state,x+35,y-10),
        mk_march_bug(x,y),
        mk_march_bug(x+10,y),   
        mk_march_bug(x+20,y),
        mk_march_bug(x+30,y),
        mk_march_bug(x+40,y),  
        mk_march_bug(x+5,y+10), 
        mk_march_bug(x+15,y+10),   
        mk_march_bug(x+25,y+10), 
        mk_march_bug(x+35,y+10),
        mk_shield_bug(x+10,y+20),
        mk_shield_bug(x+30,y+20)
        },30)
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

function mk_step_row(enemies,si)
    return {
        -- x step distance
        t = 1, -- timer
        si = si, -- step interval;
        d = 1,
        enemies=enemies,
        update=function(self)
            self.t += 1
            if(self.t%self.si==0) then
                for enemy in all(self.enemies) do
                    enemy.x += 5 * self.d
                    enemy.y += 5
                end
                self.d *= -1
                sfx(8)
            end
        end
    }
end

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

init_enemies = {}
    for pos in all(init_enemies_pos) do
        add(init_enemies, mk_bug(pos[1],pos[2]))
    end