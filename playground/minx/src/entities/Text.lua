local Text = class("Text")

function Text:init(text, x, y, limit, align)
    -- properties
    self.text = text
    self.x = x
    self.y = y
    self.limit = limit
    self.align = align
    -- self.w = love.graphics.printf(text, x, y, limit, align).getWidth()
    -- self.h = love.graphics.printf(text, x, y, limit, align).getHeight()
    self.clicked = false

    -- components
    self.renderable = true
    self.clickable = true
end

function Text:update(dt)
    if love.mouse.isDown(1) then
        local x, y = love.mouse.getX(), love.mouse.getY()
        if x > self.x and x < self.x + self.limit then -- and y > self.y and y < self.y + e.h then
            self.clicked = true
        end
    else
        self.clicked = false
    end
    print("Text:update(dt)", "clicked", self.clicked)
end

function Text:draw(dt)
    love.graphics.printf(self.text, self.x, self.y, self.limit, self.align)
end

return Text
