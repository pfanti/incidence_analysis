# Biostatistics Research: Survival & Time Series Analysis

This repository contains statistical workflows for analyzing medical and environmental data, specifically focusing on disease incidence in Campinas, Brazil.

## 🔬 Analysis Modules

### 1. Survival Analysis (Kaplan-Meier)
Evaluates the probability of "no alteration" over time across different cohorts:
- **N-Stage** (Nodal involvement)
- **Surgical Intervention** (Cx)
- **Diabetes Mellitus** (DM)
- *Includes Log-Rank tests for group comparisons.*

### 2. Time Series Analysis (CCF)
Investigates the relationship between climatic factors and disease incidence:
- **Decomposition**: Separation of Trend, Seasonality, and Random noise using Additive Models.
- **Stationarity**: Augmented Dickey-Fuller (ADF) and KPSS testing.
- **Cross-Correlation**: Identifying time-lags between rainfall peaks and incidence spikes.

## 🛠️ Tech Stack
- **Language**: R
- **Key Libraries**: `survival`, `survminer`, `tseries`, `forecast`, `readxl`

## 📊 How to Use
1. Clone this repository.
2. Ensure your data is in the `data/` folder.
3. Run `scripts/01_survival_km.R` for cohort analysis.
4. Run `scripts/02_timeseries_ccf.R` for environmental correlation.

---
*Developed by Paulo Fanti - Statistician & Data Scientist*
