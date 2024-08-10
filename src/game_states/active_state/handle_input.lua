handle_input = function(self)
    if(not self.p.alive) return
    if(btn(0)) self.p.x-=3
    if(btn(1)) self.p.x+=3
    if(btn(2)) self.p.y-=3
    if(btn(3)) self.p.y+=3
    if(btnp(4)) then 
        sfx(3)
        self.bullets:add(
            mk_bullet(BULLET_TYPE.PLAYER,self.p.x+2,self.p.y+1)
        )
        self.bullets:add(
            mk_bullet(BULLET_TYPE.PLAYER,self.p.x+5,self.p.y+1)
        )
    end
end