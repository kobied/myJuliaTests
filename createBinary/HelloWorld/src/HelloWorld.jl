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
