jupytext <- function(input, to, output = .with_ext(input, to), quiet = FALSE) {
    if (!quiet) message("Converting ", input, " to ", output)
    nb <- .read(input)
    .write(nb, output)
    invisible(output)
}

# TODO: refactor such that reticluate::import() needs to happen only once, by passing a
# `basiliskEnvironment` to the helper functions
.read <- function(input, ...) {
    py_jupytext <- reticulate::import("jupytext", convert = FALSE)
    py_jupytext$read(input, ...)
}

.write <- function(notebook, output) {
    py_jupytext <- reticulate::import("jupytext", convert = FALSE)
    py_jupytext$write(notebook, output)
}

.with_ext <- function(filename, ext) {
    file_path_sans_ext <- tools::file_path_sans_ext(filename)
    paste0(file_path_sans_ext, ".", ext)
}
