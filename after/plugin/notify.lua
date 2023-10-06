local notify = require("notify")

notify.setup({
    background_colour = "NotifyBackground",
    fps = 60,
    icons = {
      DEBUG = "",
      ERROR = "",
      INFO = "",
      TRACE = "✎",
      WARN = ""
    },
    level = 2,
    max_width = 70,
    minimum_width = 50,
    render = "default",
    stages = "fade_in_slide_out",
    timeout = 2000,
    top_down = false,
    background_colour = "#000000",
})
