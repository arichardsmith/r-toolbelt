#' Plot Japanese text
#'
#' Update current ggplot theme to use a font that supports Japanese text.
#'
#' Note: run `toolbelt::plot_japanese_text` to get the source to paste into a
#' workbook.
#' @export
plot_japanese_text <- function () {
  ggplot2::theme_update(text=ggplot2::element_text(family="HiraKakuProN-W3"))
}
