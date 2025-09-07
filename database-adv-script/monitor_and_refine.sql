EXPLAIN ANALYZE
SELECT
    b.booking_id,
    b.booking_date,
    u.name AS user_name,
    p.title AS property_title
FROM
    Bookings b
    INNER JOIN Users u ON b.user_id = u.user_id
    INNER JOIN Properties p ON b.property_id = p.property_id
WHERE
    b.booking_date BETWEEN '2025-01-01' AND '2025-01-31';

EXPLAIN ANALYZE
SELECT
    property_id,
    COUNT(*) AS total_bookings
FROM
    Bookings
GROUP BY
    property_id
ORDER BY
    total_bookings DESC;

-- Implemented Changes
-- Create missing indexes
CREATE INDEX idx_bookings_user_id ON Bookings (user_id);

CREATE INDEX idx_bookings_property_id ON Bookings (property_id);

CREATE INDEX idx_booking_date ON Bookings (booking_date);

-- Testing Improvements
EXPLAIN ANALYZE
SELECT
    b.booking_id,
    b.booking_date,
    u.name AS user_name,
    p.title AS property_title
FROM
    Bookings b
    INNER JOIN Users u ON b.user_id = u.user_id
    INNER JOIN Properties p ON b.property_id = p.property_id
WHERE
    b.booking_date BETWEEN '2025-01-01' AND '2025-01-31';