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
    for bullet in all(state.bullets.tbl) do
        for enemy in all(state.enemies.tbl) do
            if(point_in_col_box(bullet.x, bullet.y, enemy:col())) then
                state.enemies:del(enemy)
                state.bullets:del(bullet)
                state.explo_mgr:add(enemy.x,enemy.y)
            end
        end
    end
end

function player_enemy_col(state)
    for enemy in all(state.enemies.tbl) do
        if(colliding(state.p:col(), enemy:col()) and state.p.alive) then
            sfx(4)
            state.explo_mgr:add(state.p.x,state.p.y)
            state.p.alive=false
        end
    end
end