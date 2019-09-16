# # Creating package and binary file example

# ## About this example :
# this is an exmaple of bukding a pakge and binary file in julia
# for more data about creating packages look at https://julialang.github.io/Pkg.jl/v1/creating-packages/index.html

# ## the first step
# open a folder for our project
# to build a package you need to prass ']' to enter pkg> module
# then you need to call the 'generate' command followed by the package name
# in our case it will be : pkg> generate HelloWorld
# This creates a new project HelloWorld in our project folder
# with the following files:
# .
# ├── Project.toml
# └── src
#     └── HelloWorld.jl
# our code will be writen under the 'src' folder in the 'HelloWorld.jl' file.
# naw call the 'activate' commad followed by the package anme to set the 'pkg>'
# enviroment to be the current package,
# in our case after calling 'pkg> actvate HelloWorld' we get:
# '(HelloWorld) pkg>'.

# # Write our 'module'
# in order to make a package we need to write our code as 'module'
# see the 'HelloWorld.jl'

# # Adding dependencies to the project
# in this exmple we use 'Interact' and 'Blink' as dependencies
# to add this packages to our project we simply call 'add' followed by
# the packages name, for example : '(HelloWorld) pkg> add Interact Blink'

# # Add package path to julia
# next we will add the 'HelloWorld.jl' folder to julia path so we can later
# call the 'using' command to import this 'module'
# to add this path we will call:
# 'push!(LOAD_PATH,"xxx\\HelloWorld\\src")'

# # Call the 'module'
# now we can call our 'module' HelloWorld by using the 'using' command,
# after the 'midule' is loaded we can call the 'main()' function from the
# 'module' and use the GUI

module HelloWorld
    using Interact
    using Blink

    export main

    function main()
        b = button(lable = "press me")
        t = textbox(value = "")

        h = on(b) do val
            t[] = "hello world"
            sleep(2)
            t[] = ""
        end

        ui = vbox(hbox(CSSUtil.hskip(20em),b),CSSUtil.vskip(1em),t)
        w = Window()
        body!(w,ui)
    end
end # module


#' and https://medium.com/@sdanisch/compiling-julia-binaries-ddd6d4e0caf4 for PackageCompiler
