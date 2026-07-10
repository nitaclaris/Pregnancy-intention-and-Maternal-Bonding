*PROJECT: Pregnancy Intention and Maternal Infant Bonding

*AUTHOR: NITA CLARIS 

*DATE: NOV 2023


******************set the working directory
cd "C:\STATA DATASETS"

******************load the data

use  "PMH_raw.dta",clear

set more off

*********************ENCODING AND CLEANING VARIABLES****************************
********************************************************************************


/////////////////////BODY IMAGE//////////////////////////////
/////////////////////////////////////////////////////////////

local bodyimage felt_attractive smelt_nice breast_to_small_l liked_shape_of_body felt_attractive_l breast_to_big proud_of_appearance body_soft felt_ungainly poor_complextion breast_atttractive felt_too_fat

foreach var in `bodyimage' {
	encode `var', gen(b_`var')
}

/////////////////SOMATIC SYMPTOMS////////////////////////////
/////////////////////////////////////////////////////////////

local somatic out_of_breath been_perspring vomitted faint_dizzy tingling_sensation suffered_constipation_l full_of_energy swollen_ankles wide_awake_daytime indigestion_heartburn felt_nauseated enjoyed_food


foreach var in `somatic' {
	encode `var', gen(s_`var')
}

//////////////MARITAL RELATIONSHIP////////////////////////////////
///////////////////////////////////////////////////////////////
rename partner_paying_little_attention partner_little_attention


local marital tension_with_partner come_close_to_blows show_affection_l partner_helped_l partner_little_attention partner_share_interest partner_out_to_often feeling_close_to_partner felt_like_cuddling partner_shown_affection rely_on_partner

foreach var in `marital' {
	encode `var', gen(m_`var')
}


/////////////////ATTITUDES TO SEX//////////////////////////////////
///////////////////////////////////////////////////////////////////
rename sexual_intercourse_less_private sex_less_private
rename sexual_intercourse_harmful_to_ba sex_harmful_to_ba
rename wanted_to_have_sexual_intercours wanted_to_have_sex

local attitudes partner_sexually_desireable sexually_desireable having_sexual_inercourse shy_about_sex_l sex_less_private enjoyed_kissing_l sex_harmful_to_ba tense_unhappy sex_unpleasant easily_aroused_sexually sex_day_dreams wanted_to_have_sex

foreach var in `attitudes' {
	encode `var', gen(a_`var')
}

/////////////////ATTITUDES TO THE PREGNANCY//////////////
///////////////////////////////////////////////////////////////
rename wondering_about_babys_health wonder_about_babys_health
rename life_more_difficult_after_baby lifedifficult_after_baby
rename thought_breastfeeding_appeali breastfeeding_appeali


local preg not_a_good_mother hurting_baby_l no_time_for_self regretted_being_pregnant marternity_cloths_appealed happy_that_your_pregnant having_several_childred_l pregnancy_unpleasant caring_for_babys_need wonder_about_babys_health lifedifficult_after_baby breastfeeding_appeali


foreach var in `preg' {
	encode `var', gen(p_`var')
}

save PMH_clean.dta, replace