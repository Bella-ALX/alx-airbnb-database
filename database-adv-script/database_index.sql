-- Indexes for Users table
CREATE INDEX idx_users_user_id ON Users(user_id);
CREATE INDEX idx_users_email ON Users(email);

-- Indexes for Bookings table
CREATE INDEX idx_bookings_user_id ON Bookings(user_id);
CREATE INDEX idx_bookings_property_id ON Bookings(property_id);
CREATE INDEX idx_bookings_booking_date ON Bookings(booking_date);

-- Indexes for Properties table
CREATE INDEX idx_properties_property_id ON Properties(property_id);
CREATE INDEX idx_properties_location ON Properties(location);
