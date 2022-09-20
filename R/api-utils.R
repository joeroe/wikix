# api_utils.R
# Helper functions for interacting with the XTools API

#' Check if API response was an error
#'
#' @noRd
#' @keywords internal
xtools_is_error <- function(content) {
  "error" %in% names(content)
}
