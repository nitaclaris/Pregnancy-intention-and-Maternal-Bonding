*PROJECT: Pregnancy Intention and Maternal Infant Bonding

*AUTHOR: NITA CLARIS 

*DATE: NOV 2023


******************set the working directory
cd "C:\STATA DATASETS"

******************load the data

use  "PMH_clean_final.dta",clear

set more off

*************************Regression

//Model 1 with no interaction between variables
regress MAMAS i.Planned_preg age i.Occupation_Status i.Child_before_marriage i.Child_Gender i.ChIldren_living_with_you i.quintile1 i.Livingwith

//Model 2 with an interaction between Planned pregnancy and age
regress MAMAS i.Planned_preg##c.age i.Occupation_Status i.Child_before_marriage i.Child_Gender i.ChIldren_living_with_you i.quintile1 i.Livingwith //no interaction, non significant interaction

//Model 3 with an interaction between occupation and wealth quantile
regress MAMAS i.Planned_preg age i.Occupation_Status#i.quintile1  i.Child_before_marriage i.Child_Gender i.ChIldren_living_with_you // no interaction, non significant interaction

//Model 4 with an interacation between occupation and living with
regress MAMAS i.Planned_preg age i.Occupation_Status#i.Livingwith i.ChIldren_living_with_you i.quintile1  i.Child_before_marriage i.Child_Gender  //no interaction, non significant interaction

//Model 5 with an interaction between Planned pregnancy and wealth quantile
regress MAMAS i.Planned_preg#i.quintile

//Model 6 with an interaction between Planned pregnancy and wealth quantile with age added
regress MAMAS i.Planned_preg#i.quintile age

//Model 7 with an interaction between Planned pregnancy and wealth quantile with age  and child gender added
regress MAMAS i.Planned_preg#i.quintile age i.Child_Gender

//Model 8 with an interaction between Planned pregnancy and wealth quantile, and  age  and child gender interaction
regress MAMAS i.Planned_preg i.quintile c.age##i.Child_Gender //no interaction, non significant interaction

//Final model
regress MAMAS i.Planned_preg#i.quintile age i.Child_Gender i.Child_before_marriage i.f_forced_sex


save "PMH_clean_final.dta", replace