## code to prepare `jhu_confirmed_cumulative_num` dataset goes here

jhu_confirmed_cumulative_num <- covidcast(
  data_source = "jhu-csse",
  signals = "confirmed_cumulative_num",
  time_type = "day",
  geo_type = "state",
  time_values = epirange(20200301, 20220131),
  geo_values = "ca,fl,ny,tx"
) %>% fetch()


usethis::use_data(jhu_confirmed_cumulative_num, overwrite = TRUE)
