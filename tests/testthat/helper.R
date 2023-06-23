## Copy toy notebooks to a new directory for testing
restore_fixtures <- function(dir) {
    fixtures <- list.files(test_path("fixtures"), full.names = TRUE)
    file.copy(fixtures, dir)
}

## Get the source for a given cell from an in-memory jupyter notebook
get_cell_source <- function(nb_data, cell) {
    nb_data$cells[[cell]]$source
}
