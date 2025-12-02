-- ==========================================
-- SAMPLE DATA FOR CLASH ROYALE BOT PROJECT
-- Run AFTER create_tables.sql
-- ==========================================

-- DEVELOPERS
INSERT INTO Developer
    (last_name, first_name, alias, primary_language, years_experience, city, state, favorite_framework)
VALUES
    ('Rivera',  'Alex',   'DeckWizard',   'Python', 5, 'New York',      'NY', 'FastAPI'),
    ('Chen',    'Lena',   'LogMaster',    'Java',   7, 'San Francisco', 'CA', 'Spring'),
    ('Patel',   'Ravi',   'ElixirKing',   'Elixir', 4, 'Chicago',       'IL', 'Phoenix'),
    ('Garcia',  'Mara',   'CRStats',      'TypeScript', 6, 'Austin',   'TX', 'NestJS'),
    ('Kim',     'Jin',    'ArenaAI',      'Go',     3, 'Seattle',       'WA', 'Gin'),
    ('Smith',   'Jordan', 'WinRatePro',   'Python', 2, 'Boston',        'MA', 'Django'),
    ('Lopez',   'Diego',  'TowerGuard',   'Rust',   5, 'Miami',         'FL', 'Rocket'),
    ('Nguyen',  'Thu',    'CycleSensei',  'C++',    8, 'Houston',       'TX', 'Qt'),
    ('Brown',   'Taylor', 'MetaMiner',    'Java',   1, 'Denver',        'CO', 'Spring'),
    ('Hassan',  'Omar',   'CardOracle',   'Python', 9, 'Atlanta',       'GA', 'Flask');

-- CODEBASES
INSERT INTO Codebase
    (name, latest_version, initial_release_date, language, status, developer_id, repo_url)
VALUES
    ('DeckAdvisorCore',       '1.4.0', '2023-01-15', 'Python',     'active',      1, 'https://github.com/zc/deck-advisor-core'),
    ('MatchPredictorEngine',  '2.1.0', '2022-10-10', 'Java',       'active',      2, 'https://github.com/zc/match-predictor'),
    ('TrainingScheduler',     '1.0.3', '2023-03-05', 'TypeScript', 'active',      4, 'https://github.com/zc/training-scheduler'),
    ('WinRateAnalyzer',       '0.9.8', '2021-08-22', 'Python',     'deprecated',  6, 'https://github.com/zc/winrate-analyzer'),
    ('OpponentScout',         '1.2.5', '2022-05-30', 'Go',         'active',      5, 'https://github.com/zc/opponent-scout'),
    ('CardSynergyEngine',     '3.0.0', '2020-11-11', 'Rust',       'active',      7, 'https://github.com/zc/card-synergy'),
    ('MetaTrackerCore',       '2.5.1', '2021-02-14', 'Python',     'active',      10,'https://github.com/zc/meta-tracker'),
    ('ClanSupportSuite',      '1.3.2', '2023-06-01', 'Java',       'active',      2, 'https://github.com/zc/clan-support'),
    ('ArenaProgressionTool',  '0.8.4', '2020-09-09', 'C++',        'deprecated',  8, 'https://github.com/zc/arena-progression'),
    ('ReplayAnalyzer',        '1.1.0', '2024-02-20', 'Python',     'active',      1, 'https://github.com/zc/replay-analyzer');

-- CODEBASE HISTORY
INSERT INTO CodebaseHistory
    (codebase_id, version, release_date, language, status, change_summary)
VALUES
    (1, '1.0.0', '2023-01-15', 'Python', 'active',     'Initial deck advisor release'),
    (1, '1.2.0', '2023-05-10', 'Python', 'active',     'Added matchup scoring'),
    (1, '1.4.0', '2023-09-01', 'Python', 'active',     'Improved cycle detection'),
    (2, '1.0.0', '2022-10-10', 'Java',   'active',     'Base match prediction model'),
    (2, '2.0.0', '2023-03-18', 'Java',   'active',     'New neural net engine'),
    (2, '2.1.0', '2023-11-05', 'Java',   'active',     'Performance optimizations'),
    (4, '0.8.0', '2021-08-22', 'Python', 'active',     'Beta winrate analytics'),
    (4, '0.9.8', '2022-01-05', 'Python', 'deprecated', 'Deprecated in favor of MetaTrackerCore'),
    (7, '2.0.0', '2021-02-14', 'Python', 'active',     'Meta tracking dashboard'),
    (7, '2.5.1', '2022-04-09', 'Python', 'active',     'Added global top-200 ladder feeds');

