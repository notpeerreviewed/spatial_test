


library(dplyr)
library(ggplot2)

library(sf)

setwd("H:/requests/20200109 Police District data for Raroa visit/incidents")

options(stringsAsFactors = F)

# load point data
df <- read.csv("df.csv")

# first try to project to epsg 2193
police_districts <- st_read("police_district_boundaries/nz-police-district-boundaries.shp") %>% st_transform(2193)


incidents_by_district <- df %>%
  filter(!is.na(LocationFindLocationLatitude),
         !is.na(LocationFindLocationLongitude)) %>%
  st_as_sf(coords = c("LocationFindLocationLongitude", "LocationFindLocationLatitude")) %>%
  st_set_crs(2193) %>%
  st_join(police_districts["DISTRICT_N"])

unique(incidents_by_district$DISTRICT_N)


# first try to project to epsg 2193
police_districts <- st_read("police_district_boundaries/nz-police-district-boundaries.shp") %>% st_transform(4326)


incidents_by_district <- df %>%
  filter(!is.na(LocationFindLocationLatitude),
         !is.na(LocationFindLocationLongitude)) %>%
  st_as_sf(coords = c("LocationFindLocationLongitude", "LocationFindLocationLatitude")) %>%
  st_set_crs(4326) %>%
  st_join(police_districts["DISTRICT_N"])

unique(incidents_by_district$DISTRICT_N)

