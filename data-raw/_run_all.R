library(here)

internal_data_path <- here("data-raw")
files <- list.files(
  internal_data_path, pattern = ".*[.]R",
  full.names = FALSE
)
for (file in files) {
  if (startsWith(file, "_")) {
    # File is a helper script and does not generate data.
    next
  }
  path <- here(file.path("data-raw", file))
  message("running ", path, " ...")
  source(path)
}
