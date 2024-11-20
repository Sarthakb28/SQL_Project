/*
Question: What are the most optimal skills to learn
(aka it's in high demand and a high-paying skill)?

Identify skills in high demand and associated with high average salaries for Data Analyst roles
Concentrates on remote positions with specified salaries
Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
offering strategic insights for career development in data analysis
*/

SELECT
    skills_dim.skill_id,
    skills_dim.skills AS Skill_name,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg),0) AS average_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim
    ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim
    ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
    job_postings_fact.salary_year_avg IS NOT NULL AND
    job_postings_fact.job_title_short = 'Data Analyst' AND
    job_postings_fact.job_work_from_home = True
GROUP BY
    skills_dim.skill_id,
    skills_dim.skills
Having COUNT(skills_job_dim.job_id) > 10
ORDER BY 
    average_salary DESC,
    demand_count DESC
LIMIT 25