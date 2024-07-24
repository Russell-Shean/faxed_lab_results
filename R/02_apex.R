# Apex



# load in fax data
fax_table <- read.csv("./finished_data/faxes.csv")



# find the subset of faxes from Apex

apex_index <- fax_table$file_text %>% 
               str_to_lower() %>%
               str_detect("apex")


apex <- fax_table[apex_index,]

# extract variables ---------------------------------------------

## patient demographics ----------------------------------------

### Patient Name ---------------------------------------------
apex$patient_name <- apex$file_text %>%
                     str_to_lower() %>%
                      str_extract("(?<=patient:).*(?=specimen)") %>%
                     str_squish()

### Date of birth -------------------------------------------
apex$date_of_birth <- apex$file_text %>%
                      str_to_lower() %>%
                      str_extract("(?<=dob).*") %>%
                      str_extract("[0-9]{1,2}(/|-)[0-9]{1,2}(/|-)[0-9]{2,4}") %>%
                      str_squish() %>%
                      mdy()


### Gender -------------------------------------
apex$gender <- apex$file_text %>%
  str_to_lower() %>%
  str_extract("(?<=gender:).*(?=receive)")%>%
  str_squish()

### Patient phone number -------------------------------------
apex$patient_phone <- apex$file_text %>%
  str_to_lower() %>%
  str_extract("(?<=phone:).*(?=ordering)")%>%
  str_squish()


## Specimen ---------------------------------------------

### Specimen number -------------------------------------
apex$specimen_number <- apex$file_text %>%
                        str_to_lower() %>%
                        str_extract("(?<=specimen:).*")%>%
                        str_squish()


### Specimen collection date -------------------------------------
apex$collection_date <- apex$file_text %>%
  str_to_lower() %>%
  str_extract("(?<=collected:).*") %>%
  str_extract("[0-9]{1,2}(/|-)[0-9]{1,2}(/|-)[0-9]{2,4}") %>%
  str_squish() %>%
  mdy()

## results -------------------------------------------

### Protime test result value ----------------------------
apex$protime_result_value <- apex$file_text %>%
  str_to_lower() %>%
  str_extract("(?<=protime).*(?=secs)") %>%
  str_extract("[0-9]+.[0-9]+") 

apex$protime_result_code <- apex$file_text %>%
  str_to_lower() %>%
  str_extract("(?<=protime).*(?=secs)") %>%
  str_remove_all("[0-9]")  %>%
  str_remove_all("\\.")  %>%
  str_squish() 

# Rename and move files ----------------------------------------------

## create a folder for apex results------------------------------------
# (this could also be done by disease type)
# (or positive or negative results)

# check to see if  folder exists
# and create it if it doesn't

if( !dir.exists("./finished_data/apex") ){
  
  dir.create("./finished_data/apex")
  
}



## create a new file name with key data points ----------------------------

apex$new_file_name <- paste0("protime_",
                             apex$protime_result_code,
                             "_",
                             apex$patient_name,
                             "_",
                             apex$date_of_birth,
                             "_collect_",
                             apex$collection_date)

## move files -------------------------------------------------------

file.copy(from = apex$file_name,
          to = paste0("./finished_data/apex/",
                      apex$new_file_name))


write.csv(apex,
          file = "./finished_data/apex_results.csv",
          row.names = FALSE)
