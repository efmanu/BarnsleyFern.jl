# BarnsleyFern.jl

This Julia package aims to model BarnsleyFern using algorithmic botany concepts.

To install this package.

- Step 1: Open REPL by typing `julia` in terminal or in command window based on OS
- Step 2: Run he following command
```julia
using Pkg
Pkg.add("BarnsleyFern")
```


# Generate BarnsleyFern points

### Generate points with default settings:
```julia
using BarnsleyFern
points = BarnsleyFern.generate_points()
print(points)
```

The response looks like:

```
([0.0, 0.064, 0.8192, 0.7430016, 0.73392, 0.7736565414400001, 0.847784648448, 1.4437180494014725, 0.0, 0.0  …  1.5967306467558906, 2.280854587802239, 2.0593448846947, 1.9133194969533889, 1.8254715138133286, -1.1313106007203078, -0.8301721221057553, -0.5281106015982091, -0.23266038910017808, 0.050882225146960475], [1.6, 2.96, 1.1670399999999999, 2.559216, 3.745613536, 4.7544147056, 5.610306238102401, 2.006897505741056, 0.321103600918569, 0.05137657614697104  …  9.001300660055794, 3.0154621265699215, 4.071908624072344, 4.978748535073704, 5.755403474934512, 3.286047212662658, 4.438392554792072, 5.405840556457491, 6.216088897052796, 6.892981978058883])
```

### Generate points with custom settings:

We can generate default setting as below:
```julia
config = BarnsleyFern.FernConfig()
```
It looks like:
```
BarnsleyFern.FernConfig(10000, BarnsleyFern.SpatialConfig(-2.182, 2.6558, 0.0, 9.9983, 0.0, 0.0), BarnsleyFern.PlotConfig(false, "barnsley_fern.gif", 10), BarnsleyFern.ModelConfig(BarnsleyFern.ModelParams([0.0 0.0; 0.0 0.16], [0.0; 0.0;;], 0.01), BarnsleyFern.ModelParams([0.85 0.04; -0.04 0.85], [0.0; 1.6;;], 0.85), BarnsleyFern.ModelParams([0.2 -0.26; 0.23 0.22], [0.0; 1.6;;], 0.07), BarnsleyFern.ModelParams([-0.15 0.28; 0.26 0.24], [0.0; 0.44;;], 0.07)))
```
The main fields are `spatial_config`, `plot_config` and `model_config`.

#### Spatial Config
You can modifiy spatial parameters in the default config as below:

```julia
config.spatial_config = BarnsleyFern.SpatialConfig(
    x_min=-2.182, x_max=2.6558, 
    y_min=0, y_max= 9.9983, 
    x_start=0.0, y_start=0.0
)
```

#### Plot Config

You can modifiy plot configurations in the default config as below:

```julia
config.plot_config = BarnsleyFern.PlotConfig(
    animated = true, file_name =  "barnsley_fern.gif", fps=10
)
```

`animated =true` will generate animations of point generation and that animation will be stored with `file_name` path with frame rate of `fps`.

Default value of `animated` is `false` and it will just plot the figure.

#### Model Config

You can play with the coefficents of this model by changing the model configuration as below:


Then run the following code to generate points with new config:

```julia
points = BarnsleyFern.generate_points(;config=config)

config.model_config = BarnsleyFern.ModelConfig(
    f1 = BarnsleyFern.ModelParams([0.0 0.0; 0.0 0.16], [0.0; 0.0;;], 0.01),
    f2 = BarnsleyFern.ModelParams([0.85 0.04; -0.04 0.85], [0.0; 1.6;;], 0.85),
    f3 = BarnsleyFern.ModelParams([0.2 -0.26; 0.23 0.22], [0.0; 1.6;;], 0.07),
    f4 =  BarnsleyFern.ModelParams([-0.15 0.28; 0.26 0.24], [0.0; 0.44;;], 0.07)
)
```

You can refer [Wikipedia](https://en.wikipedia.org/wiki/Barnsley_fern) page to learn more about this model.

In this settings `f1` contains 3 fields
- `coeff` : Coeffcient section in the model
- `constant` : constant section in the model
- `prob` : Probability

# Generate BarnsleyFern plots

### Generate BarnsleyFern plots with default settings
```julia
BarnsleyFern.plot_fern()
```

### Generate BarnsleyFern plots with custom settings
```julia
BarnsleyFern.plot_fern(;config=config)
```

# Pattern:

![Image](https://github.com/efmanu/BarnsleyFern.jl/blob/main/docs/src/fern.png)


![Animation](https://github.com/efmanu/BarnsleyFern.jl/blob/main/docs/src/anim.gif)

