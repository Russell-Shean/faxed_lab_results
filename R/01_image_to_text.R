cat("Starting to extract text from faxes!")

# this converts all the pdfs to text using the ocr function defined in R/config/functions.R
fax_text <- lapply(fax_file_paths, ocr_comine_pages)  



# This writes out a csv file of faxes
# The first column is the file name
# the second column is the entire text of the fax
extracted_raw_text <- data.frame(file_name= fax_file_paths, file_text= unlist(fax_text))

# This write the data frame to file as a csv file
write.csv(extracted_raw_text, file = extracted_raw_text_path, row.names = FALSE)

cat("Finished extracting text from faxes!")