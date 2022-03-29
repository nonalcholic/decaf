local Person = { class = "Person" }
Person.__index = Person

function Person.new(x, y, name)
    local person = setmetatable({}, Person)
    
    person.pos = {x = x, y = y}
    person.name = name
    person.turn = 0
    person.isPerson = true

    return person
end

function Person:update(dt)
    print(self.id .. ": hello ")
end

function Person:remove()
    print(self.id .. ": im dead ")
    world:remove(self)
end

function Person:draw()
    love.graphics.circle("fill", self.pos.x, self.pos.y, 10 )
    love.graphics.print(self.name .. self.turn, self.pos.x + 10, self.pos.y)
end

function Person:passTurn()
    self.turn = self.turn + 1
end






return Person
