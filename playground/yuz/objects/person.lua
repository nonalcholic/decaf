local Person = { class = "Person" }
Person.__index = Person

-- Person.sprite = assets.img_bullet

function Person.new(x, y, name)
    local person = setmetatable({}, Person)
    person.pos = {x = x, y = y}
    person.name = name;
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
    love.graphics.print(self.name, self.pos.x + 10, self.pos.y)
end




return Person
