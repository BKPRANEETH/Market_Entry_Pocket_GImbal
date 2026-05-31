-- ============================================================
-- Vivo Market Entry — Pocket Gimbal Camera India
-- SQL Schema | Consulting Portfolio Project | BKPRANEETH
-- ============================================================

CREATE TABLE competitors (
    id                    INTEGER PRIMARY KEY AUTOINCREMENT,
    brand_name            TEXT NOT NULL,
    product_name          TEXT,
    revenue_usd_m         DECIMAL(10,2),    -- Annual revenue estimate $M
    revenue_growth_pct    DECIMAL(5,2),     -- YoY revenue growth %
    market_share_pct      DECIMAL(5,2),     -- India market share %
    customer_base_m       DECIMAL(6,2),     -- Global customer base (millions)
    india_price_inr       INTEGER,          -- India retail price ₹
    global_price_usd      INTEGER,          -- Global price USD
    csat_score            DECIMAL(3,1),     -- Customer satisfaction /10
    web_traffic_m         DECIMAL(6,2),     -- Monthly web visits (millions)
    social_engagement_pct DECIMAL(5,2),     -- Social media engagement %
    portfolio_size        INTEGER,          -- Number of SKUs in portfolio
    geo_presence          TEXT,             -- Geographic footprint
    competitive_advantage TEXT,             -- Key moat
    target_segment        TEXT,             -- Primary customer segment
    gross_margin_pct      DECIMAL(5,2),     -- Estimated gross margin %
    accessories_margin_pct DECIMAL(5,2),   -- Accessories margin %
    swot_rating           DECIMAL(3,1),     -- Overall SWOT score /10
    created_at            TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE market_sizing (
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    year        INTEGER NOT NULL,
    market_type TEXT NOT NULL,    -- 'TAM', 'SAM', 'SOM'
    value_usd_m DECIMAL(10,2),
    notes       TEXT
);

CREATE TABLE products (
    id             INTEGER PRIMARY KEY AUTOINCREMENT,
    competitor_id  INTEGER REFERENCES competitors(id),
    product_name   TEXT NOT NULL,
    india_price    INTEGER,
    launch_year    INTEGER,
    sensor_size    TEXT,
    stabilisation  TEXT,
    has_built_in_mic INTEGER DEFAULT 0,  -- 1 = yes, 0 = no
    max_resolution TEXT,
    segment        TEXT
);

CREATE TABLE india_market_growth (
    year              INTEGER PRIMARY KEY,
    market_size_usd_m DECIMAL(8,2),
    yoy_growth_pct    DECIMAL(5,2),
    creator_base_m    DECIMAL(6,2),
    notes             TEXT
);
