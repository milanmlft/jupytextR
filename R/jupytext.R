#' @importFrom basilisk basiliskStart basiliskStop basiliskRun
jupytext <- function(input, to, output = .with_ext(input, to), quiet = FALSE) {
    proc <- local_basiliskEnv(jupytext_env)
    .import_jupytext(proc)

    if (!quiet) message("Converting ", input, " to ", output)
    .read(proc, input)
    .write(proc, output)

    invisible(output)
}

.read <- function(proc, input, ...) {
    basiliskRun(proc, function(input, store) {
        py_jupytext <- store$jupytext
        store$nb <- py_jupytext$read(input)

        invisible(NULL)
    }, input = input, persist = TRUE)
}

.write <- function(proc, output) {
    basiliskRun(proc, function(output, store) {
        stopifnot(!is.null(store$jupytext))
        stopifnot(!is.null(store$nb))

        py_jupytext <- store$jupytext
        notebook <- reticulate::r_to_py(store$nb)
        py_jupytext$write(notebook, output)

        invisible(NULL)
    }, output = output, persist = TRUE)
}

.with_ext <- function(filename, ext) {
    file_path_sans_ext <- tools::file_path_sans_ext(filename)
    paste0(file_path_sans_ext, ".", ext)
}
