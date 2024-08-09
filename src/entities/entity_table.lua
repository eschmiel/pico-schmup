--make entities table
function mk_ent_tbl(init_tbl)
    tbl = {}
    for item in all(init_tbl or {}) do
        add(tbl, item)
    end
    
    ent_tbl = {
        tbl=tbl,
        update=function(self)
            for item in all(self.tbl) do
                item:update()
            end
        end,
        draw=function(self)
            for item in all(self.tbl) do
                item:draw()
            end
        end,
    }
    
    ent_tbl['add']=function(self, item)
        add(self.tbl, item)
    end

    ent_tbl['del']=function(self, item)
        del(self.tbl, item)
    end
    
    return ent_tbl
end