-- OWNERS (CLIENTS)
INSERT INTO Owner
    (first_name, last_name, company_name, phone, email, years_in_business, region)
VALUES
    ('Liam',    'Hart',   'Blue Tower Esports',      '555-101-0001', 'liam@bluetower.gg', 4, 'North America'),
    ('Sofia',   'Martins','CR Academy',             '555-202-0002', 'sofia@cracademy.pro', 3, 'Europe'),
    ('Noah',    'Lee',    'RoyalStreamers',         '555-303-0003', 'noah@royalstreamers.tv', 5, 'Asia'),
    ('Emma',    'Jones',  'Arena Coaching Group',   '555-404-0004', 'emma@arenacoaching.com', 6, 'North America'),
    ('Marco',   'Rossi',  'Clan Italia Elite',      '555-505-0005', 'marco@cie-clan.it', 2, 'Europe'),
    ('Aya',     'Tanaka', 'Tokyo Ladder Pros',      '555-606-0006', 'aya@tokyoladder.jp', 3, 'Asia'),
    ('Carlos',  'Diaz',   'Hispanic Royale',        '555-707-0007', 'carlos@hispanicroyale.mx', 7, 'Latin America'),
    ('Eva',     'Meyer',  'DACH Royale Tactics',    '555-808-0008', 'eva@dachroyale.de', 4, 'Europe'),
    ('Jack',    'Wilson', 'Top 500 Coaching',       '555-909-0009', 'jack@top500coach.com', 8, 'North America'),
    ('Mia',     'Khan',   'Global Ladder Insights', '555-111-2222', 'mia@ladderinsights.net', 1, 'Global');

-- BOTS (SUPERTYPE)
INSERT INTO Bot
    (bot_name, universal_id, codebase_id, dataset_name, profession, service_start, service_end, owner_id, avg_response_ms)
VALUES
    ('Meta Deck Advisor',       'CR-BOT-001', 1, 'ladder_meta_2024',     'ClashRoyaleAssistant', '2024-01-01', NULL, 1, 120),
    ('Match Win Predictor',     'CR-BOT-002', 2, 'tournament_matches',   'ClashRoyaleAssistant', '2023-06-15', NULL, 2, 180),
    ('Training Session Planner','CR-BOT-003', 3, 'player_training_logs', 'ClashRoyaleAssistant', '2023-09-10', NULL, 4, 150),
    ('Legacy Winrate Analyzer', 'CR-BOT-004', 4, 'legacy_ladder_2021',  'ClashRoyaleAssistant', '2021-09-01', '2023-01-01', 3, 250),
    ('Opponent Scout Pro',      'CR-BOT-005', 5, 'global_opponent_data', 'ClashRoyaleAssistant', '2022-07-20', NULL, 5, 140),
    ('Card Synergy Coach',      'CR-BOT-006', 6, 'card_synergy_lab',    'ClashRoyaleAssistant', '2020-12-01', NULL, 6, 160),
    ('Meta Tracker Live',       'CR-BOT-007', 7, 'live_meta_feed',      'ClashRoyaleAssistant', '2021-03-01', NULL, 8, 130),
    ('Clan Support Assistant',  'CR-BOT-008', 8, 'clan_activity_logs',  'ClashRoyaleAssistant', '2023-07-01', NULL, 7, 190),
    ('Arena Progress Guide',    'CR-BOT-009', 9, 'arena_progress_data', 'ClashRoyaleAssistant', '2020-10-10', '2022-12-31', 9, 210),
    ('Replay Breakdown Bot',    'CR-BOT-010',10, 'high_level_replays',  'ClashRoyaleAssistant', '2024-03-01', NULL, 10, 175);

-- CLASH ROYALE BOT (SUBTYPE)
INSERT INTO ClashRoyaleBot
    (bot_id, preferred_mode, target_skill_level, deck_focus, favorite_arenas)
