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
    fps::Int = 10
    type::Symbol = :scatter
    nx::Int = 100
    ny::Int = 100
end

Base.@kwdef mutable struct ModelParams
    coeff::Matrix{Float64} = [0.0 0.0; 0.0 0.16]
    constant::Matrix{Float64} = hcat([0.0, 0.0])
    prob::Float64 = 0.01
end

Base.@kwdef mutable struct ModelConfig
    f1::ModelParams = ModelParams()
    f2::ModelParams = ModelParams([0.85 0.04; -0.04 0.85], hcat([0.0 ,1.60]), 0.85)
    f3::ModelParams = ModelParams([0.2 -0.26; 0.23 0.22], hcat([0.0, 1.60]), 0.07)
    f4::ModelParams = ModelParams([-0.15 0.28; 0.26 0.24], hcat([0.0, 0.44]), 0.07)
end

Base.@kwdef mutable struct FernConfig
    points_per_draw::Int = 10000
    spatial_config::SpatialConfig = SpatialConfig()
    plot_config::PlotConfig = PlotConfig()
    model_config::ModelConfig = ModelConfig()
end