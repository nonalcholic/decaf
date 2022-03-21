require "objects/person"
require "objects/student"

function love.load()
    list = {}
    table.insert(list, Student.new(1))
    table.insert(list, Student.new(3))
    table.insert(list, Person.new())

    for i=1,#list do
        print(list[i])
    end
end
