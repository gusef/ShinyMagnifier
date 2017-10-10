#' Adds an image with magnifying capabilities
#'
#' Simple wrapper for Magnifier.js. Takes a thumbnail and a large image 
#'
#' @import htmlwidgets
#'
#' @export
ShinyMagnifier <- function(thumb, image, previewText='', zoom = 3, vspace = NULL,
                           width = NULL, height = NULL, elementId = NULL) {

  # forward options using x
  x = list(
      thumb = thumb,
      fullImage = image,
      previewText = previewText,
      zoom = zoom,
      vspace=vspace
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'ShinyMagnifier',
    x,
    width = width,
    height = height,
    package = 'ShinyMagnifier',
    elementId = elementId
  )
}

#' Shiny bindings for ShinyMagnifier
#'
#' Output and render functions for using ShinyMagnifier within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a ShinyMagnifier
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name ShinyMagnifier-shiny
#'
#' @export
ShinyMagnifierOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'ShinyMagnifier', width, height, package = 'ShinyMagnifier')
}

#' @rdname ShinyMagnifier-shiny
#' @export
renderShinyMagnifier <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, ShinyMagnifierOutput, env, quoted = TRUE)
}
