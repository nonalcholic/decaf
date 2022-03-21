function createRect()
    rect = {}
    rect.x = 100
    rect.y = 100
    rect.width = 70
    rect.height = 90
    rect.speed = 100

    -- Put the new rectangle in the list
    table.insert(listOfRectangles, rect)
end