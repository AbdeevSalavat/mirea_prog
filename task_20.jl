include("lib.jl")
r=Robot(animate=true)
function recursive_mark(r::Robot, side::HorizonSide, steps=0)
    if !isborder(r, side)
        move!(r, side)
        steps += 1
        recursive_mark(r, side, steps)
    else
        putmarker!(r)
        along!(r, inverse(side), steps)
    end
end