VALUES
    (1, '1v1',      'mid',  'cycle',      'Legendary Arena'),
    (2, 'tournament','pro', 'control',    'Royal Arena, Legendary Arena'),
    (3, '1v1',      'casual','beatdown',  'Hog Mountain'),
    (4, '1v1',      'mid',  'control',    'Electro Valley'),
    (5, '2v2',      'pro',  'siege',      'Spooky Town'),
    (6, 'challenge','mid',  'spell-bait', 'Serenity Peak'),
    (7, '1v1',      'pro',  'cycle',      'Champion League'),
    (8, '2v2',      'casual','beatdown',  'Frozen Peak'),
    (9, '1v1',      'casual','hybrid',    'P.E.K.K.A''s Playhouse'),
    (10,'tournament','pro', 'control',    'Global Tournament Arena');

-- USERS / PLAYERS
INSERT INTO User
    (username, clash_tag, trophy_level, clan_name, favorite_card, region, account_age_years)
VALUES
    ('CRKing21',   '#AAA111', 6400, 'Blue Tower',        'Hog Rider',       'NA', 4),
    ('LavaLoonPro','#BBB222', 7200, 'Sky Attackers',     'Lava Hound',      'EU', 5),
    ('CycleGod',   '#CCC333', 6900, 'Quick Cycle',       'Miner',           'NA', 3),
    ('SiegeMain',  '#DDD444', 6600, 'X-Bow Only',        'X-Bow',           'AS', 6),
    ('NoobSlayer', '#EEE555', 5100, 'Casual Crew',       'Valkyrie',        'NA', 2),
    ('ArenaClimber','#FFF666',4800, 'Ladder Grinders',   'Musketeer',       'LA', 1),
    ('SpellBaitOP','#GGG777', 7000, 'Bait Squad',        'Goblin Barrel',   'EU', 4),
    ('GolemPush',  '#HHH888', 6300, 'Beatdown Masters',  'Golem',           'AS', 3),
    ('IceWizard',  '#III999', 5500, 'Frozen Legends',    'Ice Wizard',      'EU', 5),
    ('RoyalGhost', '#JJJ000', 6800, 'Shadow Royale',     'Royal Ghost',     'NA', 4);

-- USER ↔ BOT USE HISTORY
INSERT INTO UserBotUse
    (user_id, bot_id, interaction_timestamp, interaction_type, notes)
VALUES
    (1, 1, '2024-09-01 18:30:00', 'deck_recommendation', 'Requested ladder deck vs splashyard'),
    (1, 7, '2024-09-02 19:10:00', 'meta_overview',       'Checked global usage stats'),
    (2, 2, '2024-09-03 20:00:00', 'match_prediction',    'CRL qualifier match'),
    (3, 1, '2024-09-04 12:45:00', 'deck_recommendation', 'Needed anti-bait deck'),
    (3, 6, '2024-09-04 13:00:00', 'synergy_analysis',    'Analyzed miner + poison combo'),
    (4, 5, '2024-09-05 09:20:00', 'opponent_scout',      'Scouted top ladder opponent'),
    (4, 10,'2024-09-05 09:45:00', 'replay_breakdown',    'Reviewed lost X-Bow game'),
    (5, 3, '2024-09-06 15:10:00', 'training_plan',       'Requested 7-day improvement plan'),
    (6, 9, '2024-09-06 16:00:00', 'progress_review',     'Arena progression suggestions'),
    (7, 6, '2024-09-07 11:25:00', 'synergy_analysis',    'Goblin Barrel + Rocket'),
    (8, 5, '2024-09-07 12:40:00', 'opponent_scout',      'Tournament opponent prep'),
    (8, 1, '2024-09-07 13:05:00', 'deck_recommendation', 'Needed anti-air deck'),
    (9, 7, '2024-09-08 17:15:00', 'meta_overview',       'Checked EU region meta'),
    (10,2, '2024-09-08 18:00:00', 'match_prediction',    'Top 100 ladder push'),
    (10,10,'2024-09-08 18:20:00', 'replay_breakdown',    'Analyzed misplays on defense');
