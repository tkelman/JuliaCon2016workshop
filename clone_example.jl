#!/usr/bin/env julia
# separate file because I can't get an equivalent of @__FILE__ to work in IJulia
# TODO file an issue about that and replace this line with a link to it
function clone_or_pull(url; pkg=false)
    dir = basename(url)
    if pkg
        name = splitext(dir)[1]
        if isdir(Pkg.dir(name))
            run(setenv(`git pull`; dir=Pkg.dir(name)))
        else
            Pkg.clone(url)
        end
    else
        if isdir(dir)
            run(setenv(`git pull`; dir=dir))
        else
            run(`git clone $url`)
        end
    end
end
cd(dirname(dirname(@__FILE__))) do
    clone_or_pull("https://github.com/tkelman/Rmath-julia")
    clone_or_pull("https://github.com/tkelman/Rmath.jl"; pkg=true)
end