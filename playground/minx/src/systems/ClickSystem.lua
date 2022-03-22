local ClickSystem = tiny.processingSystem(class "ClickSystem")

ClickSystem.filter = tiny.requireAll("clickable")

function ClickSystem:process(e, dt)
    e:update(dt)
end

return ClickSystem
