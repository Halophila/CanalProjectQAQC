sediment_checker <- function(df){
  library(tidyverse)

  canal_list <- c(28, 29, 132, 137, 147, 148, 263, 266,
                  277, 278, 282, 287, 288, 290, 293, 458,
                  459, 472, 476, 114, 118, 120, 145, 150, 152)

  cat("\n Checking data quality \n")

  ##Dataset
  print(paste("Dataset column is ... ",
              ifelse(
                all(df$dataset %in% c("EPA/Monroe County Demonstration Canal", "Islamorada Canal Monitoring")),
                yes = "All good", no = "There's a problem")))

  #sampling_trip
  print(paste("sampling_trip column is ... ",
              ifelse(
                all(str_length(df$sampling_trip) <= 7 & grepl(pattern = "_",df$sampling_trip)),
                yes = "All good", no = "There's a problem")))

  #canal
  print(paste("canal number column is ... ",
              ifelse(
                all(df$canal %in% canal_list),
                yes = "All good", no = "There's a problem")))

  #quadrat
  print(paste("quadrat column is ... ",
              ifelse(
                all(!is.na(df$quadrat)),
                yes = "All good", no = "There's a problem")))

  #dbd
  print(paste("DBD column is ... ",
              ifelse(
                all((df$DBD_gmL < 2 & df$DBD_gmL > 0.01) | is.na(df$DBD_gmL)),
                yes = "All good", no = "There's a problem")))

  #LOI
  print(paste("LOI column is ... ",
              ifelse(
                all((!is.na(df$LOI) & df$LOI < .7) | (is.na(df$LOI))),
                yes = "All good", no = "There's a problem")))

  #Corg
  print(paste("Corg column is ... ",
              ifelse(
                all((!is.na(df$Corg) & (df$Corg < 40) | df$Corg >0) | (is.na(df$Corg))),
                yes = "All good", no = "There's a problem")))


  #Cinorg
  print(paste("Cinorg column is ... ",
              ifelse(
                all((!is.na(df$Cinorg) & (df$Cinorg < 15) | df$Cinorg >0) | (is.na(df$Cinorg))),
                yes = "All good", no = "There's a problem")))


  #N
  print(paste("TN column is ... ",
              ifelse(
                all((!is.na(df$TN) & (df$TN < 5) | df$TN >0) | (is.na(df$TN))),
                yes = "All good", no = "There's a problem")))

  #TP
  print(paste("TP column is ... ",
              ifelse(
                all((!is.na(df$TP) & (df$TP < 1) | df$TP >0) | (is.na(df$TP))),
                yes = "All good", no = "There's a problem")))

  #d13
  print(paste("d13C column is ... ",
              ifelse(
                all((!is.na(df$TP) & (df$TP < 1) | df$TP >0) | (is.na(df$TP))),
                yes = "All good", no = "There's a problem")))

  #d15
  print(paste("d15N column is ... ",
              ifelse(
                all((!is.na(df$TP) & (df$TP < 1) | df$TP >0) | (is.na(df$TP))),
                yes = "All good", no = "There's a problem")))


  #row checks
  cat("\n Check if all the required canals have been entered \n")

  # all canals are entered
  print(paste("These canals are not included in the data table:",
              ifelse(all(canal_list %in% df$canal),
                     "All canals entered",
                     paste(canal_list[!canal_list %in% df$canal], collapse = ", ")
              )))
}
