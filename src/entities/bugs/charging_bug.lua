-- move in battallions
-- march sfx with each step
-- flip sprite on each step
-- flip col box with it.
-- whistle bug. Whistles and causes the march to speed up dramatically if not destroyed before whistling
-- moves down with each step
-- need to be able to define them in clusters and update/increase their speed in unison

function mk_charge_bug(state, x,y)
    local s = 10
    local drift_threshold=45
    return {
        type=ENEMY_TYPE.CHARGING,
        x=x,
        y=y,
        step=1,
        spd=4,
        step_rate=15,
        t=1,
        d=set_init_d(),
        flip=false,
        state= CHARGE_BUG_STATE.IDLE,
        col=function(self) --collider
            return {
             self.x,
             self.y,
             self.x+7,
             self.y+6
            }
        end,
        update=function(self)
            self.t+=1
            if(self.state==CHARGE_BUG_STATE.IDLE) then
                self.x+= self.d * .3
                if(self.t%drift_threshold==0) self.d *= -1
                if(flr(state.p.x) > flr(self.x)-2 and flr(state.p.x) < flr(self.x)+2) then
                    self.state=CHARGE_BUG_STATE.PRIMED
                    self.primed_t = self.t
                    self.step_rate = 3
                end
            end
            if(self.state==CHARGE_BUG_STATE.PRIMED) then
                if(
                    flr(state.p.x) > flr(self.x)-2 
                    and flr(state.p.x) < flr(self.x)+2
                    and self.t > self.primed_t+10
                
                ) then
                    self.state=CHARGE_BUG_STATE.CHARGING
                    self.primed_t = self.t
                    self.step_rate = 1
                end
            end
            if(self.state==CHARGE_BUG_STATE.CHARGING) self.y+=self.spd
            if(self.y>128 and self.spd <= 12)self.spd+=1
            
            if(self.t%self.step_rate==0) self.flip = not self.flip
        end,
        draw=function(self)
            spr(s, self.x, self.y,1,1,self.flip)
        end
    }
end

function set_init_d()
    local n = rnd(2)
    if(n>1) then return 1
    else return -1
    end
end
CHARGE_BUG_STATE = {
    IDLE='idle',
    PRIMED='primed',
    CHARGING='charging'
}