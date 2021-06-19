-- require('__debugadapter__/debugadapter.lua')

local handler = require("event_handler")
handler.add_lib(require("freeplay"))
handler.add_lib(require("silo-script"))

game_over = function ()
    game.print('Game Over, you failed. Server restarting') 
    local interval = 50
    local lastTick = game.tick
    local count = 10
    script.on_event(defines.events.on_tick, function(event)
        if game.tick >= lastTick then
            lastTick = game.tick + interval
            game.print(count)
            count = count - 1
        end
        if count < 1 then
            script.on_event(defines.events.on_tick, nil) 
        end
    end)
    log('GAMEOVER')
end

script.on_event(defines.events.on_player_died, function(event)
    local player = game.players[event.player_index]
    game.print(player.name .. ' is dead now') 
    game_over()
end)