out <- withr::with_tempfile(
  "app.R",
  {
    styler::style_file("app.R", dry = "on")
  }
)

styler::style_file("app.R")
