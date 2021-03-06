/* Published: 12/1/2016 */

/**************************   COMMENTS   *******************************/
/* THIS INPUT STATMENT IS FOR THE 2016 SEER-MEDICARE LINKAGE.          */
/***********************************************************************/
/*                                                                     */
/* For cancer files, Patient Identifier is @01 REGCASE $char10.        */
/* For non-cancer files, Patient Identifier is @01 HICBIC $char11.     */
/*                                                                     */
/***********************************************************************/

/***********************************************************************/
/* If you are using PC SAS to read in these files you will have to     */
/* un-zip the files first and use the un-zipped filename statement,    */
/* rather than using the zipped files and statement.                   */
/***********************************************************************/

filename ccflagin  'S:/Raw files unzipped/CCflag99.txt';                   /*reading in an un-zipped file*/
*filename ccflagin pipe 'gunzip -c /directory/CCflag14.txt.gz';  /*reading in a zipped file*/
*filename ccflagin pipe 'gunzip -c /directory/CCflag*.txt.gz';   /*using wildcard to match multiple files */

options nocenter validvarname=upcase;

data ccflag;
  infile ccflagin lrecl=287 missover pad;
  input
    @001  patient_id    $char11. /* Patient ID (for either Cancer or Non-Cancer Patients) */
 /* @001  regcase       $char10. */  /* ID for Cancer Patients */
 /* @001  HICBIC        $char11. */  /* ID for Non Cancer Patients */
    @012  BENE_ENROLLMT_REF_YR          4.
    @016  ALZH                          1.
    @017  ALZH_EVER                     YYMMDD8.
    @025  ALZH_MID                      1.
    @026  ALZH_DEMEN                    1.
    @027  ALZH_DEMEN_EVER               YYMMDD8.
    @035  ALZH_DEMEN_MID                1.
    @036  AMI                           1.
    @037  AMI_EVER                      YYMMDD8.
    @045  AMI_MID                       1.
    @046  ANEMIA                        1.
    @047  ANEMIA_EVER                   YYMMDD8.
    @055  ANEMIA_MID                    1.
    @056  ASTHMA                        1.
    @057  ASTHMA_EVER                   YYMMDD8.
    @065  ASTHMA_MID                    1.
    @066  ATRIAL_FIB                    1.
    @067  ATRIAL_FIB_EVER               YYMMDD8.
    @075  ATRIAL_FIB_MID                1.
    @076  CANCER_BREAST                 1.
    @077  CANCER_BREAST_EVER            YYMMDD8.
    @085  CANCER_BREAST_MID             1.
    @086  CANCER_COLORECTAL             1.
    @087  CANCER_COLORECTAL_EVER        YYMMDD8.
    @095  CANCER_COLORECTAL_MID         1.
    @096  CANCER_ENDOMETRIAL            1.
    @097  CANCER_ENDOMETRIAL_EVER       YYMMDD8.
    @105  CANCER_ENDOMETRIAL_MID        1.
    @106  CANCER_LUNG                   1.
    @107  CANCER_LUNG_EVER              YYMMDD8.
    @115  CANCER_LUNG_MID               1.
    @116  CANCER_PROSTATE               1.
    @117  CANCER_PROSTATE_EVER          YYMMDD8.
    @125  CANCER_PROSTATE_MID           1.
    @126  CATARACT                      1.
    @127  CATARACT_EVER                 YYMMDD8.
    @135  CATARACT_MID                  1.
    @136  CHF                           1.
    @137  CHF_EVER                      YYMMDD8.
    @145  CHF_MID                       1.
    @146  CHRONICKIDNEY                 1.
    @147  CHRONICKIDNEY_EVER            YYMMDD8.
    @155  CHRONICKIDNEY_MID             1.
    @156  COPD                          1.
    @157  COPD_EVER                     YYMMDD8.
    @165  COPD_MID                      1.
    @166  DEPRESSION                    1.
    @167  DEPRESSION_EVER               YYMMDD8.
    @175  DEPRESSION_MID                1.
    @176  DIABETES                      1.
    @177  DIABETES_EVER                 YYMMDD8.
    @185  DIABETES_MID                  1.
    @186  GLAUCOMA                      1.
    @187  GLAUCOMA_EVER                 YYMMDD8.
    @195  GLAUCOMA_MID                  1.
    @196  HIP_FRACTURE                  1.
    @197  HIP_FRACTURE_EVER             YYMMDD8.
    @205  HIP_FRACTURE_MID              1.
    @206  HYPERL                        1.
    @207  HYPERL_EVER                   YYMMDD8.
    @215  HYPERL_MID                    1.
    @216  HYPERP                        1.
    @217  HYPERP_EVER                   YYMMDD8.
    @225  HYPERP_MID                    1.
    @226  HYPERT                        1.
    @227  HYPERT_EVER                   YYMMDD8.
    @235  HYPERT_MID                    1.
    @236  HYPOTH                        1.
    @237  HYPOTH_EVER                   YYMMDD8.
    @245  HYPOTH_MID                    1.
    @246  ISCHEMICHEART                 1.
    @247  ISCHEMICHEART_EVER            YYMMDD8.
    @255  ISCHEMICHEART_MID             1.
    @256  OSTEOPOROSIS                  1.
    @257  OSTEOPOROSIS_EVER             YYMMDD8.
    @265  OSTEOPOROSIS_MID              1.
    @266  RA_OA                         1.
    @267  RA_OA_EVER                    YYMMDD8.
    @275  RA_OA_MID                     1.
    @276  STROKE_TIA                    1.
    @277  STROKE_TIA_EVER               YYMMDD8.
    @285  STROKE_TIA_MID                1.
    @286  CRNT_HIC_SW                   $CHAR1.
    ;

