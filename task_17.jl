include("lib.jl")
r=Robot(animate=true)
function FindMark(r::Robot)
    f = (side::HorizonSide) -> ismarker(r)
    spiral!( f, r)
end