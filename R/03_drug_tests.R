# drug tests


# find the subset of faxes that are drug tests

drug_tests_index <- extracted_raw_text$file_text %>% 
                    str_to_lower() %>%
                    str_detect("medical review officer report - confidential")


drug_tests <- extracted_raw_text[drug_tests_index,]

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


drug_tests$specimen_id <- drug_tests$file_text %>% 
  str_to_lower() %>%
  str_extract_all("(?<=specimen( |)id:).*(?=specimen type)") %>%
  unlist() %>%
  str_squish()

