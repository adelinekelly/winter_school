# script to manually concat miniDOT files

source("scripts/00_libraries.R")

# separate folder for each depth 
# trout bog 
# depth is specified in cm
bog_raw <- bind_rows((fs::dir_ls("data/trout_bog/pelagic/20", regexp = "\\.txt$") %>%
      purrr::map_dfr( ~ read.table(.x, sep = ",", skip = 2, header = TRUE)) %>%
      select(1, 3, 4) %>%
      dplyr::rename(date_time = 1, temp = 2, do_obs = 3) %>%
      mutate(lake_id = "Trout_Bog", depth = "20") %>%
      mutate(date_time = as_datetime(`date_time`))), 
    fs::dir_ls("data/trout_bog/pelagic/40", regexp = "\\.txt$") %>%
      purrr::map_dfr( ~ read.table(.x, sep = ",", skip = 2, header = TRUE)) %>%
      select(1, 3, 4) %>%
      dplyr::rename(date_time = 1, temp = 2, do_obs = 3) %>%
      mutate(lake_id = "Trout_Bog", depth = "40") %>%
      mutate(date_time = as_datetime(`date_time`))), 
  fs::dir_ls("data/trout_bog/pelagic/120", regexp = "\\.txt$") %>%
      purrr::map_dfr( ~ read.table(.x, sep = ",", skip = 2, header = TRUE)) %>%
      select(1, 3, 4) %>%
      dplyr::rename(date_time = 1, temp = 2, do_obs = 3) %>%
      mutate(lake_id = "Trout_Bog", depth = "120") %>%
      mutate(date_time = as_datetime(`date_time`))),
  fs::dir_ls("data/trout_bog/pelagic/420", regexp = "\\.txt$") %>%
      purrr::map_dfr( ~ read.table(.x, sep = ",", skip = 2, header = TRUE)) %>%
      select(1, 3, 4) %>%
      dplyr::rename(date_time = 1, temp = 2, do_obs = 3) %>%
      mutate(lake_id = "Trout_Bog", depth = "420") %>%
      mutate(date_time = as_datetime(`date_time`))))


trout_test <- fs::dir_ls("data/trout_bog/pelagic/40", regexp = "\\.txt$") %>%
      purrr::map_dfr( ~ read.table(.x, sep = ",", skip = 2, header = TRUE)) %>%
      #select(1, 3, 4) %>%
      #dplyr::rename(date_time = 1, temp = 2, do_obs = 3) %>%
      mutate(lake_id = "Trout_Bog", depth = "40") %>%
      mutate(date_time = as_datetime(`date_time`))


trout_test <- read.csv("data/trout_bog/pelagic/40/5C00FC4C.txt", sep = ",", skip = 2, header = TRUE)


sky_raw <- bind_rows((fs::dir_ls("Data/Loch Vale/miniDOT/raw/Sky/sky_0.5", regexp = "\\.txt$") %>%
    purrr::map_dfr( ~ read.table(.x, sep = ",", skip = 2, header = TRUE)) %>%
    select(1, 3, 4) %>%
    dplyr::rename(date_time = 1, temp = 2, do_obs = 3) %>%
    mutate(lake_id = "Sky", local_tz = "Mountain", daylight_savings = "Yes", depth = "0.5") %>%
    mutate(date_time = as_datetime(`date_time`))), 
  fs::dir_ls("Data/Loch Vale/miniDOT/raw/Sky/sky_3.5", regexp = "\\.txt$") %>%
    purrr::map_dfr( ~ read.table(.x, sep = ",", skip = 2, header = TRUE)) %>%
    select(1, 3, 4) %>%
    dplyr::rename(date_time = 1, temp = 2, do_obs = 3) %>%
    mutate(lake_id = "Sky", local_tz = "Mountain", daylight_savings = "Yes", depth = "3.5") %>%
    mutate(date_time = as_datetime(`date_time`)),
  fs::dir_ls("Data/Loch Vale/miniDOT/raw/Sky/sky_6", regexp = "\\.txt$") %>%
    purrr::map_dfr( ~ read.table(.x, sep = ",", skip = 2, header = TRUE)) %>%
    select(1, 3, 4) %>%
    dplyr::rename(date_time = 1, temp = 2, do_obs = 3) %>%
    mutate(lake_id = "Sky", local_tz = "Mountain", daylight_savings = "Yes", depth = "6") %>%
    mutate(date_time = as_datetime(`date_time`))) %>%
  mutate(salinity = 0,
         do_sat = 100 * do_obs/oxySol(temp, salinity, 0.66))#last term is atm pressure
#Get atm from elevation here: https://www.waterontheweb.org/under/waterquality/dosatcalc.html



























































