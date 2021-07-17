fluidRow(
  
           column(8, 
                tabsetPanel(
                  
                  tabPanel("About Detekt",
                           HTML(markdown::markdownToHTML(knit("about.Rmd", quiet = T))))
                  ) ## close tabset panel
                
                ) ## close column
         
         )# closing second fr
