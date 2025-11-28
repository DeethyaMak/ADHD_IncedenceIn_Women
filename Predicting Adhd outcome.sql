SELECT
  p.participant_id,
  p.predicted_ADHD_Outcome AS predicted_adhd,

FROM
  ML.PREDICT(MODEL`analog-delight-457401-t6.wids2025.adhd_model`, (
    SELECT
     ColorVision_CV_Score,
     MRI_Track_Age_at_Scan,
     SDQ_SDQ_Prosocial,
     SDQ_SDQ_Internalizing,
     SDQ_SDQ_Emotional_Problems,
     SDQ_SDQ_Peer_Problems,
     SDQ_SDQ_Hyperactivity,
     SDQ_SDQ_Externalizing,
     SDQ_SDQ_Generating_Impact,
     participant_id,



    FROM `analog-delight-457401-t6.wids2025.train_qant_meta`
  )) AS p
JOIN `analog-delight-457401-t6.wids2025.train_qant_meta` AS f
  ON p.participant_id = f.participant_id;
