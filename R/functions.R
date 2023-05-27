processing_func <- function(.df) {
  print(.df)
  df1 <- .df |> 
    dplyr::mutate(
      z = x + y
    )
  df2 <- .df |> 
    dplyr::mutate(
      z = x*y
    )
  dplyr::bind_rows(df1, df2)
}