function mk_bullet(x,y)
    return {
        x=x,
        y=y,
        draw=function(self)
            local x = self.x
            local y = self.y
            line(x,y,x,y-2,8)
        end,
        update=function(self)
            self.y-=2
        end
    }
end