%macro dates(file2);

if &file2 ne . then do;
  &file2._month = month(&file2);
  &file2._day = day(&file2);
  &file2._year = year(&file2);
  end;

%mend;
%dates(ALZH_EVER);
%dates(ALZH_DEMEN_EVER);
%dates(AMI_EVER);
%dates(ANEMIA_EVER);
%dates(ASTHMA_EVER);
%dates(ATRIAL_FIB_EVER);
%dates(CANCER_BREAST_EVER);
%dates(CANCER_COLORECTAL_EVER);
%dates(CANCER_ENDOMETRIAL_EVER);
%dates(CANCER_LUNG_EVER);
%dates(CANCER_PROSTATE_EVER);
%dates(CATARACT_EVER);
%dates(CHF_EVER);
%dates(CHRONICKIDNEY_EVER);
%dates(COPD_EVER);
%dates(DEPRESSION_EVER);
%dates(DIABETES_EVER);
%dates(GLAUCOMA_EVER);
%dates(HIP_FRACTURE_EVER);

%dates(HYPERL_EVER);
%dates(HYPERP_EVER);
%dates(HYPERT_EVER);
%dates(HYPOTH_EVER);
%dates(ISCHEMICHEART_EVER);
%dates(OSTEOPOROSIS_EVER);
%dates(RA_OA_EVER);
%dates(STROKE_TIA_EVER);


  label
    patient_id          ='Patient ID'
 /* regcase             = 'SEER Registry Case Number' */
 /* HICBIC              = 'Non-Cancer Patient ID' */
    BENE_ENROLLMT_REF_YR= "Reference Year"
    AMI                 = "Acute Myocardial Infarction End-of-Year Indicator" 
    AMI_MID 	        = "Acute Myocardial Infarction Mid-Year Indicator"
    AMI_EVER_month	= "First Occurrence of Acute Myocardial Infarction - Month"
    AMI_EVER_day 	= "First Occurrence of Acute Myocardial Infarction - Day"
    AMI_EVER_year	= "First Occurrence of Acute Myocardial Infarction - Year"
    ALZH		= "Alzheimer's Disease End-of-Year Indicator"
    ALZH_MID 		= "Alzheimer's Disease Mid-Year Indicator"
    ALZH_EVER_month	= "First Occurrence of Alzheimer's Disease - Month"
    ALZH_EVER_day  	= "First Occurrence of Alzheimer's Disease - Day"
    ALZH_EVER_year  	= "First Occurrence of Alzheimer's Disease - Year"
    ALZH_DEMEN		= "Alzheimer's Disease and Related Disorders or Senile Dementia End-of-Year Indicator"
    ALZH_DEMEN_MID	= "Alzheimer's Disease and Related Disorders or Senile Dementia Mid-Year Indicator"
    ALZH_DEMEN_EVER_month= "First Occurrence of Alzheimer's Disease and Related Disorders or Senile Dementia - Month"
    ALZH_DEMEN_EVER_day	= "First Occurrence of Alzheimer's Disease and Related Disorders or Senile Dementia - Day"
    ALZH_DEMEN_EVER_year= "First Occurrence of Alzheimer's Disease and Related Disorders or Senile Dementia - Year"
    ATRIAL_FIB		= "Atrial Fibrillation End-of-Year Indicator"
    ATRIAL_FIB_MID	= "Atrial Fibrillation Mid-Year Indicator"
    ATRIAL_FIB_EVER_month= "First Occurrence of Atrial Fibrillation - Month"
    ATRIAL_FIB_EVER_day	= "First Occurrence of Atrial Fibrillation - Day"
    ATRIAL_FIB_EVER_year= "First Occurrence of Atrial Fibrillation - Year"
    CATARACT		= "Cataract End-of-Year Indicator"
    CATARACT_MID	= "Cataract Mid-Year Indicator"
    CATARACT_EVER_month	= "First Occurrence of Cataract - Month"
    CATARACT_EVER_day	= "First Occurrence of Cataract - Day"
    CATARACT_EVER_year	= "First Occurrence of Cataract - Year"
    CHRONICKIDNEY	= "Chronic Kidney Disease End-of-Year Indicator"
    CHRONICKIDNEY_MID	= "Chronic Kidney Disease Mid-Year Indicator"
    CHRONICKIDNEY_EVER_month= "First Occurrence of Chronic Kidney Disease - Month"
    CHRONICKIDNEY_EVER_day= "First Occurrence of Chronic Kidney Disease - Day"
    CHRONICKIDNEY_EVER_year= "First Occurrence of Chronic Kidney Disease - Year"
    COPD		= "Chronic Obstructive Pulmonary Disease End-of-Year Indicator"
    COPD_MID		= "Chronic Obstructive Pulmonary Disease Mid-Year Indicator"
    COPD_EVER_month	= "First Occurrence of Chronic Obstructive Pulmonary Disease - Month"
    COPD_EVER_day	= "First Occurrence of Chronic Obstructive Pulmonary Disease - Day"
    COPD_EVER_year	= "First Occurrence of Chronic Obstructive Pulmonary Disease - Year"
    CHF  		= "Heart Failure End-of-Year Indicator"
    CHF_MID		= "Heart Failure Mid-Year Indicator"
    CHF_EVER_month	= "First Occurrence of Heart Failure - Month"
    CHF_EVER_day 	= "First Occurrence of Heart Failure - Day"
    CHF_EVER_year	= "First Occurrence of Heart Failure - Year"
    DIABETES     	= "Diabetes End-of-Year Indicator"
    DIABETES_MID 	= "Diabetes Mid-Year Indicator"
    DIABETES_EVER_month	= "First Occurrence of Diabetes - Month"
    DIABETES_EVER_day	= "First Occurrence of Diabetes - Day"
    DIABETES_EVER_year  = "First Occurrence of Diabetes - Year"
    GLAUCOMA     	= "Glaucoma End-of-Year Indicator"
    GLAUCOMA_MID 	= "Glaucoma Mid-Year Indicator"
    GLAUCOMA_EVER_month = "First Occurrence of Glaucoma - Month"
    GLAUCOMA_EVER_day   = "First Occurrence of Glaucoma - Day"
    GLAUCOMA_EVER_year	= "First Occurrence of Glaucoma - Year"
    HIP_FRACTURE 	= "Hip/Pelvic Fracture End-of-Year Indicator"
    HIP_FRACTURE_MID	= "Hip/Pelvic Fracture Mid-Year Indicator"
    HIP_FRACTURE_EVER_month= "First Occurrence of Hip/Pelvic Fracture - Month"
    HIP_FRACTURE_EVER_day= "First Occurrence of Hip/Pelvic Fracture - Day"
    HIP_FRACTURE_EVER_year= "First Occurrence of Hip/Pelvic Fracture - Year"
    ISCHEMICHEART	= "Ischemic Heart Disease End-of-Year Indicator"
    ISCHEMICHEART_MID	= "Ischemic Heart Disease Mid-Year Indicator"
    ISCHEMICHEART_EVER_month= "First Occurrence of Ischemic Heart Disease - Month"
    ISCHEMICHEART_EVER_day = "First Occurrence of Ischemic Heart Disease - Day"
    ISCHEMICHEART_EVER_year= "First Occurrence of Ischemic Heart Disease - Year"
    DEPRESSION   	= "Depression End-of-Year Indicator"
    DEPRESSION_MID	= "Depression Mid-Year Indicator"
    DEPRESSION_EVER_month= "First Occurrence of Depression - Month"
    DEPRESSION_EVER_day	= "First Occurrence of Depression - Day"
    DEPRESSION_EVER_year= "First Occurrence of Depression - Year"
    OSTEOPOROSIS	= "Osteoporosis End-of-Year Indicator"
    OSTEOPOROSIS_MID	= "Osteoporosis Mid-Year Indicator"
    OSTEOPOROSIS_EVER_month= "First Occurrence of Osteoporosis - Month"
    OSTEOPOROSIS_EVER_day= "First Occurrence of Osteoporosis - Day"
    OSTEOPOROSIS_EVER_year= "First Occurrence of Osteoporosis - Year"
    RA_OA		= "Rheumatoid Arthritis / Osteoarthritis End-of-Year Indicator"
    RA_OA_MID		= "Rheumatoid Arthritis / Osteoarthritis Mid-Year Indicator"
    RA_OA_EVER_month	= "First Occurrence of Rheumatoid Arthritis / Osteoarthritis - Month"
    RA_OA_EVER_day 	= "First Occurrence of Rheumatoid Arthritis / Osteoarthritis - Day"
    RA_OA_EVER_year	= "First Occurrence of Rheumatoid Arthritis / Osteoarthritis - Year"
    STROKE_TIA		= "Stroke / Transient Ischemic Attack End-of-Year Indicator"
    STROKE_TIA_MID	= "Stroke / Transient Ischemic Attack Mid-Year Indicator"
    STROKE_TIA_EVER_month= "First Occurrence of Stroke / Transient Ischemic Attack - Month"
    STROKE_TIA_EVER_day	= "First Occurrence of Stroke / Transient Ischemic Attack - Day"
    STROKE_TIA_EVER_year= "First Occurrence of Stroke / Transient Ischemic Attack - Year"
    CANCER_BREAST	= "Breast Cancer End-of-Year Indicator"
    CANCER_BREAST_MID	= "Breast Cancer Mid-Year Indicator"
    CANCER_BREAST_EVER_month= "First Occurrence of Breast Cancer - Month"
    CANCER_BREAST_EVER_day = "First Occurrence of Breast Cancer - Day"
    CANCER_BREAST_EVER_year= "First Occurrence of Breast Cancer - Year"
    CANCER_COLORECTAL	= "Colorectal Cancer End-of-Year Indicator"
    CANCER_COLORECTAL_MID= "Colorectal Cancer Mid-Year Indicator"
    CANCER_COLORECTAL_EVER_month= "First Occurrence of Colorectal Cancer - Month"
    CANCER_COLORECTAL_EVER_day= "First Occurrence of Colorectal Cancer - Day"
    CANCER_COLORECTAL_EVER_year= "First Occurrence of Colorectal Cancer - Year"
    CANCER_PROSTATE	= "Prostate Cancer End-of-Year Indicator"
    CANCER_PROSTATE_MID	= "Prostate Cancer Mid-Year Indicator"
    CANCER_PROSTATE_EVER_month= "First Occurrence of Prostate Cancer - Month"
    CANCER_PROSTATE_EVER_day = "First Occurrence of Prostate Cancer - Day"
    CANCER_PROSTATE_EVER_year= "First Occurrence of Prostate Cancer - Year"
    CANCER_LUNG  	= "Lung Cancer End-of-Year Indicator"
    CANCER_LUNG_MID	= "Lung Cancer Mid-Year Indicator"
    CANCER_LUNG_EVER_month= "First Occurrence of Lung Cancer - Month"
    CANCER_LUNG_EVER_day= "First Occurrence of Lung Cancer - Day"
    CANCER_LUNG_EVER_year= "First Occurrence of Lung Cancer - Year"
    CANCER_ENDOMETRIAL	= "Endometrial Cancer End-of-Year Indicator"
    CANCER_ENDOMETRIAL_MID= "Endometrial Cancer Mid-Year Indicator"
    CANCER_ENDOMETRIAL_EVER_month="First Occurrence of Endometrial Cancer - Month"
    CANCER_ENDOMETRIAL_EVER_day="First Occurrence of Endometrial Cancer - Day"
    CANCER_ENDOMETRIAL_EVER_year="First Occurrence of Endometrial Cancer - Year"
    ANEMIA	        = "Anemia End Year Flag"
    ANEMIA_MID          = "Anemia Mid Year Flag"
    ANEMIA_EVER_month   = "Anemia First Ever Occurrence Date - Month"
    ANEMIA_EVER_day     = "Anemia First Ever Occurrence Date - Day"
    ANEMIA_EVER_year    = "Anemia First Ever Occurrence Date - Year"
    ASTHMA   	        = "Asthma End Year Flag"
    ASTHMA_MID          = "Asthma Mid Year Flag"
    ASTHMA_EVER_month   = "Asthma First Ever Occurrence Date - Month"
    ASTHMA_EVER_day     = "Asthma First Ever Occurrence Date - Day"
    ASTHMA_EVER_year    = "Asthma First Ever Occurrence Date - Year"
    HYPERL              = "Hyperlipidemia End Year Flag"
    HYPERL_MID          = "Hyperlipidemia Mid Year Flag"
    HYPERL_EVER_month   = "Hyperlipidemia First Ever Occurrence Date - Month"
    HYPERL_EVER_day     = "Hyperlipidemia First Ever Occurrence Date - Day"
    HYPERL_EVER_year    = "Hyperlipidemia First Ever Occurrence Date - Year"
    HYPERP              = "Benign Prostatic Hyperplasia End Year Flag"
    HYPERP_MID   	= "Benign Prostatic Hyperplasia Mid Year Flag"
    HYPERP_EVER_month   = "Benign Prostatic Hyperplasia First Ever Occurrence Date - Month"
    HYPERP_EVER_day     = "Benign Prostatic Hyperplasia First Ever Occurrence Date - Day"
    HYPERP_EVER_year    = "Benign Prostatic Hyperplasia First Ever Occurrence Date - Year"
    HYPERT       	= "Hypertension End Year Flag"
    HYPERT_MID   	= "Hypertension Mid Year Flag"
    HYPERT_EVER_month   = "Hypertension First Ever Occurrence Date - Month"
    HYPERT_EVER_day     = "Hypertension First Ever Occurrence Date - Day"
    HYPERT_EVER_year    = "Hypertension First Ever Occurrence Date - Year"
    HYPOTH       	= "Acquired Hypothyroidism End Year Flag"
    HYPOTH_MID   	= "Acquired Hypothyroidism Mid Year Flag"
    HYPOTH_EVER_month   = "Acquired Hypothyroidism First Ever Occurrence Date - Month"
    HYPOTH_EVER_day     = "Acquired Hypothyroidism First Ever Occurrence Date - Day"
    HYPOTH_EVER_year    = "Acquired Hypothyroidism First Ever Occurrence Date - Year"
    CRNT_HIC_SW         = "Current HIC Switch Indicator"
    ;

run;

proc contents data=ccflag position;
run;
