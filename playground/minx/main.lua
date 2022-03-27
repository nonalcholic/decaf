class = require "lib.30log"
tiny = require "lib.tiny"

local urutora = require('lib.urutora')
local u

-- Entities
local ubutton = require("src.entities.UButton")
-- u:add(ubutton)

-- Systems
local actionSystem = require("src.systems.ActionSystem")()

-- World
local world = tiny.world(actionSystem, ubutton)

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
local panelA

function love.load()
    local w, h = love.window.getMode()
    w = w / 2
    h = h / 2

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
    local font1 = love.graphics.newFont('fonts/proggy/proggy-tiny.ttf', 16)
    local font2 = love.graphics.newFont('fonts/proggy/proggy-square-rr.ttf', 16)

    u.setDefaultFont(font1)
    u.setResolution(canvas:getWidth(), canvas:getHeight())

    panelA = u.panel({
        rows = 2,
        cols = 2,
        x = 10,
        y = 20,
        w = w / 2,
        h = h / 2,
        tag = 'PanelA'
    })
    -- panelA.outline = true
    panelA:addAt(1, 1, u.label({
        text = 'A panel'
    })):addAt(1, 2, u.toggle({
        text = "(1, 2)"
    }):action(function(e)
        print("(1, 2)" .. tostring(e.target.value))
    end)):addAt(2, 1, u.toggle({
        text = "(2, 1)"
    }):action(function(e)
        print("(2, 1)" .. tostring(e.target.value))
    end)):addAt(2, 2, u.toggle({
        text = "(2, 2)"
    }):action(function(e)
        print("(2, 2)" .. tostring(e.target.value))
    end))
    u:add(panelA)
    panelA:setStyle(style)
    -- activation and deactivation elements by tag
    -- u:deactivateByTag('PanelD')
end

local x = 0
local y = 0

function love.update(dt)
    -- ECS: Update
    world:update(dt)

    -- Urutora
    u:update(dt)

    -- panelA:moveTo(x, y)
    -- x = x + 0.1
    -- y = y + 0.1
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
