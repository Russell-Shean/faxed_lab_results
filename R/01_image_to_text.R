# this was our start time
time_a <- Sys.time()


# Load Libraries
library(tesseract)

# check to see if a finished data folder exists
# and create it if it doesn't

if( !dir.exists("finished_data") ){
  
  dir.create("finished_data")
  
}



# Define Functions
ocr2 <- function(pdf_path){
  
  # tell tesseract which language to guess
  eng <- tesseract("eng")
  
  # tell tesseract to convert the pdf at pdf_path
  seperated_pages <- tesseract::ocr(pdf_path, engine = eng)
  
  
  #combine all the pages into one page
  combined_pages <- paste(seperated_pages, collapse = "**new page**\n")
  
  # list all picture files in the folder
  png_file_paths <-  list.files(pattern = "png$")
  
  # remove pictures 
  # (this is important because otherwise the process
  #   takes up to much hard drive space  ) 
  file.remove(png_file_paths)
  
  
  combined_pages
}


# find pdf_paths

fax_file_paths <-  list.files(path="./raw_data", 
                              pattern = "pdf$",
                              recursive = TRUE,
                              full.names = TRUE)


#this converts all the pdfs to text using the ocr
faxes <- lapply(fax_file_paths, ocr2)  



# This writes out a csv file of faxes
# The first column is the file name
# the second column is the entire text of the fax
fax_table <- data.frame(file_name= fax_file_paths, file_text= unlist(faxes))

# This write the data frame to file as a csv file
write.csv(fax_table, file = "./finished_data/faxes.csv", row.names = FALSE)




# this is end time
time_b <- Sys.time()


# This is difference between start and end time
time_diff <- time_b -time_a
time_diff2 <- paste("This script started running at", time_a,  "and ended at", time_b)

# this writes end time to file
write.table(time_diff2, file = "time_diff.txt", row.names = FALSE, col.names = FALSE)
