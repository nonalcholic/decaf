local DrawSystem = tiny.processingSystem()
DrawSystem.filter = tiny.requireAll( "name","pos")

-- function DrawSystem:init()
-- 	self.r, self.g, self.b = r, g, b
-- end

-- function DrawSystem:update(dt)
-- 	-- local r1, g1, b1, a = love.graphics.getColor()
-- 	-- love.graphics.setColor(self.r, self.g, self.b, 1)
-- 	-- love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
-- 	-- love.graphics.setColor(r1, g1, b1, a)
-- 	love.graphics.rectangle("fill", , 0, love.graphics.getWidth(), love.graphics.getHeight())
-- end


function DrawSystem:process(e, dt)
    love.graphics.circle("fill", e.pos.x, e.pos.y, 10 )
    love.graphics.print(e.name, e.pos.x + 10, e.pos.y)
end


return DrawSystem
