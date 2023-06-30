function plot_fern(;config=FernConfig())
    if config.plot_config isa ImagePlot
        plot_image_fern(;config=config)
    else
        plot_scatter_fern(;config=config)
    end
end

function plot_image_fern(;config=FernConfig())
    color = RGB(0.0, 1.0, 0.0)
    bgcolor = RGB(0.0, 0.0, 0.0)
    x_points_new, y_points_new = generate_points(;config=config)
    pixel_loc =  get_pixel_location.(x_points_new, y_points_new, Ref(config))
    f = colorview(RGB, fill(config.plot_config.bgcolor, config.plot_config.nx, config.plot_config.ny))
    [f[y,x] = config.plot_config.color for (x,y) in pixel_loc]
    imshow(f)
end

function get_pixel_location(x, y, config)
    # Calculate the width and height of the rectangle
    width = config.spatial_config.x_max - config.spatial_config.x_min
    height = config.spatial_config.y_max - config.spatial_config.y_min

    # Calculate the pixel size in the x and y directions
    pixel_size_x = width / (config.plot_config.nx - 1)
    pixel_size_y = height / (config.plot_config.ny - 1)

    # Calculate the pixel location corresponding to (x, y)
    pixel_x = floor(Int, (x - config.spatial_config.x_min) / pixel_size_x) + 1
    pixel_y = floor(Int, (config.spatial_config.y_max - y) / pixel_size_y) + 1

    return pixel_x, pixel_y
end

function plot_scatter_fern(;config=FernConfig())
    gr()
    x_points, y_points = ([config.spatial_config.x_start], [config.spatial_config.y_start])

    plt = plot(x_points, y_points, seriestype = :scatter, markersize = 0.5, aspect_ratio = :equal, legend = false)
    xlims!((config.spatial_config.x_min, config.spatial_config.x_max))
    ylims!((config.spatial_config.y_min, config.spatial_config.y_max))
    xlabel!("X")
    ylabel!("Y")
    title!("Barnsley Fern")

    if config.plot_config isa AnimatedPlot
        

        x = config.spatial_config.x_start
        y = config.spatial_config.y_start

        # TODO : Replace uncomment and refactor this once the issue https://github.com/JuliaPlots/Plots.jl/issues/3664 gets fixed in Mac M2

        cpu_info = Sys.cpu_info()
        
        if (Sys.KERNEL == :Darwin) && (in(cpu_info[1].model, ["Apple M1", "Apple M2"]))
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