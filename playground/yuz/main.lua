tiny = require("lib.tiny")

DrawSystem = require("systems.DrawSystem")
TurnSystem = require("systems.TurnSystem")

Person = require('objects.Person');
Student = require('objects.Student');


world = tiny.world(
    DrawSystem,
    TurnSystem,
    Person.new(10,10,'yuz'),
    Person.new(40,40,'minji'),
    Student.new(300,10,'xion',3),
    Student.new(200,40,'sayheon', 2)
)

function love.load()

end

function love.keypressed(key)

end

time = 0

function love.update(dt)
    -- time = time + dt
    -- if time > 10 then
    --     world.ge
    -- end
end

function love.draw(dt)
    world:update(dt)
end