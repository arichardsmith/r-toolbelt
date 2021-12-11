#' Format for rename
#'
#' Prints an incomplete rename function to make it easy to manually rename data frame columns.
#'
#' @param data Dataframe to rename
#' @export
format_for_rename <- function (data) {
  vals <-
    paste('= "',
          colnames(data),
          '"',
          sep = "",
          collapse = ",\n  ")
  cat(glue::glue("rename(
   {vals}
 )", .trim = FALSE))
}

#' Format for recode
#'
#' Print an incomplete fct_recode function to make it easier to manually recode factor levels.
#'
#' @param target The factor you want to recode
#' @param as_mutate Output as a mutate call. Defaults to false.
#' @export
format_for_recode <- function (target, as_mutate = FALSE) {
  name <- deparse(substitute(target))

  vals <-
    paste('= "',
          levels(target),
          '"',
          sep = "",
          collapse = ",\n  ")

  var_name <- stringr::str_match(name, "\\$([a-z0-9])+")[1, 2]

  if (as_mutate && !is.na(var_name)) {
    cat(glue::glue(
      "mutate({var_name} = fct_recode({var_name},
  {vals}
)",
      .trim = FALSE
    ))
  } else {
    cat(glue::glue("{name} <- fct_recode({name},
  {vals}
)", .trim = FALSE))
  }
}
