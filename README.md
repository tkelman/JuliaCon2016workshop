Notebook for JuliaCon 2016 workshop

Creating, Distributing, and Testing Julia Packages with Binary Dependencies

[nbviewer link](https://nbviewer.jupyter.org/github/tkelman/JuliaCon2016workshop/blob/master/Workshop.ipynb)
(faster than github ipynb rendering)

Video of the workshop:

[![Video of the workshop](https://img.youtube.com/vi/XKdKdfHB2KM/0.jpg)](https://www.youtube.com/watch?v=XKdKdfHB2KM)

[Rmath-julia](https://github.com/tkelman/Rmath-julia/) the C library we built as an example
- See [.travis.yml](https://github.com/tkelman/Rmath-julia/blob/6e216c64f66813a7a281d0140dfbb94549d977af/.travis.yml) for example of automatically building Linux and OS X binaries and deploying them to GitHub Releases when you make [a tag](https://github.com/tkelman/Rmath-julia/releases)
- Note that the Linux `.so` will be architecture and distribution specific, if you try to use it on a distribution older than it was built with it might not work
- More resources ([docker containers](https://github.com/tkelman/c6g6)) and written resources/tutorials will be forthcoming as we improve and document them

[Rmath.jl](https://github.com/tkelman/Rmath.jl/) the Julia-side package
- See [`deps/build.jl`](https://github.com/tkelman/Rmath.jl/blob/master/deps/build.jl) for `BinDeps` recipe to build from source
- Good additional example packages of downloading binaries or using system package managers are in [ECOS.jl](https://github.com/JuliaOpt/ECOS.jl/blob/master/deps/build.jl) and [Cairo.jl](https://github.com/JuliaGraphics/Cairo.jl/blob/master/deps/build.jl) respectively
