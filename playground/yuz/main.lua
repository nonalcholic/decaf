tiny = require("lib.tiny")

drawSystem = require("systems.drawSystem")
Person = require('objects.person');


world = tiny.world(drawSystem, Person.new(10,10,'yuz'),Person.new(40,40,'minji'))

function love.load()
end

-- function love.keypressed(key)

-- end


function love.update(dt)
end

function love.draw(dt)
    world:update(dt)
end