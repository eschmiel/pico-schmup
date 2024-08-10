function mk_bullet(type,x,y)
    local c = 8
    local d = 1
    if(type != BULLET_TYPE.PLAYER) then
        c=12
        d *= -1
    end
    return {
        x=x,
        y=y,
        draw=function(self)
            local x = self.x
            local y = self.y
            line(x,y,x,y-2,c)
        end,
        update=function(self)
            self.y-= (2*d)
        end
    }
end