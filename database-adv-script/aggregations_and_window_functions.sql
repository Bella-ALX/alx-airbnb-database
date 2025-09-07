SELECT
    u.user_id,
    u.name,
    COUNT(b.booking_id) AS total_bookings
FROM
    Users u
    LEFT JOIN Bookings b ON u.user_id = b.user_id
GROUP BY
    u.user_id,
    u.name
ORDER BY
    total_bookings DESC;

-- This query retrieves the total number of bookings made by each user by joining the Users and Bookings tables, grouping by user_id and name, and ordering the results by total bookings in descending order.
SELECT
    p.property_id,
    p.title,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (
        ORDER BY
            COUNT(b.booking_id) DESC
    ) AS booking_rank
FROM
    Properties p
    LEFT JOIN Bookings b ON p.property_id = b.property_id
GROUP BY
    p.property_id,
    p.title
ORDER BY
    booking_rank;


-- This query retrieves the total number of bookings for each property along with a rank based on the number of bookings by joining the Properties and Bookings tables, grouping by property_id and title, and ordering the results by booking rank.