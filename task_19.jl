include("lib.jl")
r=Robot(animate=true)
function along_recursive(robot::Robot, side::HorizonSide, n_steps::Int = 0)
    if !isborder(r, side)
        move!(r, side)
        n_steps += 1
        along_recursive(r, side, n_steps)
    end
end