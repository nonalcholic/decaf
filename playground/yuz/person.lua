Person = { class = "Person" }
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




return Person
