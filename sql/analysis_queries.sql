-- ============================================================
-- Analysis Queries — Vivo Market Entry Study
-- Run these after schema.sql + seed_data.sql
-- ============================================================

-- ── Q1: Price ladder — who owns which segment? ────────────────
SELECT
    brand_name,
    product_name,
    india_price_inr,
    CASE
        WHEN india_price_inr < 15000 THEN 'Ultra Budget (<₹15K)'
        WHEN india_price_inr < 25000 THEN '★ VIVO TARGET ZONE (₹15K–₹25K)'
        WHEN india_price_inr < 40000 THEN 'Mid-Premium (₹25K–₹40K)'
        ELSE 'Premium (₹40K+)'
    END AS market_segment
FROM competitors
ORDER BY india_price_inr ASC;

-- ── Q2: Market share ranking in India ────────────────────────
SELECT
    brand_name,
    market_share_pct,
    RANK() OVER (ORDER BY market_share_pct DESC) AS rank_in_india,
    ROUND(market_share_pct / SUM(market_share_pct) OVER () * 100, 1) AS share_of_known_market
FROM competitors
WHERE market_share_pct > 0
ORDER BY market_share_pct DESC;

-- ── Q3: Profitability comparison ──────────────────────────────
SELECT
    brand_name,
    gross_margin_pct AS hardware_margin,
    accessories_margin_pct AS accessories_margin,
    ROUND((gross_margin_pct + accessories_margin_pct) / 2, 1) AS blended_margin,
    CASE
        WHEN gross_margin_pct >= 38 THEN 'High Margin'
        WHEN gross_margin_pct >= 33 THEN 'Medium Margin'
        ELSE 'Low Margin'
    END AS margin_tier
FROM competitors
WHERE gross_margin_pct IS NOT NULL
ORDER BY blended_margin DESC;

-- ── Q4: Customer satisfaction vs price — is premium worth it? ─
SELECT
    brand_name,
    india_price_inr,
    csat_score,
    ROUND(csat_score / (india_price_inr / 10000.0), 3) AS satisfaction_per_10k_inr
FROM competitors
WHERE csat_score IS NOT NULL
ORDER BY satisfaction_per_10k_inr DESC;

-- ── Q5: Market growth — how fast is opportunity expanding? ────
SELECT
    year,
    market_size_usd_m,
    yoy_growth_pct,
    creator_base_m,
    ROUND(market_size_usd_m / creator_base_m, 2) AS spend_per_creator_usd
FROM india_market_growth
ORDER BY year;

-- ── Q6: TAM/SAM/SOM funnel ────────────────────────────────────
SELECT
    market_type,
    value_usd_m,
    ROUND(value_usd_m * 83.5, 0) AS value_inr_cr,
    ROUND(value_usd_m / MAX(value_usd_m) OVER () * 100, 1) AS pct_of_tam
FROM market_sizing
WHERE year = 2026
ORDER BY value_usd_m DESC;

-- ── Q7: Break-even analysis for Vivo ─────────────────────────
WITH vivo_economics AS (
    SELECT
        22999 AS selling_price_inr,
        14950 AS cogs_per_unit,
        2700000000 AS fixed_costs_inr  -- ₹270 Cr (R&D + marketing Y1)
)
SELECT
    selling_price_inr,
    cogs_per_unit,
    selling_price_inr - cogs_per_unit AS contribution_margin,
    ROUND(fixed_costs_inr * 1.0 / (selling_price_inr - cogs_per_unit)) AS break_even_units,
    ROUND(fixed_costs_inr * 1.0 / (selling_price_inr - cogs_per_unit) * selling_price_inr / 10000000) AS break_even_revenue_cr
FROM vivo_economics;

-- ── Q8: Competitive gap — what Vivo can exploit ───────────────
SELECT
    c.brand_name,
    p.india_price,
    p.stabilisation,
    p.has_built_in_mic,
    p.max_resolution,
    p.segment,
    CASE
        WHEN p.india_price BETWEEN 15000 AND 25000 AND p.stabilisation LIKE '%gimbal%'
        THEN '✓ DIRECT COMPETITOR'
        WHEN p.india_price BETWEEN 15000 AND 35000
        THEN '~ Indirect Competitor'
        ELSE '✗ Different Segment'
    END AS threat_to_vivo
FROM products p
JOIN competitors c ON p.competitor_id = c.id
ORDER BY p.india_price ASC;
