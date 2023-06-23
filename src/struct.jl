mutable struct FernConfig
    points_per_draw::Int
    x_min::Float64
    x_max::Float64
    y_min::Float64
    y_max::Float64
    x_start::Float64
    y_start::Float64
end

function FernConfig(;points_per_draw=10000, x_min=-2.182, x_max=2.6558, y_min=0, y_max= 9.9983, x_start=0.0, y_start=0.0)
    return FernConfig(
        points_per_draw,
        x_min,
        x_max,
        y_min,
        y_max,
        x_start,
        y_start
    )
end