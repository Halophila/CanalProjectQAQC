inside_checker <- function(df){
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

  #Month
  print(paste("Month column is ... ",
        ifelse(
          !anyNA(df$month),
          yes = "All good", no = "There's a problem")))

  #canal
  print(paste("canal number column is ... ",
              ifelse(
                all(df$canal %in% canal_list),
                yes = "All good", no = "There's a problem")))

#quadrat
  print(paste("quadrat column is ... ",
              ifelse(
                all(df$quadrat %in% (1:10)),
                yes = "All good", no = "There's a problem")))

#substrate
  print(paste("substrate column is ... ",
              ifelse(
                all(df$substrate %in% c("Muck", NA, "M", "MS", "Rub", "S", "Rock", "Wrack", "SM", "HH")),
                yes = "All good", no = "There's a problem")))

#depth_cm
  print(paste("Sediment depth column is ... ",
              ifelse(
                all((!is.na(df$depth_cm) & df$depth_cm < 500) | (is.na(df$depth_cm))),
                yes = "All good", no = "There's a problem")))

#canopy_height_cm
  print(paste("canopy height column is ... ",
              ifelse(
                all((!is.na(df$canopy_height_cm) & df$canopy_height_cm < 120) | (is.na(df$canopy_height_cm))),
                yes = "All good", no = "There's a problem")))


#BB's
  cat("\n Check all species for realistic BB scores \n")

  species <- df %>%
  select(-c(names(df)[1:10])) %>%
  names

  for (i in seq_along(species)){
    results = 0
    tested_species = species[i]
    results[i] = ifelse(all(df[[tested_species]] %in% c(0, 0.1, 0.5, 1, 2, 3, 4, 5, NA)),
                        yes = "All good", no = "There's a problem")
    print(paste(species[i], "column is ... ", results[i]))
  }

  #row checks
  cat("\n Check if all the required canals have been entered \n")

  # all canals are entered

  print(paste("These canals are not included in the data table:",
              ifelse(all(canal_list %in% df$canal),
                     "All canals entered",
                     paste(canal_list[!canal_list %in% df$canal], collapse = ", ")
              )))
}

