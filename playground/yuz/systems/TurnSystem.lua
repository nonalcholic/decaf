local TurnSystem = tiny.processingSystem()
TurnSystem.filter = tiny.requireAll("turn", "passTurn")

TurnSystem.turn = 0

function TurnSystem:init()
    print(1)
end

function TurnSystem:process(e, dt)
    if love.keyboard.isDown('space') then
        self.turn = self.turn + 1
        print('current turn : ' .. self.turn)
        e:passTurn();

    end
end


return TurnSystem
