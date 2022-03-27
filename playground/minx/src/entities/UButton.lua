urutora = require "lib.urutora"

local style = {
    fgColor = urutora.utils.toRGB('#788089'),
    bgColor = urutora.utils.toRGB('#efefef'),
    hoverbgColor = urutora.utils.toRGB('#e3e3ef'),
    hoverfgColor = urutora.utils.toRGB('#148ee3'),
    disablefgColor = urutora.utils.toRGB('#ffffff'),
    disablebgColor = urutora.utils.toRGB('#cccccc'),
    outlineColor = urutora.utils.toRGB('#aaaaaa')
}

local UButton = urutora.toggle({
    text = 'Click me!'
})

function FuncNew(obj) -- for Inheritance 
    function obj:new(o)
        o = o or {}
        setmetatable(o, self)
        self.__index = self
        return o
    end
    return obj
end

function UButton:create()
    return FuncNew(UButton):new()
end

-- ECS
UButton.isAction = true
UButton.num = 0
UButton.clicked = false

-- style
UButton:setStyle(style)

-- onClick
UButton:action(function(e)
    -- UButton.clicked = not UButton.clicked
    UButton.clicked = e.target.value
    e.target.text = tostring(UButton.clicked)
end)

return UButton
