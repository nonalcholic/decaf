tiny = require("lib.tiny")
drawSystem = require("drawSystem")

Person = require('Person');


world = tiny.world(drawSystem, Person.new(10,10,'yuz'),Person.new(40,40,'minji'))

function love.load()
end

-- function love.keypressed(key)

-- end


function love.update(dt)
    world:update(dt)
end

function love.draw(dt)
    world:update(dt)
end