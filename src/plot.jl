function plot_fern(;config=FernConfig())
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

        # TODO : Replace uncomment and refactor this once the issue https://github.com/JuliaPlots/Plots.jl/issues/3664 gets fixed in Mac M2

        cpu_info = Sys.cpu_info()
        
        if (Sys.KERNEL == :Darwin) && (cpu_info[1].model == "Apple M2")

            @gif for i = 1:config.points_per_draw
                x, y = next_point(x, y)
                push!(plt, x, y)
            end every config.plot_config.fps
            
        else
            animation = @animate for i = 1:config.points_per_draw
                x, y = next_point(x, y)
                push!(plt, x, y)
            end every config.plot_config.fps

            gif(animation, config.plot_config.file_name, fps=config.plot_config.fps)
        end
        
    else
        x_points_new, y_points_new = generate_points(;config=config)
        append!(x_points, x_points_new)
        append!(y_points, y_points_new)
        plot!(x_points_new, y_points_new, seriestype = :scatter, markersize = 0.5)
    end
end