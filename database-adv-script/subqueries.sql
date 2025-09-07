SELECT
    p.property_id,
    p.title,
    p.location
FROM
    Properties p
WHERE
    p.property_id IN (
        SELECT
            r.property_id
        FROM
            Reviews r
        GROUP BY
            r.property_id
        HAVING
            AVG(r.rating) > 4.0
    );

-- This query retrieves properties that have an average review rating greater than 4.0 by using a subquery to filter property_ids from the Reviews table.
SELECT
    u.user_id,
    u.name,
    u.email
FROM
    Users u
WHERE
    (
        SELECT
            COUNT(*)
        FROM
            Bookings b
        WHERE
            b.user_id = u.user_id
    ) > 3;

-- This query retrieves users who have made more than 3 bookings by using a subquery to count bookings for each user.