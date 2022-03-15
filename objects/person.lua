Person = { name = "Person" }
Person.__index = Person

function Person.new()
    local person = setmetatable({}, Person)

    person.age = 20;
    return person
end

function Person:__tostring()
    return string.format("{age: %d}",self.age)
end