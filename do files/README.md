# Stata Scripts

This folder contains the Stata (`.do`) scripts used for data management, variable construction, statistical analysis, and generation of study results.

The scripts are organized according to the analytical workflow:

| Script | Description |
|--------|-------------|
| `01_Data_Cleaning.do` | Imports the study dataset, performs data cleaning, recodes variables, and prepares the analytic dataset. |
| `02_Variable_Creation.do` | Generates outcome, exposure, and covariate variables, including scoring of the Maternal Adjustment and Maternal Attitudes (MAMA) and Postpartum Bonding Questionnaire (PBQ) measures. |
| `03_Descriptive_Analysis.do` | Produces descriptive statistics summarizing participant characteristics and study variables. |
| `04_Regression_Analysis.do` | Fits multiple linear and logistic regression models to evaluate the association between pregnancy intendedness, maternal attitudes, adjustment, and postpartum bonding. |


## Notes

- The scripts are intended to be run sequentially.
- The dataset used in this project is **not publicly available** because it originates from the ongoing clinical trial.
- Users with authorized access to the study data may adapt these scripts to reproduce the analyses.
