
require "some"

x = 0;
y = 0;

function love.load()
    fruits = {"apple", "banana"}
    table.insert(fruits, "pear")

    for i=1,#fruits do
        print(fruits[i])
    end

    listOfRectangles = {}

end

-- function love.draw()
--     love.graphics.print(x, 300, 300)
--     love.graphics.print(y, 300, 400)


--     -- love.graphics.ellipse("fill", 10, 10, 50, 30);
--     -- love.graphics.circle("fill", 10, 10, 100, 25);
--     love.graphics.rectangle("line", x, y, 10, 10);
-- end

-- -- 100 frames / sec
-- function love.update(dt)
--     if love.keyboard.isDown("up") then
--         y = y - 100 * dt
--     end
--     if love.keyboard.isDown("down") then
--         y = y + 100 * dt
--     end
--     if love.keyboard.isDown("left") then
--         x = x - 100 * dt
--     end
--     if love.keyboard.isDown("right") then
--         x = x + 100 * dt
--     end
--  end

function love.keypressed(key)
    -- Remember, 2 equal signs (==) for comparing!
    if key == "space" then
        createRect()
    end
end


function love.update(dt)
    for i,v in ipairs(listOfRectangles) do
        v.x = v.x + v.speed * dt
    end
end

function love.draw(dt)
    for i,v in ipairs(listOfRectangles) do
        love.graphics.rectangle("line", v.x, v.y, v.width, v.height)
    end
end