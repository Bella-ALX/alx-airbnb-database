SELECT 
    b.booking_id,
    b.booking_date,
    u.user_id,
    u.name,
    u.email
FROM 
    Bookings b
INNER JOIN 
    Users u
ON 
    b.user_id = u.user_id;


-- This query retrieves all bookings along with the corresponding user details by joining the Bookings and Users tables on user_id.


SELECT 
    p.property_id,
    p.title,
    p.location,
    r.review_id,
    r.review_text,
    r.rating
FROM 
    Properties p
LEFT JOIN 
    Reviews r
ON 
    p.property_id = r.property_id;


-- This query retrieves all properties along with their reviews (if any) by performing a LEFT JOIN between the Properties and Reviews tables on property_id.

SELECT 
    u.user_id,
    u.name,
    u.email,
    b.booking_id,
    b.booking_date,
    b.property_id
FROM 
    Users u
FULL OUTER JOIN 
    Bookings b
ON 
    u.user_id = b.user_id;

-- This query retrieves all users and their bookings, including users without bookings and bookings without users, by performing a FULL OUTER JOIN between the Users and Bookings tables on user_id.