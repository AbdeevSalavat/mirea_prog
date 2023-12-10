using HorizonSideRobots
include(№2.jl)
r=Robot(animate=true)
function Fill(r::Robot)
    a=0 
    b=0
    while isborder(r, Nord)==false
        move!(r, Nord)
        a+=1
    end
    while isborder(r, West)==false
        move!(r, West)
        b+=1
    end
    while isborder(r, Ost)==false
        while isborder(r, Sud)==false
            MarkMove(r, Sud)
        end
        putmarker!(r)
        if isborder(r, Ost)==false
             move!(r, Ost)
            while isborder(r, Nord)==false
                MarkMove(r, Nord)
            end
        end 
        putmarker!(r)    
        if isborder(r, Ost)==false
            move!(r, Ost)
        end
    end
    while isborder(r, Nord)==false
        move!(r, Nord)
    end
    while isborder(r, West)==false
        move!(r, West)
    end
    while a!=0
        move!(r, Sud)
        a-=1
    end
    while b!=0
        move!(r, Ost)
        b-=1
    end
end
