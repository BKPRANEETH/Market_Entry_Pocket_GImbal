-- ============================================================
-- Seed Data — Competitors & Market Data
-- Source: TechRadar, MarketsandMarkets, IAMAI, analyst est.
-- ============================================================

INSERT INTO competitors (brand_name, product_name, revenue_usd_m, revenue_growth_pct, market_share_pct,
  customer_base_m, india_price_inr, global_price_usd, csat_score, web_traffic_m,
  social_engagement_pct, portfolio_size, geo_presence, competitive_advantage,
  target_segment, gross_margin_pct, accessories_margin_pct, swot_rating) VALUES

('DJI', 'Osmo Pocket 4', 4200, 18.0, 55.0, 12.5, 45999, 499,
 8.7, 45.0, 4.2, 28, 'Global (150+ countries)',
 'First-mover advantage; superior gimbal stabilisation; DJI Mic ecosystem',
 'Pro & semi-pro creators, travel vloggers', 38.0, 55.0, 9.0),

('Insta360', 'Luna', 980, 34.0, 22.0, 5.8, 39999, 430,
 8.4, 22.0, 5.1, 18, 'Global (120+ countries)',
 '70% market share in 360-cam; dual-lens innovation; strong software AI',
 'Creative/adventure creators, 360 content', 37.0, 50.0, 8.0),

('GoPro', 'HERO 13', 1100, -8.0, 12.0, 8.2, 32999, 399,
 7.6, 30.0, 3.8, 12, 'Global (100+ countries)',
 'Strong brand in action/sports; rugged waterproof design; GoPro+ subscription',
 'Sports & adventure creators', 35.0, 45.0, 5.0),

('Sony', 'ZV-E10 II', 680, 9.0, 6.0, 3.1, 72000, 750,
 8.9, 18.0, 2.9, 35, 'Global (90+ countries)',
 'Best-in-class sensor technology; mirrorless ecosystem; trusted India brand',
 'Prosumer & professional YouTube creators', 40.0, 42.0, 7.0),

('AKASO', 'Budget Range', 85, 12.0, 3.0, 2.4, 7499, 80,
 6.1, 3.5, 1.5, 8, 'India, SEA, US (online only)',
 'Ultra-low price point; Amazon/Flipkart distribution; first-time buyer appeal',
 'Entry-level / first-time buyers', 28.0, 30.0, 3.0),

('Vivo', 'Pocket Cam (Proposed)', 0, NULL, 0.0, 0.0, 22999, 270,
 NULL, 8.5, 3.2, 1, 'India (initially)',
 'Strong India brand equity; 30K+ retail stores; competitive sub-₹25K pricing',
 'Budget-conscious Indian creators, students, micro-influencers', 35.0, 45.0, 6.0);

-- Market sizing data
INSERT INTO market_sizing (year, market_type, value_usd_m, notes) VALUES
(2026, 'TAM', 340.0, 'Total India creator gear market — all video/camera gear'),
(2026, 'SAM', 84.0,  'Pocket gimbal + action cam segment, sub-₹50K price band'),
(2026, 'SOM', 8.0,   'Vivo realistic Year 1 capture at 10% of SAM');

-- Market growth trajectory
INSERT INTO india_market_growth (year, market_size_usd_m, yoy_growth_pct, creator_base_m, notes) VALUES
(2024, 52.0, NULL, 2.8, 'Actual — base year'),
(2025, 60.0, 15.4, 3.5, 'Actual — DJI Osmo Pocket 3 peak'),
(2026, 69.0, 15.0, 4.3, 'Estimated — DJI Pocket 4 + Insta360 Luna launches'),
(2027, 79.0, 14.5, 5.2, 'Estimated — new entrants expected inc. Vivo'),
(2028, 91.0, 15.2, 6.3, 'Estimated — creator economy maturity phase');

-- Products table
INSERT INTO products (competitor_id, product_name, india_price, launch_year, sensor_size,
  stabilisation, has_built_in_mic, max_resolution, segment) VALUES
(1, 'DJI Osmo Pocket 4',           45999, 2026, '1-inch CMOS', '3-axis gimbal', 1, '4K/240fps', 'Premium'),
(1, 'DJI Osmo Pocket 4 Creator',   64999, 2026, '1-inch CMOS', '3-axis gimbal', 1, '4K/240fps', 'Premium Bundle'),
(2, 'Insta360 Luna',               39999, 2026, '1/1.3-inch', '3-axis gimbal', 1, '4K/120fps', 'Premium'),
(2, 'Insta360 Luna Ultra',         69999, 2026, '1-inch',     '3-axis gimbal', 1, '8K/30fps',  'Ultra Premium'),
(3, 'GoPro HERO 13',               32999, 2025, '1/1.9-inch', 'HyperSmooth EIS', 1, '5.3K/60fps', 'Mid-Premium'),
(4, 'Sony ZV-E10 II',              72000, 2025, 'APS-C',      'IBIS+OIS',      1, '4K/120fps', 'Prosumer'),
(5, 'AKASO Brave 8',                7499, 2024, '1/2-inch',   'EIS only',      1, '4K/60fps',  'Budget'),
(6, 'Vivo Pocket Cam (Concept)',   22999, 2027, '1/1.5-inch', '3-axis gimbal', 1, '4K/60fps',  'Budget-Premium');
