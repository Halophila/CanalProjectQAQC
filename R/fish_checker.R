fish_checker <- function(df){
  library(tidyverse)

  canal_list <- c(28, 29, 132, 137, 147, 148, 263, 266,
                  277, 278, 282, 287, 288, 290, 293, 458,
                  459, 472, 476, 114, 118, 120, 145, 150, 152)

  org_fish_list <- c("angel fish" ,"barracuda", "blue crab","brown striped","eagle ray", "french grunt", "jack", "juvenile", "manatee" ,
                     "mangrove snapper", "menidia", "minnow", "mullet", "needlefish", "nurse shark", "parrot fish unkn", "pin fish" , "rainbow parrot",
                     "sardine", "sea hair", "sgt major", "snook", "stoplight parrot", "tarpon", "unknown", "unkwn grunt")


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
                all(df$quadrat %in% 1:10),
                yes = "All good", no = "There's a problem")))

  #organims
  cat("\n Prints a list of all critters. Does this look right? Any repeats?\n")

  print(df$organism %>% unique %>% sort())

  cat("\n These critters are not in the original categories. They're a new addition or you're spelling names differently \n")

  print(paste("These critters are new:",
              ifelse(all(df$organism %in% org_fish_list),
                     "Nothing new",
                     paste(df$organism[!df$organism %in% org_fish_list], collapse = ', ')
              )))


  cat("\n \n")

  #fish counts abundance
  print(paste("abundance  column is ... ",
              ifelse(
                all(df$abundance > 0),
                yes = "All good", no = "There's a problem")))


  #size
  print(paste("size  column is ... ",
              ifelse(
                all(df$size_cm > 0),
                yes = "All good", no = "There's a problem")))
}

