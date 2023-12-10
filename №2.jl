using HorizonSideRobots
r=Robot(animate=true)
function Perimetr(r::Robot)
    a=0
    while isborder(r, Nord)==false
        move!(r, Nord)
        a+=1
    end
    for Side in (West, Sud, Ost, Nord)
        while isborder(r, Side)==false
            putmarker!(r)
            move!(r, Side)
        end
    end
    move!(r, West)
    while ismarker(r)==false
        putmarker!(r)
        move!(r, West)
    end
    while a!=0
        move!(r, Sud)
        a-=1
    end
end