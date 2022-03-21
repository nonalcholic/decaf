local Unit = require "src.entities.Unit"

local UnitControlSystem = tiny.processingSystem(class "UnitControlSystem")
UnitControlSystem.filter = tiny.requireAll("controlable", "renderable")

function UnitControlSystem:process(e, dt)
    local vel = e.vel
    local l, r, u, d = love.keyboard.isDown('a'), love.keyboard.isDown('d'), love.keyboard.isDown('w'),
        love.keyboard.isDown('s')

    if l and not r then
        e.vel.x = -1
    elseif r and not l then
        e.vel.x = 1
    else
        e.vel.x = 0
    end

    if u and not d then
        e.vel.y = -1
    elseif d and not u then
        e.vel.y = 1
    else
        e.vel.y = 0
    end

    e:update(dt)
    e:draw(dt)
end

return UnitControlSystem
