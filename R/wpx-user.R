# wpx_user.R
# Functions to access the XTools User API <https://www.mediawiki.org/wiki/XTools/API/User>

#' Get data from the XTools User API
#'
#' https://www.mediawiki.org/wiki/XTools/API/User
#'
#' @param username MediaWiki username.
#' @param project Project. Default: `"enwiki"` for the English Wikipedia
#'
#' @return
#' A `tibble`.
#'
#' @export
#'
#' @examples
#' wpx_user_month_counts("Jimbo Wales")
wpx_user_month_counts <- function(username, project = "enwiki") {
  username <- stringr::str_replace_all(username, " ", "_")

  # Retrieve
  url <- glue::glue("https://xtools.wmflabs.org/api/user/month_counts/{project}/{username}")
  rlang::inform(paste("Requesting", url, "..."))
  response <- httr::GET(url)

  httr::warn_for_status(response)
  month_counts <- httr::content(response)

  if (xtools_is_error(month_counts)) return(NA)
  else {
    # Rectangle
    tibble::enframe(month_counts$totals, "namespace") |>
      dplyr::mutate(namespace = as.character(mw_namespace(.data[["namespace"]]))) |>
      tidyr::unnest_longer(.data[["value"]], indices_to = "year") |>
      tidyr::unnest_longer(.data[["value"]], indices_to = "month", values_to = "edits") |>
      dplyr::select(.data[["namespace"]], .data[["year"]], .data[["month"]], .data[["edits"]])
  }
}
