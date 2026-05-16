SELECT * FROM clinical_trials_msd.patients;

-- 1. most common medical condition 
SELECT Medical_Condition, COUNT(*) AS total 
FROM patients 
GROUP BY Medical_Condition 
ORDER BY total DESC;

-- 2. Avg billing condition 
SELECT Medical_Condition, ROUND(AVG(Billing_Amount),2) AS avg_cost 
FROM patients 
GROUP BY medical_condition 
ORDER BY avg_cost DESC;

-- 3. Avg lenght of stay 
SELECT Medical_Condition,
       AVG(DATEDIFF(Discharge_Date, Date_of_Admission)) AS avg_stay 
FROM patients
GROUP BY Medical_Condition
ORDER BY avg_stay DESC;

-- 4. Emergency vs Elective 
SELECT Admission_Type, COUNT(*) AS total 
FROM patients 
GROUP BY Admission_Type;

-- 5. Top 5 most expensive patients 
SELECT Name, Medical_Condition, Billing_Amount
FROM patients 
ORDER BY Billing_Amount DESC 
LIMIT 5;

-- 6. Inssurance vs cost 
SELECT Insurance_Provider,
       ROUND(AVG(Billing_Amount),2) AS avg_cost 
FROM patients 
GROUP BY Insurance_Provider
ORDER BY avg_cost DESC;

-- 7. Test results vs condition 
SELECT medical_condition, test_results, COUNT(*) AS total_patients
FROM patients
GROUP BY medical_condition, test_results;


