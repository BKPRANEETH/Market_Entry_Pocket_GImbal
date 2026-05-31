# 📷 Vivo Market Entry — Pocket Gimbal Camera India
### Consulting Portfolio Project | Gap Year Initiative | May 2026

> **CV Description:** *"During my gap year, I identified a strategic market entry opportunity in India's creator economy and independently built a consulting-grade market study — including competitive analysis, SQL competitor database, financial modelling, and a full strategy deck — for a hypothetical Vivo pocket gimbal camera launch."*

---

## 📌 Project Overview

This project analyses whether **Vivo** — a top-3 smartphone brand in India with no camera hardware experience — should enter the **pocket gimbal camera market** targeting India's 85M+ creators with a product priced at ₹22,999.

**The core finding:** There is a genuine, unoccupied gap in the ₹15,000–₹35,000 price band. DJI starts at ₹45,999. Insta360 at ₹39,999. No quality option exists below that. Vivo has the brand equity, retail network, and supply chain to own this segment.

---

## 📂 Repository Structure

```
Market_Entry_Pocket_GImbal/
│
├── README.md                          ← This file
│
├── presentation/
│   └── Vivo_PocketCam_India_Strategy.pptx   ← 12-slide strategy deck
│
├── data/
│   └── Vivo_PocketCam_Market_Study.xlsx     ← Market dataset (4 sheets)
│
└── sql/
    ├── schema.sql                     ← Database schema
    ├── seed_data.sql                  ← Competitor data inserts
    └── analysis_queries.sql          ← 8 analytical queries
```

---

## 🔍 Methodology

### Frameworks Used
| Framework | Purpose |
|-----------|---------|
| TAM / SAM / SOM | Market sizing — ₹340M → ₹84M → ₹8M |
| Porter's Five Forces | Industry attractiveness scoring |
| SWOT Analysis | Vivo's strategic position |
| Break-even Analysis | Unit economics at ₹22,999 ASP |
| CAGR Calculation | Market growth rate: 12.4% |
| Gross Margin Model | Hardware: 35% | Accessories: 45% |

### Data Sources
- IMARC Group / MarketsandMarkets — market size estimates
- TechRadar India 2026 — product launch data (DJI Osmo Pocket 4, Insta360 Luna)
- IAMAI Creator Economy Report — India creator base projections
- Smartprix / 91mobiles — India pricing data
- Company investor relations — revenue estimates

---

## 📊 Key Findings

| Metric | Value |
|--------|-------|
| India Pocket Cam Market (2026E) | $69M |
| Market CAGR (2024–2028) | 12.4% |
| DJI India Market Share | 55% |
| Lowest quality camera in India | ₹32,999 (GoPro) |
| **Vivo Target Price** | **₹22,999** |
| Year 1 Revenue Target | ₹67 Cr ($8M) |
| Break-even Timeline | Year 2 (~1.1L units) |
| Year 3 EBITDA | ₹44 Cr |

---

## 💾 SQL Database

The competitor database is a key differentiator of this project — built to demonstrate analytical rigour beyond a standard PowerPoint deck.

**Schema covers:**
- `competitors` — 7 brands, 15 columns including pricing, margins, social metrics
- `market_sizing` — TAM/SAM/SOM across 5 years (2024–2028)
- `products` — individual SKU-level data per brand

**Sample Query:**
```sql
-- Identify the pricing gap Vivo should enter
SELECT brand_name, india_price_inr,
       CASE WHEN india_price_inr < 25000 THEN 'Target Zone'
            WHEN india_price_inr < 40000 THEN 'Mid-Premium'
            ELSE 'Premium' END AS segment
FROM competitors
ORDER BY india_price_inr ASC;
```

---

## 📈 The Deck (12 Slides)

1. Title Slide
2. Executive Summary
3. Market Sizing (TAM/SAM/SOM)
4. Market Growth Chart (2024–2028)
5. Competitive Landscape + Market Share
6. Porter's Five Forces
7. Pricing Strategy — Owning the White Space
8. SWOT Analysis
9. Go-to-Market Strategy (3 Phases)
10. 3-Year Financial Model
11. SQL Database Design
12. Final Recommendation

---

## 🎯 Recommendation

**Vivo should enter the pocket gimbal camera market in Q3 2026.**

Priced at ₹22,999, Vivo would be the only quality pocket gimbal camera in India's fastest-growing price band. With existing retail, brand trust, and supply chain, this is an adjacent category move — not a leap. Break-even by Year 2 is achievable at modest volume.

---

*Prepared independently as a consulting portfolio project. All market data sourced from publicly available reports.*
