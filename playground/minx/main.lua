class = require "lib.30log"
tiny = require "lib.tiny"
urutora = require "lib.urutora"
local u = urutora:new()

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
function love.keypressed(k, scancode, isrepeat)
    u:keypressed(k, scancode, isrepeat)
end
function love.wheelmoved(x, y)
    u:wheelmoved(x, y)
end

-- Entities
local unit = require("src.entities.Unit")()
local button = require("src.entities.Button")(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, 100, 100)
local text = require("src.entities.Text")("Hello world!", love.graphics.getWidth() / 3, 100, 100, "center")

-- Systems
local controlSystem = require("src.systems.ControlSystem")()
local renderSystem = require("src.systems.RenderSystem")()
local clickSystem = require("src.systems.ClickSystem")()

-- World
local world = tiny.world(controlSystem, renderSystem, clickSystem, unit, button, text)

function love.load()
    local clickMe = urutora.button({
        text = 'Click me!',
        x = 10,
        y = 10,
        w = 200
    })

    local num = 0
    clickMe:action(function(e)
        num = num + 1
        e.target.text = 'You clicked me ' .. num .. ' times!'
    end)

    u:add(clickMe)
end

function love.draw()
    local dt = love.timer.getDelta()
    world:update(dt)
    u:draw(dt)
end

function love.update(dt)
    world:update(dt)
    u:update(dt)
end

