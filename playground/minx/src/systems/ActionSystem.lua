local ActionSystem = tiny.processingSystem(class "ActionSystem")
ActionSystem.filter = tiny.requireAny("isAction", "isEnergy")

function ActionSystem:process(e, dt)
    if e.isAction then
        print("e.energyCost", e.energyCost)
    end
    if e.isEnergy then
        print("Energy:" .. " " .. e.amount)
    end
end

return ActionSystem
