#' Creates an R file with template
#'
#' Creates an R file with template
#'
#' @param nm Name of your awesome work
#' @param path Directory name
#' @param template Template type. Currently only \code{template.R}
#'
#' @export
#'
#' @examples
#' \donttest{
#' draft("My Draft")
#' }
draft <- function(nm = "draft", path = "drafts", template = "template/template.R") {
  dir.create(path, FALSE, TRUE)
  prefix <- format(Sys.Date(), "%Y%m%d")
  nm <- tolower(nm)
  nm <- stringi::stri_trans_general(nm, "Latin-ASCII")
  nm <- stringi::stri_trim_both(nm)
  nm <- gsub("[^a-z0-9]+", "_", nm)
  f <- paste(path, "/", prefix, "_", nm, ".R", sep = "")
  f <- rename_file(f)
  f0 <- system.file(template, package = "draft")
  file.copy(f0, f)
  if (interactive()) {
    rstudioapi::navigateToFile(f)
  } else {
    utils::file.edit(f)
  }
}

rename_file <- function(f) {
  if (file.exists(f)) {
    num <- stringi::stri_extract_first_regex(f, "([0-9]*)(?=\\.R)")
    if (num == "") num <- 0L
    suffix <- sprintf("%02d.R", as.integer(num) + 1L)
    f <- gsub("[0-9]*\\.R$", suffix, f)
    rename_file(f)
  } else {
    f
  }
}


#' Upload file to Gist (GitHub)
#'
#' Upload file or current open file to Gist
#'
#' @param file Path to file. If missing, gets current open file.
#'
#' @export
upload <- function(file) {
  if (missing(file) && interactive()) {
    file <- rstudioapi::getSourceEditorContext()$path
  }
  gistr::gist_create(file, browse = FALSE)
}
