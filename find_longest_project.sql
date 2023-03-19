SELECT
    client.name AS name,
    DATEDIFF(month, project.start_date, project.finish_date) AS month_count
FROM
    project
    JOIN client ON project.client_id = client.id
WHERE
    DATEDIFF(month, project.start_date, project.finish_date) = (
        SELECT
            MAX(DATEDIFF(month, start_date, finish_date))
        FROM
            project
    );
