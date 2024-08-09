function mk_bug(x,y)
    return {
        type=ENEMY_TYPE.ZIPPER,
        x=x,
        y=y,
        s=2, --sprite
        d=1, --direction
        spd=1, --speed
        col=function(self) --collider
            return {
             self.x,
             self.y,
             self.x+7,
             self.y+7
            }
        end,
        update=function(self)
            self.x += self.spd * self.d
            if(self.x>120 or self.x<10) then
                self.d *= -1
                self.spd += 1
                self.y += 10
                sfx(0)
            end
        end,
        draw=function(self)
            spr(self.s, self.x, self.y)
        end
    }
end