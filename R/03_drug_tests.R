# drug tests



# load in fax data
fax_table <- read.csv("./finished_data/faxes.csv")



# find the subset of faxes from Apex

drug_tests_index <- fax_table$file_text %>% 
                    str_to_lower() %>%
                    str_detect("medical review officer report - confidential")


drug_tests <- fax_table[drug_tests_index,]

# split results --------------------------------------------------------


drug_tests <- data.frame( file_name = drug_tests$file_name,
                          file_text = unlist(
                                         str_split(drug_tests$file_text, 
                                                 "\\*\\*new page\\*\\*")))



# extract variables ---------------------------------------------

## patient demographics ----------------------------------------

### Patient Name ---------------------------------------------
drug_tests$patient_name <-drug_tests$file_text %>% 
                           str_to_lower() %>%
                          str_extract_all("(?<=donor:).*(?=donor id)") %>%
                          unlist() %>%
                          str_squish()

