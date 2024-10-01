library(here)

internal_data_path <- here("R/sysdata.rda")

save_to_sysdata <- function(obj, obj_name) {
  # Create a new environment for storing sysdata contents
  sysdata_env <- new.env(hash = FALSE, parent = emptyenv())

  # Load current internal data into this new environment
  if(file.exists(internal_data_path)) {
    load(internal_data_path, envir = sysdata_env)
  }

  # Add or replace the object
  sysdata_env[[obj_name]] <- obj

  # Save the environment back to the internal package datafile
  save(
    list = names(sysdata_env),
    file = internal_data_path,
    envir = sysdata_env,
    compress = "xz"
  )
}
