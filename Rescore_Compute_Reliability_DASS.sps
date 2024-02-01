﻿* Encoding: UTF-8.

RECODE DASS_1 DASS_2 DASS_3 DASS_4 DASS_5 DASS_6 DASS_7 DASS_8 
    DASS_9 DASS_10 DASS_11 DASS_12 DASS_13 DASS_14 DASS_15 DASS_16 
    DASS_17 DASS_18 DASS_19 DASS_20 DASS_21 
    (1=0) (2=1) (3=2) (4=3) 
    INTO DASS_1_R DASS_2_R DASS_3_R DASS_4_R DASS_5_R DASS_6_R
    DASS_7_R DASS_8_R DASS_9_R DASS_10_R DASS_11_R DASS_12_R
    DASS_13_R DASS_14_R DASS_15_R DASS_16_R DASS_17_R DASS_18_R 
    DASS_19_R DASS_20_R DASS_21_R. 
EXECUTE.

COMPUTE DASS_Depression=2*(DASS_3_R+DASS_5_R+DASS_10_R+DASS_13_R+ 
    DASS_16_R+DASS_17_R+DASS_21_R). 
EXECUTE. 
COMPUTE DASS_Anxiety=2*(DASS_2_R+DASS_4_R+DASS_7_R+DASS_9_R+DASS_15_R+ 
    DASS_19_R+DASS_20_R). 
EXECUTE. 
COMPUTE DASS_Stress=2*(DASS_1_R+DASS_6_R+DASS_8_R+DASS_11_R+DASS_12_R+ 
    DASS_14_R+DASS_18_R). 
EXECUTE.

RELIABILITY 
  /VARIABLES=DASS_3_R DASS_5_R DASS_10_R DASS_13_R DASS_16_R 
    DASS_17_R DASS_21_R
  /SCALE('DASS_Depression') ALL 
  /MODEL=ALPHA 
  /STATISTICS=DESCRIPTIVE SCALE CORR 
  /SUMMARY=TOTAL.


RELIABILITY 
  /VARIABLES=DASS_2_R DASS_4_R DASS_7_R DASS_9_R DASS_15_R 
    DASS_19_R DASS_20_R 
  /SCALE('DASS_Anxiety') ALL 
  /MODEL=ALPHA 
  /STATISTICS=DESCRIPTIVE SCALE CORR 
  /SUMMARY=TOTAL.

RELIABILITY 
  /VARIABLES=DASS_1_R DASS_6_R DASS_8_R DASS_11_R DASS_12_R 
    DASS_14_R DASS_18_R 
  /SCALE('DASS_Stress') ALL 
  /MODEL=ALPHA 
  /STATISTICS=DESCRIPTIVE SCALE CORR 
  /SUMMARY=TOTAL.