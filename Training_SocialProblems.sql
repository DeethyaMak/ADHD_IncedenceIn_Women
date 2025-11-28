CREATE OR REPLACE MODEL `analog-delight-457401-t6.wids2025.adhd_model`
OPTIONS(
  model_type = 'logistic_reg',
  input_label_cols = ['ADHD_Outcome']
) AS
SELECT
  -- Add your actual feature columns here
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
  s.ADHD_Outcome
FROM `analog-delight-457401-t6.wids2025.train_qant_meta`AS f
JOIN `analog-delight-457401-t6.wids2025.solutions_query` AS s
  ON f.participant_id = s.participant_id
WHERE s.ADHD_Outcome IS NOT NULL;
