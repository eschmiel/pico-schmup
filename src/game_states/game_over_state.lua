function mk_game_over_state(win)
    music(-1)
    sfx(5)
    return {
        update=function()
            if(btnp(5)) game_state = mk_title_state()
        end,

        draw=function()
            rect(0,0,127,127,1)
            if(not win) then
                spr(128, 20,20,8,8)
                print('you must spend 47 days in', 10, 90, 7)
                print('the explosion recovery ward :(',5,100,7)
            else 
                spr(136, 20,20,8,8)
                print('you get to live', 10, 90, 7)
                print('and living is winning!',5,100,7)
            end
            print('press x to restart', 30, 115, 7)
        end
    }
end