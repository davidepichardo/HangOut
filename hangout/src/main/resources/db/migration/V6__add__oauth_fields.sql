CREATE TABLE oauth_client_registration (
    oauth_provider     VARCHAR(255) NOT NULL,
    oauth_provider_id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    client_name       VARCHAR(255) NOT NULL UNIQUE,
    client_secret    VARCHAR(255) NOT NULL UNIQUE,
    scope             VARCHAR(255) NOT NULL,
    grant_types       VARCHAR(255) NOT NULL,
    redirect_uri     VARCHAR(500) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) 
 );

 CREATE TABLE oauth_tokens {
    token_id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    client_id         UUID NOT NULL,
    user_id           UUID NOT NULL,
    access_token      VARCHAR(255) NOT NULL UNIQUE,
    refresh_token     VARCHAR(255) NOT NULL UNIQUE,
    expires_at        TIMESTAMP WITH TIME ZONE NOT NULL,
    created_at        TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    FOREIGN KEY (client_id) REFERENCES oauth_client_registration(client_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
 }