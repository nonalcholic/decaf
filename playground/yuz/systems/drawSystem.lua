local DrawSystem = tiny.processingSystem()
DrawSystem.filter = tiny.requireAll("draw")

-- function DrawSystem:init()
-- 	self.r, self.g, self.b = r, g, b
-- end


function DrawSystem:process(e, dt)
    e:draw()
end


return DrawSystem
