####libraries####
library(shiny)
library(bslib)
library(knitr)
library(tidymodels)
library(tidyverse)
library(DT)
library(xgboost)
source("output_functions.R")


# Load Model-------------------------------------------------------------------- 

#loaded_model <- readRDS(file = "rf_model.rds")

loaded_model <- readRDS(file = "xgb_model_finalv2.rds")


####user interface####
ui <- fluidPage(
    
    ####make the navbar pages####
    shinyUI(
        navbarPage("Detekt", theme=bs_theme(version = 4, bootswatch = "flatly"),
                   tabPanel("Check Single Firm",source("single.R")$value),# close single tabpanel
                   tabPanel("Check Multiple Firm",source("csv_output.R")$value),# close multi tabpanel
                   tags$style(type="text/css",
                              ".shiny-output-error { visibility: hidden; }",
                              ".shiny-output-error:before { visibility: hidden; }"),
                   tabPanel("About Detekt",source("about.R")$value)# close about tabpanel
                   )## close navbarPage
        )## close UI
    )## close fluidPage

#### server section#### ---------------------------------------------------
server <- function(input, output,session) {
    
    # session$onSessionEnded(stopApp)
   
    ####single summary####
   
    output$ZMsummary <- renderUI({

        d1 = as.numeric(input$ss)    # get sector score
        d2 = as.character(input$lid) # get location id
        d3 = as.numeric(input$para)  # get para_a
        d4 = as.numeric(input$parb)  # get para_b
        d5 = as.numeric(input$tot)   # get total
        d6 = as.numeric(input$num)   # get numbers
        d7 = as.numeric(input$mv)    # get money value


        df_single = data.frame( 
                                # 'sector_score' = d1,
                                "location_id"  = d2,
                                "para_a"	   = d3,
                                "para_b"       = d4,
                                "total"        = d5,
                                # "numbers"      = d6,
                                "money_value"  = d7
                                )
        
       
        if(!is.na(d7)) {
            checkp(df_single)
            }
        })##close single summary
    

    ####csv summary####

    df_upload <- reactive({
        inFile <- input$file1
        if (is.null(inFile))
            return(NULL)
        df <- read.csv(inFile$datapath, header = TRUE,stringsAsFactors = TRUE)
            return(df)
        })
        
    
       
    output$sample_table <- DT::renderDataTable({
        
        df_csv <-df_upload()
        DT::datatable(csv_predict(df_csv))
        
    })
   
    
    final_d <- reactive({
        df_csv <-df_upload()
        as.data.frame(csv_predict(df_csv))
    })
    
    output$downloadData <- downloadHandler(
        filename = function() {
            paste0('Predicted Risk Audit Class -', Sys.time(), '.csv')
        },
        content = function(file) {
            write.csv(final_d(), file,row.names=FALSE)
        }
    )  
    
    
} ##close server

# Run the application 
shinyApp(ui = ui, server = server)
