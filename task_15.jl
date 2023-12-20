include("lib.jl")
r=Robot(animate=true)
function along_border!(robot::Robot, side::HorizonSide, steps::NTuple{2, Int})
    while !isborder(r, side)
        if steps[1] == 0 || steps[2] == 0
            putmarker!(r)
        end
        move!(r, side)
        steps = change_coord(steps, side)
    end
    return steps
end

function XcrossM(robot::Robot)
    path = left_corner_extended!(robot)
    go_steps!(robot, inversed_path(path))
    coord = left_corner!(robot)
    side = Nord
    coord = (-coord[2], -coord[1])

    coord = along_border!(robot, side, coord)
    side = Ost
    coord = along_border!(robot, side, coord)
    side = Sud
    coord = along_border!(robot, side, coord)
    side = West
    coord = along_border!(robot, side, coord)

    left_corner_extended!(robot)
    go_steps!(robot, inversed_path(path))
end