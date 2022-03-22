local RenderSystem = tiny.processingSystem(class "RenderSystem")

RenderSystem.filter = tiny.requireAll("renderable")

function RenderSystem:process(e, dt)
    e:draw(dt)
end

return RenderSystem
