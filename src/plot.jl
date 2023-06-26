function plotFern(;config=FernConfig())
    gr()
    x_points, y_points = ([config.spatial_config.x_start], [config.spatial_config.y_start])

    plt = plot(x_points, y_points, seriestype = :scatter, markersize = 0.5, aspect_ratio = :equal, legend = false)
    xlims!((config.spatial_config.x_min, config.spatial_config.x_max))
    ylims!((config.spatial_config.y_min, config.spatial_config.y_max))
    xlabel!("X")
    ylabel!("Y")
    title!("Barnsley Fern")

    if config.plot_config.animated

        x = config.spatial_config.x_start
        y = config.spatial_config.y_start

        animation = @animate for i = 1:config.points_per_draw
            x, y = nextPoint(x, y)
            push!(plt, x, y)
        end 
        
        gif(animation, config.plot_config.file_name, fps=15)
    else
        x_points_new, y_points_new = generatePoints(;config=config)
        append!(x_points, x_points_new)
        append!(y_points, y_points_new)
        plot!(x_points_new, y_points_new, seriestype = :scatter, markersize = 0.5)
    end
end