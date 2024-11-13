SELECT
    f.job_id,
    f.job_title,
    d.name AS Company_name,
    f.job_location,
    f.job_schedule_type,
    f.salary_year_avg,
    f.job_posted_date
FROM 
    job_postings_fact AS f
LEFT JOIN company_dim AS d
    ON f.company_id = d.company_id
WHERE 
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND 
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;