#!/usr/bin/env julia
# separate file because I can't get an equivalent of @__FILE__ to work in IJulia
function clone_or_pull(url)
    dir = basename(url)
    if isdir(dir)
        run(setenv(`git pull`; dir=dir))
    else
        run(`git clone $url`)
    end
end
cd(dirname(dirname(@__FILE__))) do
    clone_or_pull("https://github.com/tkelman/Rmath-julia")
    clone_or_pull("https://github.com/tkelman/Rmath.jl")
end