include("lib.jl")
r=Robot(animate=true)
function FindM(r::Robot)
    f = (side::HorizonSide) -> !isborder(r, Nord)
    shuttle!(f, r, Nord)
end