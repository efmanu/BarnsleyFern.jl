Base.@kwdef mutable struct SpatialConfig
    x_min::Float64 = -2.182
    x_max::Float64 = 2.6558
    y_min::Float64 = 0
    y_max::Float64 = 9.9983
    x_start::Float64 = 0.0
    y_start::Float64 = 0.0
end

Base.@kwdef mutable struct PlotConfig
    animated::Bool = false
    file_name::String = "barnsley_fern.gif"
    anim_interval::Int = 10
end

Base.@kwdef mutable struct FernConfig
    points_per_draw::Int = 10000
    spatial_config::SpatialConfig = SpatialConfig()
    plot_config::PlotConfig = PlotConfig()
end