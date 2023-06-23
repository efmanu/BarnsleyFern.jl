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
points = BarnsleyFern.generatePoints()
print(points)
```

The response looks like:

```
([0.0, 0.064, 0.8192, 0.7430016, 0.73392, 0.7736565414400001, 0.847784648448, 1.4437180494014725, 0.0, 0.0  …  1.5967306467558906, 2.280854587802239, 2.0593448846947, 1.9133194969533889, 1.8254715138133286, -1.1313106007203078, -0.8301721221057553, -0.5281106015982091, -0.23266038910017808, 0.050882225146960475], [1.6, 2.96, 1.1670399999999999, 2.559216, 3.745613536, 4.7544147056, 5.610306238102401, 2.006897505741056, 0.321103600918569, 0.05137657614697104  …  9.001300660055794, 3.0154621265699215, 4.071908624072344, 4.978748535073704, 5.755403474934512, 3.286047212662658, 4.438392554792072, 5.405840556457491, 6.216088897052796, 6.892981978058883])
```

### Generate points with custom settings:
You can modifiy spatial parameters and number points required by passing a config variable as below:

```julia
config = FernConfig(
    ;points_per_draw=10000, 
    x_min=-2.182, x_max=2.6558, 
    y_min=0, y_max= 9.9983, 
    x_start=0.0, y_start=0.0
)
```

Then run the following code to generate points with new config:

```julia
points = BarnsleyFern.generatePoints(;config=config)
```

# Generate BarnsleyFern plots

# Generate BarnsleyFern plots with default settings
```julia
BarnsleyFern.plotFern()
```

# Generate BarnsleyFern plots with custom settings
```julia

config = FernConfig(
    ;points_per_draw=10000, 
    x_min=-2.182, x_max=2.6558, 
    y_min=0, y_max= 9.9983, 
    x_start=0.0, y_start=0.0
)

BarnsleyFern.plotFern()
```

