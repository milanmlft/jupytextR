jupytext <- function(input, to, output = NULL) {


}

# TODO: refactor such that reticluate::import() needs to happen only once, by passing a
# `basiliskEnvironment` to the helper functions
.read <- function(input, ...) {
    py_jupytext <- reticulate::import("jupytext")
    py_jupytext$read(input, ...)
}

.write <- function(notebook, output) {
    py_jupytext <- reticulate::import("jupytext")
    py_jupytext$write(notebook, output)
}
