CREATE TABLE user_interests (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id     UUID NOT NULL,
    interest_id UUID NOT NULL,
    created_at  TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),

    CONSTRAINT fk_user_interests_user_id FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
    CONSTRAINT fk_user_interests_interest_id FOREIGN KEY (interest_id) REFERENCES interests (id) ON DELETE CASCADE,
    CONSTRAINT uq_user_interest UNIQUE (user_id, interest_id)
);
