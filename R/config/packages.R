# Load Libraries

# We'll use pacman::p_load() to install and load R packages

# Install pacman if it's missing
if(!require("pacman")){install.packages("pacman")}

# Check for packages
# load them if they're already installed
# Install them if they're missing

pacman::p_load(tesseract,   # For optical character reader function
               lubridate,  # For working with dates
               stringr)    # for manipulating strings + regular expressions

cat("Finished loading packages\n")
