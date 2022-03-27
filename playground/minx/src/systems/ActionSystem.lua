local ActionSystem = tiny.processingSystem(class "ActionSystem")
ActionSystem.filter = tiny.requireAll("isAction")

function ActionSystem:process(e, dt)
    -- print(e.text)
end

return ActionSystem
