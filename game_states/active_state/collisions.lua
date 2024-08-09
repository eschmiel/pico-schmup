-- handle collisions
function handle_col(state)
    wall_col(state)
    bullet_enemy_col(state)
    player_enemy_col(state)
end

--wall collisions
function wall_col(state)
    local p = state.p
    if(p.x<1) p.x=1
    if(p.x+8>127) p.x=119
    if(p.y<1) p.y=1
    if(p.y+8>127) p.y=119
end

--bullet enemy collisions
function bullet_enemy_col(state)
    local enemy_collidables = get_enemy_collidables(state)
    for bullet in all(state.bullets.tbl) do
        for collidable in all(enemy_collidables) do
            if(point_in_col_box(bullet.x, bullet.y, collidable:col())) then
                state.bullets:del(bullet)

                if(collidable.type == COLLIDABLE.SHIELD_BUG_SHIELD) then
                    if(collidable.hp > 0) then
                        collidable:hit()
                    else
                        collidable:get_shield_bug().shields:del(collidable)
                        state.explo_mgr:add(collidable:get_x(),collidable:get_y())
                    end
                elseif(collidable.type == COLLIDABLE.SHIELD_BUG_BODY) then
                    state.enemies:del(collidable:get_shield_bug())
                    state.explo_mgr:add(collidable:get_x(),collidable:get_y())
                else
                    state.enemies:del(collidable)
                    state.explo_mgr:add(collidable.x,collidable.y)
                end
            end
        end
    end
end

function player_enemy_col(state)
    local enemy_collidables = get_enemy_collidables(state)
    for collidable in all(enemy_collidables) do
        if(colliding(state.p:col(), collidable:col()) and state.p.alive) then
            sfx(4)
            state.explo_mgr:add(state.p.x,state.p.y)
            state.p.alive=false
        end
    end
end

function get_enemy_collidables(state)
   local collidables = {}
   
    for enemy in all(state.enemies.tbl) do
        if(enemy.type == ENEMY_TYPE.SHIELD_BUG) then
            add(collidables, enemy.body)
            for shield in all(enemy.shields.tbl) do 
                add(collidables, shield)
            end
        else
            add(collidables, enemy)
        end
    end

    return collidables
end