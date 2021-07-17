fluidRow(
  
  #### put input area here ####
  column(4,
         style = "background-color: #E8E8E8",
         
         
         ##change the title here
         div(style="display: inline-block; vertical-align:top; text-align:center; width: 100%;",
             strong("Check Potential Fraud For Single Firm")),
         
         br(),
         
         # Input directly under menuItem
         fileInput('file1', 'Choose CSV File with cases to be categorized',
                   accept=c('text/csv', 
                            'text/comma-separated-values,text/plain', 
                            '.csv')),
         br(),
         
         
         downloadButton("downloadData", "Click Here to Download ...",icon("download"))
         
  ),# closing second column
  
  #### put output here ####
  column(8, 
         tabsetPanel(
           tabPanel("Predicted Output", DT::dataTableOutput("sample_table"))
            
         ) ## close tabset panel
  ) ## close column
  
)# closing second fr
