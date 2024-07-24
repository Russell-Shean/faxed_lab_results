# Define Functions

ocr_comine_pages <- function(pdf_path){
  
  # tell tesseract which language to use when reading the image
  eng <- tesseract("eng")
  
  # tell tesseract to read the pdf at pdf_path and extract text
  individual_pages <- tesseract::ocr(pdf_path, engine = eng)
  
  
  #combine all the pages into one page
  combined_pages <- paste(individual_pages, collapse = "**new page**\n")
  
  # list all picture files in the folder
  png_file_paths <-  list.files(pattern = "png$")
  
  # remove pictures 
  # (this is important because otherwise the process
  #   takes up to much hard drive space  ) 
  file.remove(png_file_paths)
  
  
  return(combined_pages)
}

cat("Finished loading functions\n")

