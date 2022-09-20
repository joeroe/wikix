# wp_utils.R
# Helper functions for MediaWiki data

#' Lookup MediaWiki namespace name
#'
#' @noRd
#' @keywords internal
mw_namespace <- function(x = NULL) {
  ns <- list(
    `0` = "Main",
    `1` = "Talk",
    `2` = "User",
    `3` = "User talk",
    `4` = "Wikipedia",
    `5` = "Wikipedia talk",
    `6` = "File",
    `7` = "File talk",
    `8` = "MediaWiki",
    `9` = "MediaWiki talk",
    `10` = "Template",
    `11` = "Template talk",
    `12` = "Help",
    `13` = "Help talk",
    `14` = "Category",
    `15` = "Category talk",
    `100` = "Portal",
    `101` = "Portal talk",
    `118` = "Draft",
    `119` = "Draft talk",
    `710` = "TimedText",
    `711` = "TImedText talk",
    `828` = "Module",
    `829` = "Module talk",
    `2300` = "Gadget",
    `2301` = "Gadget talk",
    `2302` = "Gadget definition",
    `2303` = "Gadget definition talk"
  )
  if (is.null(x)) ns else ns[as.character(x)]
}
