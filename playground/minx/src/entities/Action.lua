require "src.utils.utils"
urutora = require "lib.urutora"

local Action = urutora.toggle({
    value = true
})

-- onClick
Action:action(function(e)
    e.target.calculated = false
    -- e.target.clicked = not e.target.clicked
    -- print(
    --     "e.target.text" .. e.target.text .. "e.target.clicked" .. tostring(e.target.clicked) .. "e.target.myclicked" ..
    --         tostring(e.target.myclicked))
end)

-- ECS
Action.isAction = true
Action.isCommand = true
Action.pushed = false

function Action:create(o)
    return G_FuncNew(Action):new(o)
end

-- style
Action:setStyle(G_urutoraStyle)

return Action
