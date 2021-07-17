fluidRow(
  
  #### put input area here ####
  column(4,
         style = "background-color: #E8E8E8",
         
         
         ##change the title here
         div(style="display: inline-block; vertical-align:top; text-align:center; width: 100%;",
             strong("Check Potential Fraud For Single Firm")),
         
         br(),
         ##put input boxes here
         # div(style="display: inline-block;vertical-align:top; width: 200px;",
         #     strong("Sector Score:"), 
         #     textInput("ss", NULL, width = 60)),
         
         br(),
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("Location ID:"),
             helpText("Unique ID of City/Province",textInput("lid", NULL, width = 60))), 
         
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("Para A (Rs.in Cr):"),
             helpText("Discrepancy in Planned Expenditure Rs (in crore)",textInput("para", NULL, width = 60))),
         
         br(),
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("Para B (Rs.in Cr):"),
             helpText("Discrepancy in Unplanned Expenditure Rs (in crore)",textInput("parb", NULL, width = 60))),
         
         br(),
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("Total (Rs.in Cr):"),
             helpText("Total amount of discrepancy found in other reports Rs (in crore))",textInput("tot", NULL, width = 60))), 
         
         # div(style="display: inline-block;vertical-align:top; width: 200px;",
         #     strong("Numbers:"),
         #     textInput("num", NULL, width = 60)),
         
         br(),
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("Money Value (Rs.in Cr):"),
             helpText("Amount of money involved in misstatements in the past audits",textInput("mv", NULL, width = 60))),
         
         submitButton("Detekt",icon("refresh"))
         
         
         
  ), ## close column 1
  
  
  #### put output here ####
  column(8, 
         tabsetPanel(
           tabPanel("Summary", htmlOutput("ZMsummary"))
         ) ## close tabset panel
  ) ## close column
  
) ##close fluid row