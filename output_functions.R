
fraud = HTML(markdown::markdownToHTML(knit("fraud.Rmd", quiet = T)))
not_fraud = HTML(markdown::markdownToHTML(knit("no_fraud.Rmd", quiet = T)))
# Load Model-------------------------------------------------------------------- 

# loaded_model_rds <- readRDS(file = "rf_model.rds")
loaded_model <- readRDS(file = "xgb_model_finalv2.rds")

##------------------------------------------------------------------------------



# for multi 
csv_predict <- function(df){

  if(length(df>1))
    df$location_id <- as.factor(as.character(as.numeric(df$location_id)))
  predicted_output <- cbind(df, predict(loaded_model,df))
  predicted_output <-predicted_output %>%
    rename(
      "Risk Audit Class (RAC)" = ".pred_class"
      )
  return(predicted_output)
}


#for single


checkp = function(df) {
  p <- predict(loaded_model,df)
  if (p == "fraud") { output = fraud } else { output = not_fraud }
  return(output)}
