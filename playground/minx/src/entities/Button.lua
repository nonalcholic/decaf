local Button = class("Button")

function Button:init(x, y, w, h)
    -- properties
    self.x = x
    self.y = y
    self.w = w
    self.h = h
    self.clicked = false

    -- components
    self.renderable = true
    self.clickable = true
end

function Button:update(dt)
    if love.mouse.isDown(1) then
        local x, y = love.mouse.getX(), love.mouse.getY()
        if x > self.x and x < self.x + self.w and y > self.y and y < self.y + self.h then
            self.clicked = true
        end
    else
        self.clicked = false
    end
    print("Button:update(dt)", "clicked", self.clicked)
end

function Button:draw(dt)
    love.graphics.rectangle("line", self.x, self.y, self.w, self.h)
end

return Button
