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


pipeline_func <- function(string, nrow_df, size_parallel) {
  list(
    tar_target(
      name = StringTarget, 
      command = string
    ),
    tarchetypes::tar_group_size(
      name = RawData,
      command = tibble(x = rnorm(nrow_df), y = rnorm(nrow_df)), 
      size = size_parallel
    ),
    tar_target(
      name = Output,
      command = processing_func(RawData), 
      pattern = map(RawData)
    )
  )
}