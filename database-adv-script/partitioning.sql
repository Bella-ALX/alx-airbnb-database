-- Step 1: Create the main partitioned table
CREATE TABLE
    Bookings_Partitioned (
        booking_id SERIAL PRIMARY KEY,
        user_id INT NOT NULL,
        property_id INT NOT NULL,
        booking_date DATE NOT NULL,
        payment_id INT,
        -- other columns...
        CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES Users (user_id),
        CONSTRAINT fk_property FOREIGN KEY (property_id) REFERENCES Properties (property_id),
        CONSTRAINT fk_payment FOREIGN KEY (payment_id) REFERENCES Payments (payment_id)
    )
PARTITION BY
    RANGE (booking_date);

-- Step 2: Create partitions by year (example: 2025 and 2026)
CREATE TABLE
    Bookings_2025 PARTITION OF Bookings_Partitioned FOR
VALUES
FROM
    ('2025-01-01') TO ('2026-01-01');

CREATE TABLE
    Bookings_2026 PARTITION OF Bookings_Partitioned FOR
VALUES
FROM
    ('2026-01-01') TO ('2027-01-01');

-- Insert data into the partitioned table
INSERT INTO
    Bookings_Partitioned (user_id, property_id, booking_date, payment_id)
SELECT
    user_id,
    property_id,
    booking_date,
    payment_id
FROM
    Bookings;

-- Test Performance
EXPLAIN ANALYZE
SELECT
    *
FROM
    Bookings_Partitioned
WHERE
    booking_date BETWEEN '2025-03-01' AND '2025-03-31';