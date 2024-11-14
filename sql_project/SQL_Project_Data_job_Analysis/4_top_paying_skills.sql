/*
Question: What are the top skills based on salary?

Look at the average salary associated with each skill for Data Analyst positions
Focuses on roles with specified salaries, regardless of location
Why? It reveals how different skills impact salary levels for Data Analysts and helps 
identify the most financially rewarding skills to acquire.
*/

SELECT 
    skills AS skill_name,
    ROUND(AVG(salary_year_avg),0) AS average_salary
FROM job_postings_fact
INNER JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = 'True'
GROUP BY
    skills
ORDER BY average_salary DESC
LIMIT 25

/*
1. Top Skill Pay Range: High-end salaries ($150,000+) are seen with specialized tools for 
big data (PySpark), machine learning (DataRobot, Pandas), and collaborative platforms (GitLab, Bitbucket).

2. Machine Learning and Data Processing: Skills supporting data science workflows like Jupyter, Pandas,
Scikit-learn, and Databricks offer competitive salaries, indicating demand for practical machine learning and analysis tools.

3. Cloud and Data Engineering: Tools for cloud platforms and data engineering (e.g., GCP, Airflow, Kubernetes)
command high pay, highlighting a trend towards cloud-based data solutions and automation.

4.Collaboration and Version Control: Version control and team collaboration tools (e.g., Bitbucket, GitLab) also rank highly, 
reflecting the growing emphasis on collaborative, version-controlled workflows.

5.Programming and Database Management: Skills in programming (Golang, Scala) and database management (PostgreSQL) show solid 
salaries, indicating consistent demand for core development and data handling capabilities.
*/