CREATE TABLE user_location (
    id        UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id   UUID NOT NULL UNIQUE,
    city      VARCHAR(100) NOT NULL,
    state     VARCHAR(100) NOT NULL,
    country   VARCHAR(100) NOT NULL,
    address   VARCHAR(255),
    latitude  DECIMAL(9, 6),
    longitude DECIMAL(9, 6),
    zip_code  VARCHAR(20),

    CONSTRAINT fk_user_location_user_id FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);
