/*
Question: What are the most in-demand skills for data analysts?
-Identify the top 5 in-demand skills for a data analyst.
Focus on all job postings.
Why? Retrieves the top 5 skills with the highest demand in the job market, 
providing insights into the most valuable skills for job seekers
*/

SELECT 
    skills AS skill_name,
    count(job_postings_fact.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    skills
ORDER BY demand_count DESC
LIMIT 5

/*
SQL, Excel, Python, Tableau, and Power BI are the top 5 in-demand skills for data analysts.
SQL and Python are essential for data manipulation and analysis, while Tableau and 
Power BI are crucial for data visualization and reporting. 
Excel remains a valuable tool for data cleaning and transformation. 
Mastering these skills can significantly enhance a data analyst's career prospects.
*/
