-- Add up migration script here
CREATE TABLE Users (
    user_id         UUID DEFAULT gen_random_uuid() NOT NULL,
    user_name       VARCHAR(35) NOT NULL,
    first_name      VARCHAR(50) NOT NULL,
    middle_name     VARCHAR(50),
    last_name       VARCHAR(50) NOT NULL,
    email           VARCHAR(128) UNIQUE NOT NULL,
    contact_number  VARCHAR(20),
    date_of_birth   DATE,
    sex             VARCHAR(10) NOT NULL,
    password_hash   VARCHAR(512) NOT NULL,
    is_active       BOOLEAN DEFAULT TRUE NOT NULL,
    created_at      TIMESTAMP WITH TIME ZONE DEFAULT now() NOT NULL,
    updated_at      TIMESTAMP WITH TIME ZONE,
    PRIMARY KEY (user_id)
);

CREATE TABLE User_metadata (
    user_id         UUID NOT NULL,
    metadata_key    VARCHAR(35) NOT NULL,
    metadata_value  VARCHAR(128) NOT NULL,
    is_active       BOOLEAN DEFAULT TRUE NOT NULL,
    created_at      TIMESTAMP WITH TIME ZONE DEFAULT now() NOT NULL,
    updated_at      TIMESTAMP WITH TIME ZONE,
    PRIMARY KEY (user_id, metadata_key)
);