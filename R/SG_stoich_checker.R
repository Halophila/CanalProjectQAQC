SG_stoich_checker <- function(df){
  library(tidyverse)
  cat("\n Checking data quality \n")

  #sampling_trip
  print(paste("sampling_trip column is ... ",
              ifelse(
                all(str_length(df$sampling_trip) <= 7 & grepl(pattern = "_",df$sampling_trip)),
                yes = "All good", no = "There's a problem")))
  
  #canal
  print(paste("canal number column is ... ",
              ifelse(
                all(df$canal %in% c(28, 29, 132, 137, 147, 148, 263, 266, 
                                    277, 278, 282, 287, 288, 290, 293, 458, 
                                    459, 472, 476, 114, 118, 120, 145, 150, 152)),
                yes = "All good", no = "There's a problem")))
  
  #quadrat
  print(paste("quadrat column is ... ",
              ifelse(
                all(df$quadrat %in% c(0, 10, 50, 100, 250)),
                yes = "All good", no = "There's a problem")))
  
  
  
  #C
  print(paste("C column is ... ",
              ifelse(
                all((df$C < 45 & df$C > 25) | is.na(df$C)),
                yes = "All good", no = "There's a problem")))
  
  #N
  print(paste("N column is ... ",
              ifelse(
                all((df$N < 4 & df$N > 1) | is.na(df$N)),
                yes = "All good", no = "There's a problem")))
  
  
  #P
  print(paste("P column is ... ",
              ifelse(
                all((df$P < 0.25 & df$P > 0.001) | is.na(df$P)),
                yes = "All good", no = "There's a problem")))
  
  
  #d15N
  print(paste("d15N column is ... ",
              ifelse(
                all((df$d15N < 10 & df$d15N > -5) | is.na(df$d15N)),
                yes = "All good", no = "There's a problem")))
  
  #d13C
  print(paste("d13C column is ... ",
              ifelse(
                all((df$d13C < -4 & df$d13C > -25) | is.na(df$d13C)),
                yes = "All good", no = "There's a problem")))
  
}
