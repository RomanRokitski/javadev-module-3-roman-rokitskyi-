SELECT client.name, project_counts.project_count
FROM client
INNER JOIN (
  SELECT project.client_id, COUNT(*) AS project_count
  FROM project
  GROUP BY project.client_id
  HAVING COUNT(*) = (
    SELECT COUNT(*) AS max_projects
    FROM project
    GROUP BY project.client_id
    ORDER BY max_projects DESC
    LIMIT 1
  )
) AS project_counts
ON client.id = project_counts.client_id;