# Install the 'tidyverse' package if not already installed. 
# 'tidyverse' is a collection of R packages designed for data science.
install.packages("tidyverse")

# Load the 'tidyverse' package to use its functions.
library(tidyverse)

# Set a seed to ensure that the random number generation is reproducible.
# This means you'll get the same random numbers each time you run the script.
set.seed(123)

# Define the number of participants for the simulation.
n_participants <- 1000

# Create a tibble (a type of dataframe) with participant IDs and assigned genders.
# 'sample' randomly selects from the given vectors, with replacement allowing repeats.
participants <- tibble(
  ID = 1:n_participants,
  gender = sample(c("Female", "Male"), n_participants, replace = TRUE)
)

# Generate a tibble of economic conditions, randomly assigning values for economic perception,
# happiness level, and job attractiveness.
economic_conditions <- tibble(
  economicam = sample(c("Carolina", "Maria"), n_participants, replace = TRUE),
  felicidade = sample(c("Low", "Medium", "High"), n_participants, replace = TRUE),
  atratividade_trab = sample(c("Low", "High"), n_participants, replace = TRUE)
)

# Randomly generate seller choices among three options for each participant.
# This simulates participants' choices for three different house sellers.
seller_choices <- tibble(
  A_casa_1 = sample(c("Andre", "Bento", "Marcelo"), n_participants, replace = TRUE),
  A_casa_2 = sample(c("Andre", "Bento", "Marcelo"), n_participants, replace = TRUE),
  A_casa_3 = sample(c("Andre", "Bento", "Marcelo"), n_participants, replace = TRUE)
)

# Create tibble for buy/sell decisions with random choices between 'Less', 'More', and 'Same'.
# This could simulate participants' decisions to buy or sell a chair given varying prices.
buy_sell_decisions <- tibble(
  poltrona_venda_reais = sample(c("Less", "More", "Same"), n_participants, replace = TRUE),
  poltrona_compra_reai = sample(c("Less", "More", "Same"), n_participants, replace = TRUE),
  poltrona_venda_porce = sample(c("Less", "More", "Same"), n_participants, replace = TRUE)
)

# Simulate contract choices with a random distribution between options A and B for AB contracts,
# C and D for CD contracts, and E and F for EF contracts.
contract_choices <- tibble(
  contrato_AB = sample(c("A", "B"), n_participants, replace = TRUE),
  contrato_CD = sample(c("C", "D"), n_participants, replace = TRUE),
  contrato_EF = sample(c("E", "F"), n_participants, replace = TRUE)
)

# Combine all the individual tibbles into one dataframe to represent the simulated dataset.
# 'bind_cols' is used to bind the columns of different tibbles into a single tibble.
simulated_data <- bind_cols(participants, economic_conditions, seller_choices, buy_sell_decisions, contract_choices)

# Display the first few rows of the simulated dataset to verify the data generation.
# 'head' is used to show the first six rows by default, which helps to quickly check the dataset.
head(simulated_data)
