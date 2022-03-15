
Student = { name = "Student" }
Student.__index = Student
setmetatable(Student, Person)

function Student.new(id)
    local student = setmetatable(Person.new(), Student)

    student.id = id
    return student
end

function Student:__tostring()
    return string.format("{age: %d, id: %d}",self.age, self.id)
end