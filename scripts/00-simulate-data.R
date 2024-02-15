library(tidyverse)

set.seed(123)

n_participants <- 1000

participants <- tibble(
  ID = 1:n_participants,
  gender = sample(c("Female", "Male"), n_participants, replace = TRUE)
)

economic_conditions <- tibble(
  economicam = sample(c("Carolina", "Maria"), n_participants, replace = TRUE),
  felicidade = sample(c("Low", "Medium", "High"), n_participants, replace = TRUE),
  atratividade_trab = sample(c("Low", "High"), n_participants, replace = TRUE)
)

seller_choices <- tibble(
  A_casa_1 = sample(c("Andre", "Bento", "Marcelo"), n_participants, replace = TRUE),
  A_casa_2 = sample(c("Andre", "Bento", "Marcelo"), n_participants, replace = TRUE),
  A_casa_3 = sample(c("Andre", "Bento", "Marcelo"), n_participants, replace = TRUE)
)

buy_sell_decisions <- tibble(
  poltrona_venda_reais = sample(c("Less", "More", "Same"), n_participants, replace = TRUE),
  poltrona_compra_reai = sample(c("Less", "More", "Same"), n_participants, replace = TRUE),
  poltrona_venda_porce = sample(c("Less", "More", "Same"), n_participants, replace = TRUE)
)

contract_choices <- tibble(
  contrato_AB = sample(c("A", "B"), n_participants, replace = TRUE),
  contrato_CD = sample(c("C", "D"), n_participants, replace = TRUE),
  contrato_EF = sample(c("E", "F"), n_participants, replace = TRUE)
)

simulated_data <- bind_cols(participants, economic_conditions, seller_choices, buy_sell_decisions, contract_choices)

head(simulated_data)
