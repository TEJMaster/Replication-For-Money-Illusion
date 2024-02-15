# install necessary libraries
install.packages("dplyr")
install.packages("readxl")
install.packages("here")

# Load necessary libraries
library(readxl)
library(dplyr)
library(here)

# Use the `here` function to specify file paths relative to the project root
# These variables are used to store the file path to get the file before 
# data cleaning and save the file after data cleaning
input_file_path <- here("inputs", "data", "money_data_raw.xlsx")
output_file_path <- here("outputs", "data", "cleaned_money_data.csv")

# Step 0: Read the raw data-set
raw_data <- readxl::read_excel(input_file_path)

# Step 1: Remove the first row from the data-set
# This row is used to store the description about the column name
cleaned_data <- raw_data %>% 
  slice(-1)

# Step 2: Remove unnecessary columns for this study
# We only want the gender column and response choices columns
cleaned_data <- cleaned_data %>%
  select(
    -idade, 
    -gênero_3_TEXT, 
    -decl_racial, 
    -decl_racial_5_TEXT, 
    -escolaridade, 
    -escolaridade_transf, 
    -área_estudo, 
    -curso, 
    -cidade_bairro_1, 
    -renda, 
    -renda_e_pessoas,
    -verif_maria,
    -`setal1997-funnel`
  )

# Step 3: Remove rows where gender is NA
cleaned_data <- cleaned_data %>%
  filter(!is.na(gênero) & gênero != 'Outro')

# Step 4: Save the cleaned dataset to a CSV file
write.csv(cleaned_data, output_file_path, row.names = FALSE)
