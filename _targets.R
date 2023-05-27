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

# Replace the target list below with your own:
list(
  tarchetypes::tar_group_size(
    name = data,
    command = tibble(x = rnorm(100), y = rnorm(100)), 
    size = 2
  ),
  tar_target(
    name = output,
    command = processing_func(data), 
    pattern = map(data),  
    iteration = "vector"
  )
)
