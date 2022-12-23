// Name: Roundabout Rosy (Rangifer vertiginem)
print "Wheeee!"

speed = 20
tick = 0
rotation = 4
while deerCount > 1
    if rnd * 100 > 1 then
        speed = 10 + rnd(15)
    end if
    tick = tick + 1
    heading = heading + rotation - 1
    lastTick = floor((tick - 1) / 120)
    if lastTick != floor(tick / 120) then
        rotation = sign(rotation) * -4
    end if
    
    target = look
    if target then
        if target.speed < 20 and target.distance <= 50 then
            if deerCount == 2 then
                if target.health <= energy then 
                    throw target.health
                else
                    throw energy - 6
                end if
            else
                if target.health <= energy - 6 then
                    throw target.health
                else
                    throw energy - 6
                end if
            end if
        end if    
    end if
    yield
end while