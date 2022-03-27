urutora = require "lib.urutora"

local style = { 
	fgColor = urutora.utils.toRGB('#788089'),
	bgColor = urutora.utils.toRGB('#efefef'),
	hoverbgColor = urutora.utils.toRGB('#e3e3ef'),
	hoverfgColor = urutora.utils.toRGB('#148ee3'),
	disablefgColor = urutora.utils.toRGB('#ffffff'),
	disablebgColor = urutora.utils.toRGB('#cccccc'),
	outlineColor = urutora.utils.toRGB('#aaaaaa'),
}

local UButton = urutora.toggle({
    text = 'Click me!',
    x = 10,
    y = 10,
    w = 200
})

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
