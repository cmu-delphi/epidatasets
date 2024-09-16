library(dplyr)
library(covidcast)

state_census <- covidcast::state_census %>%
  select(STATE, NAME, POPESTIMATE2019, ABBR) %>%
  rename(abbr = ABBR, name = NAME, pop = POPESTIMATE2019, fips = STATE) %>%
  # Left-pad FIPS codes with zeroes to 2 digits, and convert to character
  mutate(abbr = tolower(abbr), fips = sprintf("%02d", fips)) %>%
  as_tibble()

usethis::use_data(state_census, overwrite = TRUE)
