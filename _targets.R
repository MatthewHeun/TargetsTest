# Created by use_targets().
# Follow the comments below to fill in this target script.
# Then follow the manual to check and run the pipeline:
#   https://books.ropensci.org/targets/walkthrough.html#inspect-the-pipeline # nolint

# Load packages required to define the pipeline:
library(targets)
# library(tarchetypes) # Load other packages as needed. # nolint

# Set target options:
tar_option_set(
  storage = "worker", 
  retrieval = "worker",
  packages = c("tibble"), # packages that your targets need to run
  format = "rds" # default storage format
  # Set other options as needed.
)

# Set up for multithreaded work on the local machine.
future::plan(future.callr::callr)

# tar_make_future() configuration (okay to leave alone):
# Install packages {{future}}, {{future.callr}}, and {{future.batchtools}} to allow use_targets() to configure tar_make_future() options.

# Run the R scripts in the R/ folder with your custom functions:
tar_source()
# source("other_functions.R") # Source other scripts as needed. # nolint

string <- "a string"
nrow_df <- 10
size_parallel <- 2

# Replace the target list below with your own:
# list(
#   tarchetypes::tar_group_size(
#     name = data,
#     command = tibble(x = rnorm(nrow_df), y = rnorm(nrow_df)), 
#     size = 2
#   ),
#   tar_target(
#     name = output,
#     command = processing_func(data), 
#     pattern = map(data)
#   )
# )

# pipeline_func(string_arg = PFUSetup::get_abs_paths(version = 1.1)[["mw_concordance_path"]], 
#               nrow_df = nrow_df, 
#               size_parallel = size_parallel)


pipeline_func(string_arg = "a string", 
              nrow_df = nrow_df, 
              size_parallel = size_parallel)