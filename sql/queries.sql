-- ==========================================
-- QUERIES FOR CLASH ROYALE BOT DATABASE
-- ==========================================

-- 1) List all bots ordered by creation (birth) date.
--    Here we treat service_start as the "birth" date.
SELECT
    bot_id,
    bot_name,
    universal_id,
    profession,
    service_start,
    service_end
FROM Bot
ORDER BY service_start ASC;

-- 2) Count of bots by profession/type.
SELECT
    profession,
    COUNT(*) AS bot_count
FROM Bot
GROUP BY profession
ORDER BY bot_count DESC;

-- 3) List owners and their bots ordered by service start date.
SELECT
    o.owner_id,
    COALESCE(o.company_name, CONCAT(o.first_name, ' ', o.last_name)) AS owner_name,
    b.bot_id,
    b.bot_name,
    b.profession,
    b.service_start
FROM Owner o
JOIN Bot b
    ON o.owner_id = b.owner_id
ORDER BY o.owner_id, b.service_start;

-- 4) Find developers located in a specified state (example: 'NY').
--    Change 'NY' to any other state when you run it.
SELECT
    dev_id,
    first_name,
    last_name,
    alias,
    primary_language,
    city,
    state,
    years_experience
FROM Developer
WHERE state = 'NY';

-- 5) User use history – show which users used which bots and when.
SELECT
    u.user_id,
    u.username,
    u.clash_tag,
    b.bot_id,
    b.bot_name,
    ubu.interaction_timestamp,
    ubu.interaction_type,
    ubu.notes
FROM UserBotUse ubu
JOIN User u
    ON ubu.user_id = u.user_id
JOIN Bot b
    ON ubu.bot_id = b.bot_id
ORDER BY ubu.interaction_timestamp DESC;

-- ==========================================
-- EXTRA / OPTIONAL QUERIES (for creativity)
-- ==========================================

-- 6) Top bots by number of user interactions.
SELECT
    b.bot_id,
    b.bot_name,
    COUNT(ubu.record_id) AS interaction_count
FROM Bot b
LEFT JOIN UserBotUse ubu
    ON b.bot_id = ubu.bot_id
GROUP BY b.bot_id, b.bot_name
ORDER BY interaction_count DESC;

-- 7) Average trophy level of users per bot.
SELECT
    b.bot_id,
    b.bot_name,
    AVG(u.trophy_level) AS avg_trophies
FROM UserBotUse ubu
JOIN User u
    ON ubu.user_id = u.user_id
JOIN Bot b
    ON ubu.bot_id = b.bot_id
GROUP BY b.bot_id, b.bot_name
ORDER BY avg_trophies DESC;

-- 8) Clash Royale bots by preferred_mode and target_skill_level.
SELECT
    b.bot_id,
    b.bot_name,
    crb.preferred_mode,
    crb.target_skill_level,
    crb.deck_focus
FROM ClashRoyaleBot crb
JOIN Bot b
    ON crb.bot_id = b.bot_id
ORDER BY crb.preferred_mode, crb.target_skill_level;
