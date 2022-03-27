class = require "lib.30log"
tiny = require "lib.tiny"
urutora = require "lib.urutora"
local u = urutora:new()

-- Urutora: Pass love's events to urutora
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
local ubutton = require("src.entities.UButton")
u:add(ubutton)

-- Systems
local controlSystem = require("src.systems.ControlSystem")()
local renderSystem = require("src.systems.RenderSystem")()
local clickSystem = require("src.systems.ClickSystem")()
local actionSystem = require("src.systems.ActionSystem")()

-- World
local world = tiny.world(controlSystem, renderSystem, clickSystem, actionSystem, unit, button, text, ubutton)

function love.load()
end

function love.draw()
    local dt = love.timer.getDelta()

    -- ECS: Update
    world:update(dt)

    -- Urutora
    u:draw(dt)
end

function love.update(dt)
    -- ECS: Update
    world:update(dt)

    -- Urutora
    u:update(dt)
end

