SELECT 
  COUNTIF(ADHD_Outcome = 1) / COUNT(*) AS prob_adhd_female,
  COUNTIF(ADHD_Outcome = 1) AS adhd_count,
  COUNT(*) AS total_females
FROM `analog-delight-457401-t6.wids2025.solutions_query` 
WHERE Sex_F = 1; 