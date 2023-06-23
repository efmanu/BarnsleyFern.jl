function plotFern(;config=FernConfig())
    x_points, y_points = generatePoints(;config=config)

    plot(x_points, y_points, seriestype = :scatter, markersize = 0.5, aspect_ratio = :equal, legend = false)
    xlims!((config.x_min, config.x_max))
    ylims!((config.y_min, config.y_max))
    xlabel!("X")
    ylabel!("Y")
    title!("Barnsley Fern")
end