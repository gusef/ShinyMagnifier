require(ShinyMagnifier)



ui <- fillPage(fillRow(
    ShinyMagnifierOutput("magnifier", 
                         width = "100%", 
                         height = "100%"))
    ,tags$head(tags$script(src="ShinyMagnifier.js"))
)

server <- function(input, output, session) {

    output$magnifier <- renderShinyMagnifier({
      
        thumb_loc <- system.file('extdata/',
                             "S00-52910 G_[39703,10578]_composite_image_small.jpg",
                             package="ShinyMagnifier")
        thumb <- './thumb.jpg'
        
        file.copy(thumb_loc,file.path('www',thumb))
        
        
        image_loc <- system.file('extdata/',
                             "S00-52910 G_[39703,10578]_composite_image.jpg",
                             package="ShinyMagnifier")
        image <- './image.jpg'
        file.copy(image_loc,file.path('www',image))
        
        ShinyMagnifier(thumb, 
                       image, 
                       previewText = '',
                       zoom=4)
      
  })

}


shinyApp(ui, server)
