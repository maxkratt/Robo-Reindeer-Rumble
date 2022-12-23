// Name: Snakey Simon (Rangifer serpens)
print "Hiss"

speed = 70
ticks = 0
rotation = 4
boxEdge = 45
targetX = boxEdge
targetY = boxEdge
startingCorner = {"x":boxEdge, "y":boxEdge}
foundCorner = false
doneWithField = false

angleBetween = function(aX, aY, bX, bY)
    return atan(bY - aY, bX - aX)
end function

radToDeg = function(radians)
    return radians * 180 / pi
end function

facePosition = function(x, y)
    angle = radToDeg(angleBetween(position.x, position.y, x, y))
    globals.heading = angle
end function

goToCorner = function()
    if position.x < 0 then globals.targetX = -boxEdge
    if position.y < 0 then globals.targetY = -boxEdge
    startingCorner.x = targetX
    startingCorner.y = targetY
    facePosition targetX, targetY
end function

goToCorner

while deerCount > 1
    if abs(position.x - targetX) < 2 and abs(position.y - targetY) < 2 then
        if doneWithField then
            print "Hiss hissshss!"
            if position.x < 0 and position.y < 0 then 
                targetY = 50
            else if position.x < 0 and position.y > 0 then 
                targetX = 50
            else if position.x > 0 and position.y > 0 then 
                targetY = -50
            else if position.x > 0 and position.y < 0 then 
                targetX = -50
            end if
        else 
            if foundCorner then
                if abs(position.x - startingCorner.x * -1) < 5 and abs(position.y - startingCorner.y * -1) < 5 then
                    doneWithField = true;
                    speed = 33
                    yield
                    continue
                end if
                if startingCorner.x < 0 then 
                    targetX = targetX + 5
                else
                    targetX = targetX - 5
                end if
            end if
            if targetY < 0 then 
                targetY = boxEdge
            else
                targetY = -boxEdge
            end if
            speed = 14
            foundCorner = true
        end if
    end if
    facePosition targetX, targetY

    if not doneWithField and foundCorner and energy > 10 and ticks % 40 == 0 then 
        if boxEdge - abs(position.x) > 1 and boxEdge - abs(position.y) > 1 then drop 1, 1
    end if

    ticks = ticks + 1
    yield
end while