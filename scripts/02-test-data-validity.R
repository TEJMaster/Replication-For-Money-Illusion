# Install necessary packages
# install.packages("dplyr")
# install.packages("readr")
# install.packages("here")

# Load necessary packages
library(readr)
library(dplyr)
library(here)

# Load the cleaned money illusion data to variable 'data'
file_path <- here("outputs", "data", "cleaned_money_data.csv")
data <- read_csv(file_path)

# Below are the 7 tests for the cleaned dataset, 
# after running them we expected to get TRUE for all test cases

# Test 1: No missing value for gender column
# No NA in the 'gênero' column
test_gênero_NA <- all(!is.na(data$gênero))


# Test 2: Total entries are more than 300
test_entries_over_300 <- nrow(data) > 300


# Test 3: Gender only contains male or female 
# 'gênero' column contains only 'Mulher' and 'Homem'
test_gênero_values <- all(data$gênero %in% c('Mulher', 'Homem'))


# Test 4: Testing question 1 response only contain expected values
# "economicam", "felicidade", "atratividade_trab" columns only have values 'Carolina', 'Maria', or NA
test_specific_values <- all(sapply(data[c("economicam", "felicidade", "atratividade_trab")], function(x) {
  all(x %in% c('Carolina', 'Maria', NA))
}))


# Test 5:Testing question 2 response only contain expected values 
# Columns have values 'Igual', 'Menos suscetível', or NA
test_casa_values <- all(sapply(data[c("A casa_1", "A casa_2", "A casa_3")], function(x) {
  all(x %in% c(1, 2, 3, NA))
}))
print(paste("Test 5 - Casa columns contain only 1, 2, 3, or NA:", test_casa_values))


# Test 6: Testing question 3 response only contain expected values 
# Columns "A casa_1", "A casa_2", "A casa_3" contain only values 1, 2, 3, or NA
test_poltrona_values <- all(sapply(data[c("poltrona_venda_reais", "poltrona_compra_reai", "poltrona_venda_porce")], function(x) {
  all(x %in% c('Igual', 'Menos suscetível', 'Mais suscetível', NA))
}))


# Test 7: 
# "contrato_AB" contains only "A", "B", or NA; "contrato_CD" contains only "C", "D", or NA; "contrato_EF" contains only "E", "F", or NA
test_contrato_values <- all(data$contrato_AB %in% c("A", "B", NA)) &&
  all(data$contrato_CD %in% c("C", "D", NA)) &&
  all(data$contrato_EF %in% c("E", "F", NA))
print(paste("Test 7-9 - Contract columns contain only their respective allowed values or NA:", test_contrato_values))


# print the result from the tests
print(paste("Test 1 - No NA in 'gênero':", test_gênero_NA))
print(paste("Test 2 - Total entries over 300:", test_entries_over_300))
print(paste("Test 3 - 'gênero' contains only 'Mulher' and 'Homem':", test_gênero_values))
print(paste("Test 4 - Specific columns contain only 'Carolina', 'Maria', or NA:", test_specific_values))
print(paste("Test 5 - Casa columns contain only 1, 2, 3, or NA:", test_casa_values))
print(paste("Test 6 - Poltrona columns contain only 'Igual', 'Menos suscetível', 'Mais suscetível', or NA:", test_poltrona_values))
print(paste("Test 7-9 - Contract columns contain only their respective allowed values or NA:", test_contrato_values))