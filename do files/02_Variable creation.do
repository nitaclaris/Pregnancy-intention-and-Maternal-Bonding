*PROJECT: Pregnancy Intention and Maternal Infant Bonding

*AUTHOR: NITA CLARIS 

*DATE: NOV 2023

use  "PMH_clean.dta",clear

set more off

///////////////////OUTCOME VARIABLE/////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////



**************************MATERNAL ADJUSTMENT AND MATERNAL ATTITUDES************

local myvars not_a_good_mother hurting_baby_l no_time_for_self regretted_being_pregnant marternity_cloths_appealed happy_that_your_pregnant having_several_childred_l pregnancy_unpleasant caring_for_babys_need wondering_about_babys_health life_more_difficult_after_baby thought_breastfeeding_appeali

rename thought_of_breastfeeding_appeali thought_breastfeeding_appeali

foreach var in `myvars' {
	encode `var',gen (s_`var')
}

local myloc s_not_a_good_mother s_regretted_being_pregnant s_hurting_baby_l

foreach var in `myloc' {
	recode `var' (1=3 "not_at_all") (2=2 "a_lot") (3=1 "a_little") (4=4 "very_much"), gen(p_`var')
}


drop s_not_a_good_mother s_regretted_being_pregnant s_hurting_baby_l
rename p_s_not_a_good_mother s_not_a_good_mother
rename p_s_regretted_being_pregnant s_regretted_being_pregnan
rename p_s_hurting_baby_l s_hurting_baby_l

local myvars s_no_time_for_self s_marternity_cloths_appealed s_happy_that_your_pregnant s_having_several_childred_l s_pregnancy_unpleasant s_caring_for_babys_need s_wondering_about_babys_health s_life_more_difficult_after_baby s_thought_breastfeeding_appeali s_not_a_good_mother s_regretted_being_pregnan s_hurting_baby_l

egen MAMAS_scale=rowtotal(s_no_time_for_self - s_hurting_baby_l)


rename s_life_more_difficult_after_baby s_life_more_diff_after_baby

local myvars s_no_time_for_self s_marternity_cloths_appealed s_happy_that_your_pregnant s_having_several_childred_l s_pregnancy_unpleasant s_caring_for_babys_need s_wondering_about_babys_health s_life_more_diff_after_baby s_thought_breastfeeding_appeali s_not_a_good_mother s_regretted_being_pregnan s_hurting_baby_l

foreach var in `myvars' {
	recode `var' (3=1 "Not at all") (1=2 "A little") (2=3 "A lot") (4=4 "very_much"), gen(f`var')
}

egen MAMAS=rowtotal(fs_no_time_for_self - fs_hurting_baby_l)


/////////////////////HOUSEHOLD SOCIO-ECONOMIC STATUS////////////////////////////
********************************************************************************

rename group_householdtelephone_landli group_hhtelephone_landli
rename group_householdmotorcycle_scoot group_hhmotorcycle_scoot


local ses group_householdelectricity group_householdkoroboi group_householdparrafin_lamp group_householdradio group_householdtelevision group_householdcellular_phone group_hhtelephone_landli group_householdbed_mattress group_householdsofa_set group_householdtable_chair group_householdrefrigirator group_householdbicycle group_hhmotorcycle_scoot group_householdoxcart     own_livestock_herd  sufficient_food

foreach var in `ses' {
	gen d_`var' = 0 if `var'=="no"
	replace d_`var'=1 if `var'=="yes"
}

foreach var of varlist (d*) {
	label define `var' 0 "no" 1 "yes"
	label values `var' `var'
}

gen Heat=1 if source_of_heating=="wood"
replace Heat=2 if source_of_heating=="charcoal"|source_of_drinking_water=="coal"
replace Heat=3 if source_of_heating=="natural_gas"
replace Heat=4 if source_of_heating=="electricity"



//////////////////////////PRINCIPLE COMPONENT ANALYSIS//////////////////////////
********************************************************************************

pca d_group_householdelectricity d_group_householdkoroboi d_group_householdparrafin_lamp d_group_householdradio d_group_householdtelevision d_group_householdcellular_phone d_group_hhtelephone_landli d_group_householdbed_mattress d_group_householdsofa_set d_group_householdtable_chair d_group_householdrefrigirator d_group_householdbicycle d_group_hhmotorcycle_scoot d_group_householdoxcart d_own_livestock_herd d_sufficient_food,means components(1)

predict ses
xtile quintile1=ses,nq(3)

save PMH_clean_final.dta, replace