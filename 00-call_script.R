# Call script

# Run system checks -----------------------------------------------------------
source("R/config/system_checks.R")


# Configuration settings -------------------------------------------------------

# load packages
source("R/config/packages.R")

# load functions
source("R/config/functions.R")

# load file paths
source("R/config/file_paths.R")


# Date Processing --------------------------------------------------------------

## extract text ---------------------------------------------------------------
source("R/01_image_to_text.R")


## Extract data from free text ------------------------------------------------

### apex ----------------------------------------------------------------------
source("R/02_apex.R")

### drug tests ----------------------------------------------------------------
source("R/03_drug_tests.R")



