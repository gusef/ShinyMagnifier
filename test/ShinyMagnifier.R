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
        thumb <- 'thumb.jpg'
        
        temp_dir <- tempdir()
        file.copy(thumb_loc,file.path(temp_dir,thumb))
        
        image_loc <- system.file('extdata/',
                             "S00-52910 G_[39703,10578]_composite_image.jpg",
                             package="ShinyMagnifier")
        image <- 'image.jpg'
        file.copy(image_loc,file.path(temp_dir,image))
        addResourcePath('img', temp_dir)
        
        ShinyMagnifier(file.path('img',thumb), 
                       file.path('img',image), 
                       previewText = '',
                       zoom=4,
                       vspace='50 0')
      
  })

}


shinyApp(ui, server)
