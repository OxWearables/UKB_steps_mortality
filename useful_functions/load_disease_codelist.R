icd9_any_chronic_disease <- read.table("useful_functions/icd9s.txt")
icd10_any_chronic_disease <- read.table("useful_functions/icd10s.txt")

# Each is a two element list of ICD10 codes followed by ICD9 codes
disease_codelist <- list(
  "Chronic_Disease" = list(icd10_any_chronic_disease$V1, icd9_any_chronic_disease$V1),
  "Chronic_Obstructive_Pulmonary_Disease" = list(c("J430","J431","J432","J438","J439","J440","J441","J448","J449"), c("4929")),  
  "Chronic_Renal_Failure" = list(c("N180","N181","N182","N183","N184","N185","N188", "N189", "N19"), c("5859")), 
  "Depressive_Disorder" = list(c("F320", "F321", "F322", "F323", "F328", "F329", "F330", "F331", "F332", "F333", "F334", "F338", "F339"), c("3119")), 
  "Insulin_Dependent_Diabetes" = list(c("E100", "E101", "E102", "E103", "E104", "E105", "E106", "E107", "E108", "E109", "E131", "E141"), c("25010", "25011", "25019")))




