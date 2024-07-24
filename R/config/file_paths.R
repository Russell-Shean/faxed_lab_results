
data_folder <- "./data"
raw_data_folder <- paste0(data_folder, "/raw_data")
intermediate_data_folder <- paste0(data_folder, "/intermediate_data")
final_data_folder <- paste0(data_folder, "/final_data")
apex_folder <- paste0(final_data_folder, "/apex")

# pdfs stored in the raw data folder
fax_file_paths <-  list.files(path=raw_data_folder, 
                              pattern = "pdf$",
                              recursive = TRUE,
                              full.names = TRUE)




# This an intermediate csv file containing the extracted text
# with one row per file
extracted_raw_text_path <- paste0(intermediate_data_folder, "/extracted_raw_text.csv")








cat("Finished loading file paths\n")




