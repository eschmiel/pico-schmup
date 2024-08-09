function mk_player(x,y)
    return { 
        x=x,
        y=y, 
        s=1,--sprite id
        alive=true,
        col=function(self) --collider
           return {
            self.x,
            self.y,
            self.x+7,
            self.y+7
           } 
        end,
        draw = function(self) 
            if(self.alive) then
                spr(self.s, self.x, self.y)
            end
        end,
        update = function(self)
            
        end
    }
end