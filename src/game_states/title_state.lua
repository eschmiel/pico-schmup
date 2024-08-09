function mk_title_state()
    return {
        update=function()
            if(btnp(4)) game_state = mk_active_state()
        end,

        draw=function()
            rect(0,0,127,127,1)
            print('pov: THERE IS A BUG', 15,40,8)
            print('IN YOUR HOUSE', 30,50,8)
            print('press z to struggle', 30, 90, 7)
        end
    }
end