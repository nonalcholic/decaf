tiny = require("lib.tiny")

drawSystem = require("systems.drawSystem")
Person = require('objects.person');
Student = require('objects.student');


world = tiny.world(drawSystem, 
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
    time = time + dt
    -- print(time)
end

function love.draw(dt)
    world:update(dt)
end