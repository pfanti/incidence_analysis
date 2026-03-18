# Title: Time Series Analysis of Climate vs. Disease Incidence
# Description: Decomposition and Cross-Correlation Function (CCF) Analysis

# --- 1. Setup ---
if (!require("pacman")) install.packages("pacman")
pacman::p_load(tseries, forecast, readxl, ggplot2, survminer)

# --- 2. Load Data ---
# Using relative paths for GitHub portability
df <- read_excel("data/Analises056_17.xlsx", sheet = "dados")

# --- 3. Stationarity Testing (ADF) ---
# Testing if the series is stationary before correlation
adf_results <- list(
  incidence = adf.test(df$Inc_casos),
  rainfall  = adf.test(df$CHUVA_MEDIA_CAMPINAS)
)
print(adf_results)

# --- 4. Decomposition & Component Extraction ---
# Frequency = 4 (Quarterly) as defined in your analysis
analyze_series <- function(vec, name) {
  ts_obj <- ts(vec, frequency = 4)
  decomp <- decompose(ts_obj, "additive")
  plot(decomp)
  
  # Return the random (stochastic) component, removing seasonality/trend
  return(na.omit(decomp$random))
}

inc_rand   <- analyze_series(df$Inc_total, "Total Incidence")
rain_rand  <- analyze_series(df$CHUVA_MEDIA_CAMPINAS, "Rainfall")

# --- 5. Cross-Correlation Function (CCF) ---
# Analyzing the lead/lag relationship between Rain and Incidence
ccf_plot <- ccf(rain_rand, inc_rand, lag.max = 6, 
                main = "Cross-Correlation: Rain vs Incidence",
                ylab = "Correlation Coefficient",
                xlab = "Lag (Quarters)")
