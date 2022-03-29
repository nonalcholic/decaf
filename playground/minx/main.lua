class = require "lib.30log"
tiny = require "lib.tiny"
urutora = require('lib.urutora')

local u

-- Entities
local action1 = require("src.entities.Action"):create({
    text = "A (-2)",
    energyCost = -2
})
local action2 = require("src.entities.Action"):create({
    text = "B (-1)",
    energyCost = -1
})
local action3 = require("src.entities.Action"):create({
    text = "C (-3)",
    energyCost = -3
})

local energy = require("src.entities.Energy"):create()

-- Systems
local actionSystem = require("src.systems.ActionSystem")()

-- World
local world = tiny.world(actionSystem, action1, action2, action3, energy)

local style = {
    fgColor = urutora.utils.toRGB('#788089'),
    bgColor = urutora.utils.toRGB('#efefef'),
    hoverbgColor = urutora.utils.toRGB('#e3e3ef'),
    hoverfgColor = urutora.utils.toRGB('#148ee3'),
    disablefgColor = urutora.utils.toRGB('#ffffff'),
    disablebgColor = urutora.utils.toRGB('#cccccc'),
    outlineColor = urutora.utils.toRGB('#aaaaaa')
}

local bgColor = {0.98, 0.98, 0.98}
local canvas
local panel

local function init_urutora()
    local w, h = love.window.getMode()
    -- w = w / 2
    -- h = h / 2

    u = urutora:new()

    function love.mousepressed(x, y, button)
        u:pressed(x, y)
    end
    function love.mousemoved(x, y, dx, dy)
        u:moved(x, y, dx, dy)
    end
    function love.mousereleased(x, y, button)
        u:released(x, y)
    end
    function love.textinput(text)
        u:textinput(text)
    end
    function love.wheelmoved(x, y)
        u:wheelmoved(x, y)
    end

    function love.keypressed(k, scancode, isrepeat)
        u:keypressed(k, scancode, isrepeat)

        if k == 'escape' then
            love.event.quit()
        end
    end

    canvas = love.graphics.newCanvas(w, h)
    canvas:setFilter('nearest', 'nearest')
    local font = love.graphics.newFont('fonts/neodgm.ttf', 16)

    u.setDefaultFont(font)
    u.setResolution(canvas:getWidth(), canvas:getHeight())

    panel = u.panel({
        rows = 2,
        cols = 2,
        x = 10,
        y = 20,
        w = w / 4,
        h = h / 4,
        tag = 'PanelA'
    })
    -- panelA.outline = true
    panel:addAt(1, 1, u.label({
        text = 'Choose...'
    })):addAt(1, 2, action1):addAt(2, 1, action2):addAt(2, 2, action3)
    u:add(panel)
    panel:setStyle(style)
    -- activation and deactivation elements by tag
end

function love.load()
    init_urutora()
end

function love.update(dt)
    -- ECS: Update
    world:update(dt)

    -- Urutora
    u:update(dt)
end

function love.draw()
    local dt = love.timer.getDelta()

    -- ECS: Update
    world:update(dt)

    -- urutora
    love.graphics.setCanvas(canvas)
    love.graphics.clear(bgColor)
    u:draw()
    love.graphics.setCanvas()

    love.graphics.draw(canvas, 0, 0, 0, love.graphics.getWidth() / canvas:getWidth(),
        love.graphics.getHeight() / canvas:getHeight())
end
