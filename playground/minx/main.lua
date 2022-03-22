class = require "lib.30log"
tiny = require "lib.tiny"

-- Entities
local unit = require("src.entities.Unit")()
local button = require("src.entities.Button")(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, 100, 100)

-- Systems
local controlSystem = require("src.systems.ControlSystem")()
local renderSystem = require("src.systems.RenderSystem")()
local clickSystem = require("src.systems.ClickSystem")()

-- World
local world = tiny.world(controlSystem, renderSystem, clickSystem, unit, button)

function love.load()
end

function love.draw()
    local dt = love.timer.getDelta()
    world:update(dt)
end

function love.update(dt)
    world:update(dt)
end

