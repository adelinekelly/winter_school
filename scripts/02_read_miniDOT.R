source("scripts/00_libraries.R")

# script for concat

bog_minidot <- bind_rows(read.table("data/trout_bog/concat/Cat_159482_Bog_P3_Surface_DO.TXT", sep = ",", header = FALSE, skip = 9, strip.white = TRUE) %>%
    select(3, 5:7) %>%
    dplyr::rename(date_time = 1, temp = 2, do_obs = 3, do_sat = 4) %>%
    mutate(lake_id = "Trout_Bog", zone = "Pelagic", depth = "Surface") %>%
    mutate(date_time = as_datetime(`date_time`)),
  read.table("data/trout_bog/concat/Cat_530171_Bog_L3_Surface_DO.TXT", sep = ",", header = FALSE, skip = 9, strip.white = TRUE) %>%
    select(3, 5:7) %>%
    dplyr::rename(date_time = 1, temp = 2, do_obs = 3, do_sat = 4) %>%
    mutate(lake_id = "Trout_Bog", zone = "Littoral", depth = "Surface") %>%
    mutate(date_time = as_datetime(`date_time`)))
  
lake_minidot <- bind_rows(read.table("data/trout_lake/Cat_939315_Lake_L3_Surface_DO.TXT", sep = ",", header = FALSE, skip = 9, strip.white = TRUE) %>%
    select(3, 5:7) %>%
    dplyr::rename(date_time = 1, temp = 2, do_obs = 3, do_sat = 4) %>%
    mutate(lake_id = "Trout_Bog", zone = "Littoral", depth = "Surface") %>%
    mutate(date_time = as_datetime(`date_time`)),
  read.table("data/trout_lake/Cat_959654_Lake_P3_Surface_DO.TXT", sep = ",", header = FALSE, skip = 9, strip.white = TRUE) %>%
    select(3, 5:7) %>%
    dplyr::rename(date_time = 1, temp = 2, do_obs = 3, do_sat = 4) %>%
    mutate(lake_id = "Trout_Bog", zone = "Pelagic", depth = "Surface") %>%
    mutate(date_time = as_datetime(`date_time`)))
  

















































