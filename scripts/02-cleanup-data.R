# Install necessary R packages if they are not already installed
# dplyr for data manipulation, readxl for reading Excel files, and here for path management
install.packages("dplyr")
install.packages("readxl")
install.packages("here")

# Load the required libraries into the R session
library(readxl) # For reading Excel files
library(dplyr)  # For data manipulation functions
library(here)   # For constructing portable paths

# Set file paths using the `here` function, ensuring they work across different environments
# `input_file_path` is the path where the raw Excel data file is located
# `output_file_path` is where the cleaned data will be saved as a CSV file
input_file_path <- here("inputs", "data", "money_data_raw.xlsx")
output_file_path <- here("outputs", "data", "cleaned_money_data.csv")

# Step 0: Read the raw data from the Excel file
# The data is read into a dataframe `raw_data`
raw_data <- readxl::read_excel(input_file_path)

# Step 1: Clean the data by removing the first row, which contains column descriptions rather than data
# The `slice` function from dplyr excludes the first row
cleaned_data <- raw_data %>% 
  slice(-1)

# Step 2: Streamline the dataset by selecting only relevant columns for this analysis
# Irrelevant columns such as demographic details and verification question responses are removed
cleaned_data <- cleaned_data %>%
  select(
    -idade,                 # Age
    -gênero_3_TEXT,         # Text response for gender
    -decl_racial,           # Racial declaration
    -decl_racial_5_TEXT,    # Text response for racial declaration
    -escolaridade,          # Education level
    -escolaridade_transf,   # Transferred education level
    -área_estudo,           # Area of study
    -curso,                 # Course
    -cidade_bairro_1,       # Neighborhood and city
    -renda,                 # Income
    -renda_e_pessoas,       # Income per household
    -verif_maria,           # Verification question for Maria
    -`setal1997-funnel`     # Funnel questions from setal1997 study
  )

# Step 3: Filter out incomplete records, specifically those where the gender is missing or marked as 'Other'
# This ensures the dataset only contains entries with specified gender information
cleaned_data <- cleaned_data %>%
  filter(!is.na(gênero) & gênero != 'Outro')

# Step 4: Write the cleaned dataset to a CSV file, excluding row names for a tidier file
# The resulting CSV file will be used for subsequent analysis
write.csv(cleaned_data, output_file_path, row.names = FALSE)
