local CommandQ = class("CommandQ")

function CommandQ:init()
    CommandQ.queue = {}
end

-- First In First Out
function CommandQ:push(cmd)
    table.insert(self.queue, cmd)
end

-- First In First Out
function CommandQ:pop()
    return table.remove(self.queue, 1)
end

function CommandQ:update(dt)
end

function CommandQ:draw(dt)
end

return CommandQ
