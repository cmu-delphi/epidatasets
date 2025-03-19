library(dplyr)
library(covidcast)

# Previously, we were using `covidcast::county_census`, but covidcast is large
# and complicated to install (due to `sf` dependency). Instead, read the file
# directly from GitHub.
state_census <- read_csv("https://github.com/cmu-delphi/covidcast/raw/c89e4d295550ba1540d64d2cc991badf63ad04e5/Python-packages/covidcast-py/covidcast/geo_mappings/state_census.csv") %>% # nolint: line_length_linter
  select(STATE, NAME, POPESTIMATE2019, ABBR) %>%
  rename(abbr = ABBR, name = NAME, pop = POPESTIMATE2019, fips = STATE) %>%
  # Left-pad FIPS codes with zeroes to 2 digits, and convert to character
  mutate(abbr = tolower(abbr), fips = sprintf("%02d", fips)) %>%
  as_tibble()

usethis::use_data(state_census, overwrite = TRUE, compress = "xz")
