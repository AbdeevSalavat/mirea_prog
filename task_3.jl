using HorizonSideRobots

r=Robot(animate=true)


function Fill!(r::Robot)
    side = West
    num_vert , num_hor = go_Sud_West!(r)
    putmarker!(r)
    horiznt=0
    vert=0

    while (isborder(r,Nord)==false)
        side=inverse(side)
        
        horiznt=sneak_move(r,side)
        vert+=1
    end

    last_road!(r,side)
    vert=vert-num_vert
    horiznt=horiznt-num_hor
    go_home!(r,vert,horiznt)

end

function go_Sud_West!(r::Robot)
    num_vert = moves!(r, Sud)
    num_hor = moves!(r, West)
    return num_vert, num_hor
end

function putmarkers!(r::Robot,side::HorizonSide) 
        num_steps=0 
        while isborder(r,side)==false 
            move!(r,side)
            putmarker!(r)
            num_steps+=1
        end
        return num_steps
    end

function moves!(r::Robot, side::HorizonSide)
        num_steps=0
        while isborder(r,side)==false
            move!(r,side)
            num_steps+=1
        end
        return num_steps
    end


function moves!(r::Robot,side::HorizonSide, num_steps::Int)
        for _ in 1:num_steps 
            move!(r,side)
        end
    end


function sneak_move(r::Robot,side::HorizonSide)
    
    long=putmarkers!(r,side)
    move!(r,Nord)
    putmarker!(r)
    return long
end


function last_road!(r::Robot,side::HorizonSide)
    side=inverse(side)

    while isborder(r,side)==false
        putmarkers!(r,side)
    end
        
end

function go_home!(r::Robot,vert::Int, horiznt)
    moves!(r,Sud,vert)
    moves!(r,West,horiznt)
end

inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2, 4)) 