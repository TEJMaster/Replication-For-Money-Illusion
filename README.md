# Replication for Money Illusion

This repository contains the project "Replicating the 'Money Illusion' Effect: Exploring Gender Influences within a Brazilian Sample" focusing on exploring 'gender influences for money illusion from the original paper' within a Brazilian sample of 372 participants. This paper conducts a comprehensive analysis of gender-based economic decision-making differences through a series of money illusion experiments. The research aims to explore how men and women perceive and deal with financial risks when faced with different economic scenarios and terms. By analyzing choices under various conditions "the likelihood of buying and selling", "preferences for seller attributes", and "contract terms (real, nominal, neutral)" this paper attempts to uncover potential factors that may influence gender-specific financial behaviors.


In the creation of this project, OpenAI's ChatGPT was used to enhance the paragraphs, as well as assist in generating the plots. You can check the `input/misc/chat_with_chatGPT.txt` for a complete conversation of my usage of ChatGPT in this project.

## Repository Structure

The repository is organized as follows to ensure easy navigation and accessibility of the project components:

- `inputs/data/`: This directory stores the dataset used in the project. The main dataset, `money_data_raw.xlsx`, sourced from [original project](https://osf.io/48pqu/), is stored here.
- `inputs/literature/`: This directory stores the original paper that we are tring to reproduce in this study.
- `inputs/misc/`: This directory stores the miscellaneous components used for project creation. 

- `outputs/`: This folder contains the main outputs of the project:
  - `outputs/data/`: This directory contains the output of the cleaned dataset after the data cleaning process.
  - `outputs/paper/`: This directory stores the report of the actual paper. 

- `scripts/`: This folder contains some R scripts for this project. 

## How to Use This Repository

1. **Data Exploration and Analysis**: Navigate to the `outputs/paper` directory to find the Quarto markdown file for a detailed walkthrough of the data analysis process.

2. **Viewing the Report**: The final report in PDF format can also be found in the `outputs/paper` directory, providing a summarized view of the insights and findings from the analysis.

3. **Dataset**: To access the raw data, check the `inputs/data/` directory. To access the cleaned dataset, check the `outputs/data` directory.

## Devision of Work

- Terry Tu: Project manangement, R Scripts, Data section, Plots, Appendix, Bibilography
- Yaning jin: Results, Discussion, Conlusion, Sketch, Simulation
- Jingyi Shen: Abstract, Introduction, SSRP, Measurement
