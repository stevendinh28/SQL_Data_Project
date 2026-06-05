/*
Question: What are the most optimal skills to learn (aka it's in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial reward (high salaries),
    offering strategic insights for career development in data analytics
*/

WITH company_job_count AS ( 
    SELECT
            company_id,
            COUNT(*) AS total_jobs
    FROM
            job_postings_fact
    GROUP BY
            company_id
)
SELECT 
    company_dim.name AS company_name,
    company_job_count.total_jobs
FROM company_dim
LEFT JOIN company_job_count ON company_job_count.company_id = company_dim.company_id
ORDER BY
    total_jobs DESC