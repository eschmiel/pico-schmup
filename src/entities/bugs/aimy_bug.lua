function mk_aimy_bug(state,x,y)
    local shoot_interval = 60
    return {
        type=ENEMY_TYPE.AIMY,
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
                local direction = direction_from_to({self.x+4,self.y+4},{state.p.x+3,state.p.y+3})
                state.enemy_bullets:add(mk_aimy_bullet(state,self.x+4+direction[1]*6,self.y+4+direction[2]*6))
                self.shoot_timer = 0
            end
        end,
        draw=function(self)
            local direction = direction_from_to({self.x+4,self.y+4},{state.p.x+3,state.p.y+3})
            circ(self.x+4+direction[1]*2,self.y+4+direction[2]*2,2,3)
            circ(self.x+4+direction[1]*6,self.y+4+direction[2]*6,1,3)
            spr(9, self.x, self.y)
        end
    }
end

function mk_aimy_bullet(state,x,y)
    local flash_interval = 3
    local direction = direction_from_to({x,y}, {state.p.x+3,state.p.y+3})
    sfx(7)
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
            self.x+= direction[1] * 2
            self.y+= direction[2] * 2
            self.t+=1
            if(self.t%flash_interval == 0) self.flashing = not self.flashing
        end
    }
end

function get_vector(o,t)
	return {t[1]-o[1],t[2]-o[2]}
end

function get_unit_vector(v)
	local magnitude = sqrt(v[1]*v[1] + v[2]*v[2])
	return {v[1]/magnitude, v[2]/magnitude}
end

function direction_from_to(o,t) 
    local v = get_vector(o,t)
    return get_unit_vector(v)
end