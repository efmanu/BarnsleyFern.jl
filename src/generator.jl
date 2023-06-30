"""
    next_point(x, y;config=ModelConfig())

Returns next points in the pattern

# Arguments:
- `x::Float64` : x point
- `y::Float64` : y point

# Keyword Arguments
- `config::ModelConfig` :  Configuration

# Response:
- `x_next::Float64`
- `y_next::Float64`
"""
function next_point(x, y;config=ModelConfig())
    random = rand()
    x_next, y_next = (0.0,0.0)
    if random < config.f1.prob
        x_next, y_next = config.f1.coeff * [x;y] + config.f1.constant
    elseif random < (config.f1.prob + config.f2.prob)
        x_next, y_next = config.f2.coeff * [x;y] + config.f2.constant
    elseif random < (config.f1.prob + config.f2.prob + config.f3.prob)
        x_next, y_next = config.f3.coeff * [x;y] + config.f3.constant
    else
        x_next, y_next = config.f4.coeff * [x;y] + config.f4.constant
    end

    return x_next, y_next
end

function generate_points(;config=FernConfig())
    x = config.spatial_config.x_start
    y = config.spatial_config.y_start
    x_points = Vector{Float64}(undef, config.points_per_draw)
    y_points = Vector{Float64}(undef, config.points_per_draw)

    for i in 1:config.points_per_draw
        x, y = next_point(x, y)
        x_points[i] = x
        y_points[i] = y
    end

    return x_points, y_points
end
