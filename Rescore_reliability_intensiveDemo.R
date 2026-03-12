library(haven)
library(psych)
library(tidyverse)
library(dplyr)

DASS_Demo_dataset <- read_sav("DASS_Demo_dataset.sav") # use Haven package to read data 

DASS_dataset <- na.omit(DASS_Demo_dataset) # omit NA values - may not be necessary? But otherwise you get 0 scores for people with NA values. 

DASS_scale <- select(DASS_dataset, DASS_1:DASS_21) # select only DASS items

DASS_scale_r <- (DASS_scale-1) # recode by subtracting 1 from everything 

# select the items for each scale 
DASS_stress <- select(DASS_scale_r, DASS_1, DASS_6, DASS_8, DASS_11, DASS_12, DASS_14, DASS_18)
DASS_depression <- select(DASS_scale_r, DASS_3, DASS_5, DASS_10, DASS_13, DASS_16, DASS_17, DASS_21)
DASS_anxiety <- select(DASS_scale_r, DASS_2, DASS_4, DASS_7, DASS_9, DASS_15, DASS_19, DASS_20)


# use the psych alpha package to get Cronbach's alpha and lots of other stuff, inlcuding sum scores! Cumulative is for sum not mean scores, and discrete is just a hack to prevent a warning. 
str_alpha <- psych::alpha(DASS_stress, cumulative=TRUE, discrete = FALSE)  
dep_alpha <- psych::alpha(DASS_depression, cumulative=TRUE, discrete = FALSE) 
anx_alpha <- psych::alpha(DASS_anxiety, cumulative=TRUE, discrete = FALSE)  


# Print tables with alpha for the subscales
tab_stress <- print(str_alpha$total)
tab_depression <- print(dep_alpha$total)
tab_anxiety <- print(anx_alpha$total)

# Add subscale scores back into dataset - remember to multiply by 2 as per the manual
DASS_dataset$DASS_depression_score <- dep_alpha$scores*2
DASS_dataset$DASS_anxiety_score <- anx_alpha$scores*2
DASS_dataset$DASS_stress_score <- str_alpha$scores*2

# Write the new dataset back into a .sav file. 
write_sav(DASS_dataset, "Demo_data_with_scores.sav")
