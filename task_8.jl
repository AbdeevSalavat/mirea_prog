using HorizonSideRobots

r=Robot(animate=true)

include("lib.jl")

function findmark(r::Robot)
    n_steps = 1
    cur_side = Ost
    counter = 1
    while true

        if moves_if_not_marker!(r, cur_side, n_steps)
            return
        end 

        cur_side = next_side(cur_side)

        if counter % 2 == 0
            n_steps += 1
        end

        counter += 1
    end
end
