SELECT
    b.booking_id,
    b.booking_date,
    u.user_id,
    u.name,
    u.email,
    p.property_id,
    p.title,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.status
FROM
    Bookings b
    INNER JOIN Users u ON b.user_id = u.user_id
    INNER JOIN Properties p ON b.property_id = p.property_id
    INNER JOIN Payments pay ON b.payment_id = pay.payment_id;

-- This query retrieves all bookings along with the corresponding user details, property details, and payment information by joining the Bookings, Users, Properties, and Payments tables on their respective foreign keys.
EXPLAIN ANALYZE
SELECT
    b.booking_id,
    b.booking_date,
    u.user_id,
    u.name,
    u.email,
    p.property_id,
    p.title,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.status
FROM
    Bookings b
    INNER JOIN Users u ON b.user_id = u.user_id
    INNER JOIN Properties p ON b.property_id = p.property_id
    INNER JOIN Payments pay ON b.payment_id = pay.payment_id;

-- Optimized query
SELECT
    b.booking_id,
    b.booking_date,
    u.user_id,
    u.name,
    u.email,
    p.property_id,
    p.title,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.status
FROM
    Bookings b
    INNER JOIN Users u ON b.user_id = u.user_id
    INNER JOIN Properties p ON b.property_id = p.property_id
    LEFT JOIN Payments pay ON b.payment_id = pay.payment_id;


-- Additional Optimizations
CREATE INDEX idx_bookings_user_id ON Bookings(user_id);
CREATE INDEX idx_bookings_property_id ON Bookings(property_id);
CREATE INDEX idx_bookings_payment_id ON Bookings(payment_id);
CREATE INDEX idx_users_user_id ON Users(user_id);
CREATE INDEX idx_properties_property_id ON Properties(property_id);
CREATE INDEX idx_payments_payment_id ON Payments(payment_id);