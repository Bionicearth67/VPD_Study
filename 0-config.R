
#-------------------------------
# 0-config.R
# configure data directories
# source base functions
# load libraries
#-------------------------------

#-------------------------------
# helper packages
#-------------------------------
suppressPackageStartupMessages(library(here))
suppressPackageStartupMessages(library(tidyverse))
suppressPackageStartupMessages(library(readxl))      # data processing (script 1)
suppressPackageStartupMessages(library(skimr))       # data processing (script 1)
suppressPackageStartupMessages(library(kableExtra))  # data processing (script 1)
suppressPackageStartupMessages(library(table1))      # Table 1a (script 2)

#-------------------------------
# graphics packages
#-------------------------------
suppressPackageStartupMessages(library(patchwork))

#-------------------------------
# statistics packages
#-------------------------------
suppressPackageStartupMessages(library(emmeans))
suppressPackageStartupMessages(library(geepack))

#-------------------------------
# table formatting
#-------------------------------
suppressPackageStartupMessages(library(gt))

#-------------------------------
# custom color palettes
#-------------------------------

# safe color blind palette
# http://jfly.iam.u-tokyo.ac.jp/color/
# http://www.cookbook-r.com/Graphs/Colors_(ggplot2)/
# Reference: Bang Wong, Nature Methods 2011: https://www.nature.com/articles/nmeth.1618
cbpal <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

# high-contrast, colorblind-friendly dose palettes (RColorBrewer "Dark2"),
# shared between the coverage figure (Fig 1B) and the IgG-by-dose figures
# (Figs 4-5). Names are the cumulative dose count. Dose 0 (unvaccinated) is gray
# to set it apart; it is used only in Figs 4-5 (Fig 1B uses doses 1-3 / 1-2).
# pentavalent: 3 warm hues (gold / orange / magenta) that contrast strongly;
# MMR: 2 cool hues (teal / purple) that contrast strongly.
penta_pal <- c("0" = "#999999", "1" = "#E6AB02", "2" = "#D95F02", "3" = "#E7298A")
mmr_pal   <- c("0" = "#999999", "1" = "#1B9E77", "2" = "#7570B3")
