class = require "lib.30log"
tiny = require "lib.tiny"

local unitControlSystem = require("src.systems.UnitControlSystem")()
local unit = require("src.entities.Unit")()

local world = tiny.world(unitControlSystem, unit)

function love.load()
end

function love.draw()
    local dt = love.timer.getDelta()
    world:update(dt)
end

function love.update(dt)
    world:update(dt)
end

