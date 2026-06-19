# VPD_Study

This repository contains all R/Quarto code to reproduce the analyses in:

> Torres S, Simbaña L, Walas N, Arnold B, et al. *Integrated Serosurveillance to Monitor Childhood 
> Immunization Against Vaccine-Preventable Diseases in Esmeraldas, Ecuador.*

---

## Repository structure
VPD_Study/

├── R/

│   └── 0-config.R                    # Package loading and shared color palettes

├── 2-seroprev-vaccine-coverage.Qmd   # Seroprevalence, vaccination coverage (Tables 1–7, Figs 1–3, Fig S1)

├── 3-IgG-by-dose-age.Qmd            # IgG levels by vaccine dose and age (Figs 4–5)

├── 4-vaccination-concordance.Qmd     # Concordance between records and serology (Tables 8–9)

├── data/

│   ├── ecomid_sero_vpd_2026-06-11.rds   # Processed serology dataset (not public)

│   └── surveydata_20251003.csv           # Household survey data (not public)

└── output/

├── figures/                      # Generated figures (.png)

└── tables/                       # Generated tables (.csv)

---

## System requirements

- **R** version 4.5.0 or higher — download from [CRAN](https://cran.r-project.org)
- **Quarto** version 1.4 or higher — download from [quarto.org](https://quarto.org)
- **RStudio** (recommended) — download from [posit.co](https://posit.co/download/rstudio-desktop)
- OS: tested on Windows 11 x64; expected to work on macOS and Linux

---

## R packages

All packages are loaded via `R/0-config.R`. Install them with:

```r
install.packages(c(
  "here", "tidyverse", "readxl", "skimr", "kableExtra",
  "table1", "patchwork", "emmeans", "geepack", "gt"
))
```

---

## Data

The input datasets are not publicly available as they contain individual-level 
child health data. Researchers interested in access should contact the study 
authors. The expected files are:

- `data/ecomid_sero_vpd_2026-06-11.rds` — longitudinal serology and vaccination 
  records (children followed at 6, 9, 12, 18, and 24 months)
- `data/surveydata_20251003.csv` — household and caregiver characteristics

---

## How to reproduce the analyses

Run the scripts in order from RStudio or the terminal. Each script is 
self-contained and sources `R/0-config.R` automatically.

**From RStudio:** open any `.Qmd` file and click **Render**  
**From the terminal:**
```bash
quarto render 2-seroprev-vaccine-coverage.Qmd
quarto render 3-IgG-by-dose-age.Qmd
quarto render 4-vaccination-concordance.Qmd
```

Each script renders a self-contained HTML report in `output/` and saves 
figures and tables to `output/figures/` and `output/tables/`.

---
## Script descriptions

| Script | Description | Outputs |
|--------|-------------|---------|
| `R/0-config.R` | Loads all packages; defines shared color palettes (colorblind-safe) | — |
| `2-seroprev-vaccine-coverage.Qmd` | Seroprevalence (tetanus, diphtheria, rubella, measles) and pentavalent/MMR vaccination coverage by age and community type; community-level pairwise GEE comparisons | Tables 1–7, Figs 1–3, Fig S1, Table S1 |
| `3-IgG-by-dose-age.Qmd` | IgG antibody levels (log₁₀ MFI-bg) by cumulative vaccine dose and age at collection | Figs 4–5 |
| `4-vaccination-concordance.Qmd` | Concordance between vaccination records and serology (sensitivity, specificity, PPV, NPV via GEE); measles vs. rubella seropositivity comparison | Tables 8–9 |

---

## Statistical methods

Models use **Generalized Estimating Equations (GEE)** with independence working 
correlation and cluster-robust sandwich standard errors, clustered by child, to 
account for repeated measures across visits. Implemented with `geepack::geeglm`; 
marginal contrasts via `emmeans`.

---

## Authors

Ben Arnold, Stuart Torres
