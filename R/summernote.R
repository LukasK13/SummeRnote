#' Include a summernote editor in the UI
#'
#' This functions create the neccessary HTML-tags to include
#' summernote wysiwyg editor within the apps UI.
#'
#' @param inputId ID of the corresponding input
#' @param label Label of the input
#' @param value Initial value of the editor
#' @param ... Other arguments used to initialize the editor
#'
#' @export
summernoteInput <- function(inputId, label = NULL, value = "", ...) {
  shiny::addResourcePath("summernote", system.file("www", package = "SummeRnote"))
  
  tagList(shiny::singleton(
    shiny::tags$head(
      shiny::tags$script(src = "summernote/summernote_binding.js"),
      shiny::tags$script(src = "summernote/summernote/summernote.js"),
      shiny::tags$link(href = "summernote/summernote/summernote.css", rel = "stylesheet")
    )),
    if (!is.null(label)) shiny::tags$label(`for` = inputId, label),
    shiny::tags$div(class = "summernoteInput", id = inputId, style = "height: 200px;",
                    `data-options` = jsonlite::toJSON(list(...), auto_unbox = F), value)
  )
}

#' Update summernote editor
#'
#' This function updates the content of summernote editor
#' with the given ID.
#'
#' @param inputId ID of the summernote editor
#' @param value New content of the editor
#' @seealso \code{\link{summernoteInput}}
#' @export
updateSummernoteInput <- function(inputId, value, session = shiny::getDefaultReactiveDomain()) {
  session$sendCustomMessage("updateSummernoteInput", list(inputId = inputId, value = value))
}