local ActionSystem = tiny.processingSystem(class "ActionSystem")
ActionSystem.filter = tiny.requireAny("isAction", "isCommand", "isEnergy")

-- TODO: Command Queue에 들어가는 형식을 따로 만들어서, on/off 될 때마다 queue에 들어가고 더하고 빼는 동작을 둘 다 할 수 있어야 함
local minus = 0
function ActionSystem:process(e, dt)
    if e.isAction and e.isCommand and not e.value and not e.pushed then
        G_commandQ:push(e)
        e.pushed = true
        print("pushed!", e.text)
    end

    for idx = 1, #G_commandQ.queue do
        local cmd = G_commandQ:pop()
        print("cmd", cmd.energyCost)
        minus = minus + cmd.energyCost
    end

    if e.isEnergy then
        e.amount = e.amount - minus
        minus = 0
        print("Energy: ", e.amount)
    end

    if e.isEnergy then
    end
end

return ActionSystem
