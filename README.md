# Canal Project QAQC

Are you entering data for the canal project? Using these R functions to check your data tables are complete and realistic. This requires standard data entry templates

Functions:</br>
```sediment_checker``` table for sediment nutients and isotopes </br>
```seawall_checker``` table for seawall community BB scores</br>
```outside_checker``` table for quadrats outside canal mouth</br>
```inside_checker``` table for transect inside canal</br>
```fish_checker``` fish observations table</br>
```SG_stoich_checker``` table for seagrass nutients and isotopes</br>

``` R
###Example
> canal_fish_data <- read.csv("completed_template.csv") # completed csv for, in this case, fish observations inside canal
> CanalProjectQAQC::fish_checker(canal_fish_data)

 Checking data quality 
[1] "Dataset column is ...  All good"
[1] "sampling_trip column is ...  All good"
[1] "canal number column is ...  All good"
[1] "quadrat column is ...  All good"

 Prints a list of all critters. Does this look right? Any repeats?
 [1] "Angel fish"       "Barracuda"        "blue crab"       
 [4] "brown striped"    "eagle ray"        "French grunt"    
 [7] "jack"             "juvenile"         "Juvenile"        
[10] "manatee"          "Mangrove snapper" "Menidia"         
[13] "Minnow"           "Mullet"           "Needlefish"      
[16] "Nurse Shark"      "Parrot fish unkn" "Pin fish"        
[19] "Rainbow parrot"   "Sardine"          "sea hair"        
[22] "Sgt major"        "snook"            "Stoplight parrot"
[25] "tarpon"           "unknown"          "Unkwn grunt"     

 These critters are not in the original categories. They're a new addition or you're spelling names differently 
[1] "These critters are new: Nothing new"

 
[1] "abundance  column is ...  All good"
[1] "size  column is ...  All good"

```

