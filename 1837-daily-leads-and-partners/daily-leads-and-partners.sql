# Write your MySQL query statement below
SELECT date_id, make_name, COUNT(DISTINCT lead_id) as unique_leads, count(DISTINCT partner_id) as unique_partners
FROM DailySales
GROUP BY 1, 2