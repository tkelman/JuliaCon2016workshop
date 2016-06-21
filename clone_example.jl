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
            Pkg.clone(string("https://", url))
            symlink(Pkg.dir(name), dir)
            # for my own pushing convenience because ssh is annoying
            run(setenv(`git remote add tkelman https://tkelman@$url`; dir=dir))
        end
    else
        if isdir(dir)
            run(setenv(`git pull`; dir=dir))
        else
            run(`git clone https://$url`)
            # for my own pushing convenience because ssh is annoying
            run(setenv(`git remote add tkelman https://tkelman@$url`; dir=dir))
        end
    end
end
cd(dirname(dirname(@__FILE__))) do
    clone_or_pull("github.com/tkelman/Rmath-julia")
    clone_or_pull("github.com/tkelman/Rmath.jl"; pkg=true)
end
