-- ===============================
-- DEVELOPERS
-- ===============================
CREATE TABLE DEVELOPER (
    dev_id INT AUTO_INCREMENT PRIMARY KEY,
    last_name VARCHAR(50) NOT NULL,
    first_name VARCHAR(50),
    alias VARCHAR(50),
    primary_language VARCHAR(50),
    years_experience INT,
    city VARCHAR(50),
    state VARCHAR(10),
    favorite_framework VARCHAR(50)
);

-- ===============================
-- CODEBASES
-- ===============================
CREATE TABLE CODEBASE (
    codebase_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    latest_version VARCHAR(20),
    initial_release_date DATE,
    language VARCHAR(50),
    status ENUM('active','deprecated') DEFAULT 'active',
    developer_id INT NOT NULL,
    repo_url VARCHAR(255),
    CONSTRAINT fk_codebase_dev
        FOREIGN KEY (developer_id) REFERENCES DEVELOPER(dev_id)
);

-- ===============================
-- CODEBASE HISTORY
-- ===============================
CREATE TABLE CODEBASE_HISTORY (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    codebase_id INT NOT NULL,
    version VARCHAR(20) NOT NULL,
    release_date DATE,
    language VARCHAR(50),
    status ENUM('active','deprecated') DEFAULT 'active',
    change_summary VARCHAR(255),
    CONSTRAINT fk_history_codebase
        FOREIGN KEY (codebase_id) REFERENCES CODEBASE(codebase_id)
);

-- ===============================
-- OWNERS / CLIENTS
-- ===============================
CREATE TABLE OWNER (
    owner_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    company_name VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(100),
    years_in_business INT,
    region VARCHAR(50),
    UNIQUE (email)
);

-- ===============================
-- BOT SUPERTYPE
-- ===============================
CREATE TABLE BOT (
    bot_id INT AUTO_INCREMENT PRIMARY KEY,
    bot_name VARCHAR(100) NOT NULL,
    universal_id VARCHAR(36) NOT NULL,
    codebase_id INT NOT NULL,
    dataset_name VARCHAR(100),
    profession VARCHAR(50),
    service_start DATE,
    service_end DATE,
    owner_id INT NOT NULL,
    avg_response_ms INT,
    CONSTRAINT uq_universal_id UNIQUE (universal_id),
    CONSTRAINT fk_bot_codebase
        FOREIGN KEY (codebase_id) REFERENCES CODEBASE(codebase_id),
    CONSTRAINT fk_bot_owner
        FOREIGN KEY (owner_id) REFERENCES OWNER(owner_id)
);

-- ===============================
-- CLASH ROYALE BOT SUBTYPE
-- ===============================
CREATE TABLE CLASH_ROYALE_BOT (
    bot_id INT PRIMARY KEY,
    preferred_mode ENUM('1v1','2v2','challenge','tournament'),
    target_skill_level ENUM('casual','mid','pro'),
    deck_focus ENUM('beatdown','cycle','control','siege','spell-bait','hybrid'),
    favorite_arenas VARCHAR(100),
    CONSTRAINT fk_clash_bot
        FOREIGN KEY (bot_id) REFERENCES BOT(bot_id)
            ON DELETE CASCADE
);

-- ===============================
-- USERS / PLAYERS
-- ===============================
CREATE TABLE USER (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    clash_tag VARCHAR(20),
    trophy_level INT,
    clan_name VARCHAR(100),
    favorite_card VARCHAR(50),
    region VARCHAR(50),
    account_age_years INT,
    UNIQUE (username)
);

-- ===============================
-- USER ↔ BOT USE HISTORY (M:N)
-- ===============================
CREATE TABLE USER_BOT_USE (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    bot_id INT NOT NULL,
    interaction_timestamp DATETIME NOT NULL,
    interaction_type VARCHAR(50),
    notes VARCHAR(255),
    CONSTRAINT fk_use_user
        FOREIGN KEY (user_id) REFERENCES USER(user_id),
    CONSTRAINT fk_use_bot
        FOREIGN KEY (bot_id) REFERENCES BOT(bot_id)
);
