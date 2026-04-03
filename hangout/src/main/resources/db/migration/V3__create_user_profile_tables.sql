CREATE TABLE profiles (
    id                    UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id               UUID NOT NULL UNIQUE,
    first_name            VARCHAR(100) NOT NULL,
    bio                   TEXT,
    gender                VARCHAR(50),
    distance_preference_mi INT NOT NULL DEFAULT 25,
    updated_at            TIMESTAMP WITH TIME ZONE,

    CONSTRAINT fk_profiles_user_id FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE lifestyle_habits (
    id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id       UUID NOT NULL UNIQUE,
    exercise_freq VARCHAR(50),
    has_pets      BOOLEAN,
    drinking      VARCHAR(50),
    smoking       VARCHAR(50),

    CONSTRAINT fk_lifestyle_habits_user_id FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE profile_photos (
    id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id       UUID NOT NULL,
    url           VARCHAR(500) NOT NULL,
    is_primary    BOOLEAN NOT NULL DEFAULT FALSE,
    display_order INT NOT NULL DEFAULT 0,
    uploaded_at   TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),

    CONSTRAINT fk_profile_photos_user_id FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);
