function nextPoint(x, y)
    random = rand()

    if random < 0.01
        x_next = 0.0
        y_next = 0.16 * y
    elseif random < 0.86
        x_next = 0.85 * x + 0.04 * y
        y_next = -0.04 * x + 0.85 * y + 1.6
    elseif random < 0.93
        x_next = 0.2 * x - 0.26 * y
        y_next = 0.23 * x + 0.22 * y + 1.6
    else
        x_next = -0.15 * x + 0.28 * y
        y_next = 0.26 * x + 0.24 * y + 0.44
    end

    return x_next, y_next
end

function generatePoints(;config=FernConfig())
    x = config.x_start
    y = config.y_start
    x_points = Vector{Float64}(undef, config.points_per_draw)
    y_points = Vector{Float64}(undef, config.points_per_draw)

    for i in 1:config.points_per_draw
        x, y = nextPoint(x, y)
        x_points[i] = x
        y_points[i] = y
    end

    return x_points, y_points
end
