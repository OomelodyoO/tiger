CREATE DATABASE IF NOT EXISTS tiger DEFAULT CHARSET utf8mb4 COLLATE UTF8MB4_GENERAL_CI;

USE tiger;

CREATE TABLE IF NOT EXISTS oauth2_registered_client
(
    id                            VARCHAR(100)                            NOT NULL,
    client_id                     VARCHAR(100)                            NOT NULL,
    client_id_issued_at           TIMESTAMP     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    client_secret                 VARCHAR(200)  DEFAULT NULL,
    client_secret_expires_at      DATETIME      DEFAULT NULL,
    client_name                   VARCHAR(200)                            NOT NULL,
    client_authentication_methods VARCHAR(1000)                           NOT NULL,
    authorization_grant_types     VARCHAR(1000)                           NOT NULL,
    redirect_uris                 VARCHAR(1000) DEFAULT NULL,
    post_logout_redirect_uris     VARCHAR(1000) DEFAULT NULL,
    scopes                        VARCHAR(1000)                           NOT NULL,
    client_settings               VARCHAR(2000)                           NOT NULL,
    token_settings                VARCHAR(2000)                           NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS oauth2_authorization_consent
(
    registered_client_id VARCHAR(100)  NOT NULL,
    principal_name       VARCHAR(200)  NOT NULL,
    authorities          VARCHAR(1000) NOT NULL,
    PRIMARY KEY (registered_client_id, principal_name)
);

CREATE TABLE IF NOT EXISTS oauth2_authorization
(
    id                            VARCHAR(100) NOT NULL,
    registered_client_id          VARCHAR(100) NOT NULL,
    principal_name                VARCHAR(200) NOT NULL,
    authorization_grant_type      VARCHAR(100) NOT NULL,
    authorized_scopes             VARCHAR(1000) DEFAULT NULL,
    attributes                    BLOB          DEFAULT NULL,
    state                         VARCHAR(500)  DEFAULT NULL,
    authorization_code_value      BLOB          DEFAULT NULL,
    authorization_code_issued_at  DATETIME      DEFAULT NULL,
    authorization_code_expires_at DATETIME      DEFAULT NULL,
    authorization_code_metadata   BLOB          DEFAULT NULL,
    access_token_value            BLOB          DEFAULT NULL,
    access_token_issued_at        DATETIME      DEFAULT NULL,
    access_token_expires_at       DATETIME      DEFAULT NULL,
    access_token_metadata         BLOB          DEFAULT NULL,
    access_token_type             VARCHAR(100)  DEFAULT NULL,
    access_token_scopes           VARCHAR(1000) DEFAULT NULL,
    oidc_id_token_value           BLOB          DEFAULT NULL,
    oidc_id_token_issued_at       DATETIME      DEFAULT NULL,
    oidc_id_token_expires_at      DATETIME      DEFAULT NULL,
    oidc_id_token_metadata        BLOB          DEFAULT NULL,
    refresh_token_value           BLOB          DEFAULT NULL,
    refresh_token_issued_at       DATETIME      DEFAULT NULL,
    refresh_token_expires_at      DATETIME      DEFAULT NULL,
    refresh_token_metadata        BLOB          DEFAULT NULL,
    user_code_value               BLOB          DEFAULT NULL,
    user_code_issued_at           DATETIME      DEFAULT NULL,
    user_code_expires_at          DATETIME      DEFAULT NULL,
    user_code_metadata            BLOB          DEFAULT NULL,
    device_code_value             BLOB          DEFAULT NULL,
    device_code_issued_at         DATETIME      DEFAULT NULL,
    device_code_expires_at        DATETIME      DEFAULT NULL,
    device_code_metadata          BLOB          DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS t_user
(
    id          VARCHAR(64) NOT NULL,
    username    VARCHAR(64) NOT NULL,
    password    VARCHAR(64) NOT NULL,
    mobile      VARCHAR(20) NOT NULL,
    status      VARCHAR(64) NOT NULL,
    create_time DATETIME    NOT NULL,
    modify_time DATETIME    NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (mobile)
);