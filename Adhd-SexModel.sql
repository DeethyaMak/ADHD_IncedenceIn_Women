CREATE OR REPLACE MODEL `analog-delight-457401-t6.wids2025.adhdSex_model`
OPTIONS(
  model_type = 'logistic_reg',
  input_label_cols = ['Sex_F']
) AS
SELECT
  -- Add your actual feature columns here
  f.participant_id,
  f.ColorVision_CV_Score,
  f.MRI_Track_Age_at_Scan,
  f.SDQ_SDQ_Prosocial,
  f.SDQ_SDQ_Internalizing,
  f.SDQ_SDQ_Emotional_Problems,
  f.SDQ_SDQ_Peer_Problems,
  f.SDQ_SDQ_Hyperactivity,
  f.SDQ_SDQ_Externalizing,
  f.SDQ_SDQ_Generating_Impact,
  
  -- Label
  s.Sex_F
FROM `analog-delight-457401-t6.wids2025.train_qant_meta`AS f
JOIN `analog-delight-457401-t6.wids2025.solutions_query` AS s
  ON f.participant_id = s.participant_id
WHERE s.Sex_F IS NOT NULL;
