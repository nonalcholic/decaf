
x = 0;
y = 0;

function love.load()
    -- print(a)
end

function love.draw()
    love.graphics.print(x, 300, 300)
    love.graphics.print(y, 300, 400)


    -- if num > 100 then 
    --     love.graphics.ellipse("fill", 10, 10, 50, 30);
    --     love.graphics.circle("fill", 10, 10, 100, 25);
    -- end
    love.graphics.rectangle("line", x, y, 10, 10);
end

function love.update(dt)
    if love.keyboard.isDown("up") then
        y = y - 100 * dt
    end
    if love.keyboard.isDown("down") then
        y = y + 100 * dt
    end
    if love.keyboard.isDown("left") then
        x = x - 100 * dt
    end
    if love.keyboard.isDown("right") then
        x = x + 100 * dt
    end
 end