require "src.utils.utils"
urutora = require "lib.urutora"

local Energy = urutora.label({
    text = 'Energy!'
})

function Energy:create()
    return G_FuncNew(Energy):new()
end

-- ECS
Energy.isEnergy = true
Energy.amount = 10
Energy.imsi = 10

-- style
Energy:setStyle(G_urutoraStyle)

return Energy
