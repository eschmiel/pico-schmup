function mk_shield_bug(x,y)
    local shield_bug = {
        type=ENEMY_TYPE.SHIELD_BUG,
        x=x,
        y=y,
        shields = mk_ent_tbl(),
        update=function(self)
            self.shields:update()
        end,
        draw=function(self)
            self.body:draw()
            self.shields:draw()
        end
    }
    shield_bug.body = mk_shield_bug_body(shield_bug)
    shield_bug.shields:add(mk_shield_bug_shield(shield_bug, -4, 8))
    shield_bug.shields:add(mk_shield_bug_shield(shield_bug, 4, 8))

    return shield_bug
end

function mk_shield_bug_body(shield_bug)
    return {
        type=COLLIDABLE.SHIELD_BUG_BODY,
        get_shield_bug = function(self)
            return shield_bug
        end,
        get_x=function(self)
            return shield_bug.x
        end,
        get_y=function(self)
            return shield_bug.y
        end,
        col=function(self) --collider
            local x = shield_bug.x
            local y = shield_bug.y
            return {
             x,
             y,
             x+7,
             y+7
            }
        end,
        update=function(self)
            -- self.x += self.spd * self.d
            -- if(self.x>120 or self.x<10) then
            --     self.d *= -1
            --     self.spd += 1
            --     self.y += 10
            --     sfx(0)
            -- end
        end,
        draw=function(self)
            spr(6, shield_bug.x, shield_bug.y)
        end
    }
end

function mk_shield_bug_shield(shield_bug, offset_x, offset_y)
    return {
        type=COLLIDABLE.SHIELD_BUG_SHIELD,
        hp=15,
        hit_timer = 0,
        dmg_flash = false,
        get_shield_bug=function(self)
            return shield_bug
        end,
        get_x=function()
            return shield_bug.x + offset_x
        end,
        get_y=function()
           return shield_bug.y + offset_y
        end,
        col=function(self)
            local x = self:get_x()
            local y = self:get_y()
            return {
                x,
                y,
                x+8,
                y+4
               }
        end,
        hit=function(self)
            if(self.hit_timer < 1) self.dmg_flash = true
            self.hit_timer += 10
            self.hp -= 1

        end,
        update=function(self)
            if(self.hit_timer > 0) then
                self.hit_timer -= 1
                if(self.hit_timer%5 == 0) then
                    self.dmg_flash = not self.dmg_flash
                end
            else
                self.hit_timer = 0
                self.dmg_flash = false
            end

        end,
        draw=function(self)
            if(self.dmg_flash) then 
                spr(5, self:get_x(), self:get_y())
            else
                spr(4, self:get_x(), self:get_y())
            end
        end
    }
end