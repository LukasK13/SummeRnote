# SummeRnote
Summernote WYSIWYG HTML editor for R Shiny

This project is no longer maintained.

Install by `devtools::install_github("LukasK13/SummeRnote")`

# Example
```
library(shiny)
library(SummeRnote)

ui <- fluidPage(
  summernoteInput("editor", label = "Editor", value = "Test123", height = 100,
                  toolbar = list(
                    list("style", c("bold", "italic", "underline")),
                    list("font", c("superscript", "subscript")),
                    list("Misc", c("codeview"))
                  )),
  actionButton("update", "update")
)

server <- function(input, output, session) {
  observeEvent(input$editor, {
    print(input$editor)
  })
  
  observeEvent(input$update, {
    updateSummernoteInput("editor", "Updated")
  })
}

shinyApp(ui = ui, server = server)
