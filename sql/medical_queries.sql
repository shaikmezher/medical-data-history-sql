-- =====================================================
-- Medical Data History – SQL Analysis
-- Author: Shaik Mezher Basha
-- =====================================================
-- Q1
SELECT first_name, last_name, gender
FROM patients
WHERE gender = 'M';

-- Q2
SELECT first_name, last_name
FROM patients
WHERE allergies IS NULL OR allergies = '';

-- Q3
SELECT first_name
FROM patients
WHERE first_name LIKE 'C%';

-- Q4
SELECT first_name, last_name
FROM patients
WHERE weight BETWEEN 100 AND 120;

-- Q5
UPDATE patients
SET allergies = 'NKA'
WHERE allergies IS NULL;

-- Q6
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM patients;

-- Q7
SELECT p.first_name, p.last_name, pr.province_name
FROM patients p
JOIN province_names pr
ON p.province_id = pr.province_id;

-- Q8
SELECT COUNT(*) AS total_patients
FROM patients
WHERE YEAR(birth_date) = 2010;

-- Q9
SELECT first_name, last_name, height
FROM patients
ORDER BY height DESC
LIMIT 1;

-- Q10
SELECT *
FROM patients
WHERE patient_id IN (1, 45, 534, 879, 1000);

-- Q11
SELECT COUNT(*) AS total_admissions
FROM admissions;

-- Q12
SELECT *
FROM admissions
WHERE admission_date = discharge_date;

-- Q13
SELECT COUNT(*) AS total_admissions
FROM admissions
WHERE patient_id = 579;

-- Q14
SELECT DISTINCT city
FROM patients
WHERE province_id = 'NS';

-- Q15
SELECT first_name, last_name, birth_date
FROM patients
WHERE height > 160 AND weight > 70;

-- Q16
SELECT DISTINCT YEAR(birth_date) AS birth_year
FROM patients
ORDER BY birth_year ASC;

-- Q17
SELECT first_name
FROM patients
GROUP BY first_name
HAVING COUNT(*) = 1;

-- Q18
SELECT patient_id, first_name
FROM patients
WHERE first_name LIKE 's%s'
AND LENGTH(first_name) >= 6;

-- Q19
SELECT p.patient_id, p.first_name, p.last_name
FROM patients p
JOIN admissions a
ON p.patient_id = a.patient_id
WHERE a.diagnosis = 'Dementia';

-- Q20
SELECT first_name
FROM patients
ORDER BY LENGTH(first_name), first_name;

-- Q21
SELECT
SUM(CASE WHEN gender = 'M' THEN 1 ELSE 0 END) AS male_count,
SUM(CASE WHEN gender = 'F' THEN 1 ELSE 0 END) AS female_count
FROM patients;

-- Q23
SELECT patient_id, diagnosis
FROM admissions
GROUP BY patient_id, diagnosis
HAVING COUNT(*) > 1;

-- Q24
SELECT city, COUNT(*) AS total_patients
FROM patients
GROUP BY city
ORDER BY total_patients DESC, city ASC;

-- Q25
SELECT first_name, last_name, 'Patient' AS role FROM patients
UNION
SELECT first_name, last_name, 'Doctor' AS role FROM doctors;

-- Q26
SELECT allergies, COUNT(*) AS total_cases
FROM patients
WHERE allergies IS NOT NULL
GROUP BY allergies
ORDER BY total_cases DESC;

-- Q27
SELECT first_name, last_name, birth_date
FROM patients
WHERE birth_date BETWEEN '1970-01-01' AND '1979-12-31'
ORDER BY birth_date ASC;

-- Q28
SELECT CONCAT(UPPER(last_name), ',', LOWER(first_name)) AS full_name
FROM patients
ORDER BY first_name DESC;

-- Q29
SELECT province_id, SUM(height) AS sum_of_height
FROM patients
GROUP BY province_id
HAVING SUM(height) >= 7000;

-- Q30
SELECT MAX(weight) - MIN(weight) AS weight_difference
FROM patients
WHERE LOWER(last_name) = 'maroni';

-- Q31
SELECT DAY(admission_date) AS day_of_month,
COUNT(*) AS total_admissions
FROM admissions
GROUP BY day_of_month
ORDER BY total_admissions DESC;

-- Q32
SELECT FLOOR(weight / 10) * 10 AS weight_group,
COUNT(*) AS total_patients
FROM patients
GROUP BY weight_group
ORDER BY weight_group DESC;

-- Q33
SELECT patient_id, weight, height,
CASE
WHEN weight / POWER(height / 100.0, 2) >= 30 THEN 1
ELSE 0
END AS isObese
FROM patients;

-- Q34
SELECT p.patient_id, p.first_name, p.last_name, d.specialty
FROM patients p
JOIN admissions a ON p.patient_id = a.patient_id
JOIN doctors d ON a.attending_doctor_id = d.doctor_id
WHERE a.diagnosis = 'Epilepsy'
AND d.first_name = 'Lisa';
