hl.window_rule({
    name = "pip",
    match = { 
        class = "floorp|firefox|chromium", 
        title = "Picture-in-Picture" 
    },
    float = true,
    pin = true,
    size = { 469, 263 }
})
