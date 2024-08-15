-- move in battallions
-- march sfx with each step
-- flip sprite on each step
-- flip col box with it.
-- whistle bug. Whistles and causes the march to speed up dramatically if not destroyed before whistling
-- moves down with each step
-- need to be able to define them in clusters and update/increase their speed in unison

function mk_march_bug(x,y)
    local s = 8
    local step_rate = 15
    return {
        type=ENEMY_TYPE.MARCHING,
        x=x,
        y=y,
        step=1,
        flip=false,
        col=function(self) --collider
            return {
             self.x,
             self.y,
             self.x+7,
             self.y+6
            }
        end,
        update=function(self)
            self.step+=1
            if(self.step%step_rate==0) self.flip = not self.flip
        end,
        draw=function(self)
            spr(s, self.x, self.y,1,1,self.flip)
        end
    }
end
