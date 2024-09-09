.onLoad <- function(libname, pkgname) {
  # Load `epiprocess`, if available.
  epiprocess_installed <- requireNamespace("epiprocess", quietly = TRUE)

  if (!epiprocess_installed) {
    stop(
      "The `epiprocess` package is not installed. Please install it to guarantee correct data object behavior."
    )
  } else {
    packageStartupMessage("`epiprocess` is already installed. It has been loaded.")
  }

  invisible()
}
