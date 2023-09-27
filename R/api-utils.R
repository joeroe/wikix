# api_utils.R
# Helper functions for interacting with the XTools API

#' Returns the package's user agent
#'
#' @noRd
#' @keywords internal
wpx_user_agent <- function() {
  user_agent("https://github.com/joeroe/wikix")
}

wpx_request <- function(url) {
  response <- httr::GET(url)

  # Check for server errors
  # We'll handle status 404 ourselves later
  if (!response[["status_code"]] %in% c(200, 404)) {
    httr::stop_for_status(response)
  }

  if (httr::http_type(response) != "application/json") {
    rlang::abort(c(
      paste("Response had an unexpected content type:",
            httr::http_type(response)),
      i = "Expected 'application/json'"
    ))
  }

  # Parse & return
  jsonlite::fromJSON(httr::content(response, "text"))
}

#' Check if API response was an error
#'
#' @noRd
#' @keywords internal
xtools_is_error <- function(content) {
  "error" %in% names(content)
}
