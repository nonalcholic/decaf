local Student = { class = "Student" }
Student.__index = Student
setmetatable(Student, Person)

-- Person.sprite = assets.img_bullet

function Student.new(x, y, name, grade)
    local student = setmetatable(Person.new(x,y,name), Student)

    student.grade = grade
    student.isStudent = true

    return student
end


function Student:draw()
    love.graphics.circle("fill", self.pos.x, self.pos.y, 10 )
    love.graphics.print('student ' .. self.name .. self.grade, self.pos.x + 10, self.pos.y)
end

return Student
