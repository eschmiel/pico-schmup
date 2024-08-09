--make explosion
function mk_explo(x,y)
    sfx(4)
    return {
        x=x,
        y=y,
        t=0,
        s=3,
        update=function(self)
            self.t += 1
        end,
        draw=function(self)
            spr(self.s,x,y)
        end
    }
end

--make explosion manager
function mk_explo_mgr()
    return {
        ent_tbl = mk_ent_tbl(),
        add=function(self, x, y)
            self.ent_tbl:add(mk_explo(x,y))
        end,
        update=function(self)
            ent_tbl:update()
            for explo in all(ent_tbl.tbl) do
                if(explo.t > 5) ent_tbl:del(explo)
            end
        end,
        draw=function(self)
            ent_tbl:draw()
        end,
        isExploding = function(self)
            return #self.ent_tbl.tbl > 0
        end
    }
end