using HorizonSideRobots
r=Robot(animate=true)
function mark_kross!(r::Robot)
    for side in (Nord, West, Sud, Ost)
        putmarkers!(r, side)
        po_markeram(r, inverse(side))
    end
    putmarker!(r)
end
function putmarkers!(r::Robot, Side::HorizonSide)
    while isborder(r, Side)==false
        move!(r, Side)
        putmarker!(r)
    end
end
function po_markeram(r::Robot, Side::HorizonSide)
    while ismarker(r)
        move!(r, Side)
    end
end
inverse(side::HorizonSide)=HorizonSide(mod(Int(side)+2, 4))
