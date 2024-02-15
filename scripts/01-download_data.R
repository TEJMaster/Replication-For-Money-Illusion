# install necessary libraries
install.packages("httr")
install.packages("here")

# Load necessary libraries
library(httr) # for HTTP requests, like GET
library(here) # for constructing file paths that work across different operating systems

# Specify the direct download link for the dataset file
# Make sure this URL is the link to the file you intend to download
file_url <- "https://osf.io/4x25f/download"

# Specify the path where the downloaded file will be saved
# 'here' constructs a path relative to the project's root directory,
# ensuring that the script works seamlessly across different environments
save_to <- here("inputs", "data", "money_data_raw.xlsx")

# Perform the file download
# The GET function sends an HTTP GET request to the specified URL
# The write_disk function, with the path provided by 'here', writes the content of the response to disk
# 'overwrite = TRUE' ensures that if the file already exists, it will be overwritten
GET(file_url, write_disk(save_to, overwrite = TRUE))

# After running this script, the file 'money_data_raw.xlsx' should be in the 'inputs/data' directory
# of your project. Check this directory to verify the download.