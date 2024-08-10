function mk_shoot_bug(state,x,y)
    local shoot_interval = 60
    return {
        type=ENEMY_TYPE.SHOOTY,
        x=x,
        y=y,
        shoot_timer=0,
        col=function(self) --collider
            return {
             self.x,
             self.y,
             self.x+7,
             self.y+7
            }
        end,
        update=function(self)
            self.shoot_timer +=1
            if(self.shoot_timer >= shoot_interval) then
                state.enemy_bullets:add(mk_shooty_bullet(self.x+3,self.y+7))
                self.shoot_timer = 0
            end
        end,
        draw=function(self)
            spr(7, self.x, self.y)
        end
    }
end

function mk_shooty_bullet(x,y)
    local flash_interval =3
    return{
        t=0,
        flashing = false,
        x=x,
        y=y,
        col=function(self) --collider
            return {
             self.x,
             self.y,
             self.x+3,
             self.y+3
            }
        end,
        draw=function(self)
            if(self.flashing)then
                spr(39,self.x,self.y)
            else
                spr(23,self.x,self.y)
            end
        end,
        update=function(self)
            self.y+=2
            self.t+=1
            if(self.t%flash_interval == 0) self.flashing = not self.flashing
        end
    }
end