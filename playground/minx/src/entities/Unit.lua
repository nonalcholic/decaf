local Unit = class("Unit")

function Unit:init()
    self.speed = 100;
    self.pos = {
        x = 0,
        y = 0
    }
    self.vel = {
        x = 0,
        y = 0
    }
    self.controlable = true
    self.renderable = true
end

function Unit:update(dt)
    self.pos.x = self.pos.x + self.vel.x * self.speed * dt
    self.pos.y = self.pos.y + self.vel.y * self.speed * dt
end

function Unit:draw(dt)
    love.graphics.rectangle("line", self.pos.x, self.pos.y, 10, 10)
end

return Unit
