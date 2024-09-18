#' Convert Jupyter Notebooks to (R)Markdown, Julia, Python or R scripts and vice-versa
#'
#' `juptext()` provides a convenient R wrapper for the Python
#' [`jupytext` API](https://jupytext.readthedocs.io/en/latest/using-library.html)
#' allowing the user to convert between any of the
#' [supported formats](https://jupytext.readthedocs.io/en/latest/formats.html) from within R.
#'
#' @param input File path to the input file.
#' @param to The format to convert to, should be a file extension for any of the
#'   [Supported Languages](https://jupytext.readthedocs.io/en/latest/languages.html). Ignored if
#'   `output` is specified
#' @param output The full path to where the converted file should be written. The format is derived
#'   from the file extension of `output`. Takes precedence over `to`. By default, the output file
#'   path is set by taking the `input` file path and replacing the file extension with `to`.
#' @param quiet Logical, whether to show an informative message about which file is getting
#'   converted.
#'
#' @return The file path to the output file, invisibly. This function is mainly called for its side
#'   effects.
#'
#' @details
#' Internally, this function calls the Python `jupytext.read` on the input file and then
#' writes it to the desired format using `jupytext.write`, using the
#' [`jupytext` API](https://jupytext.readthedocs.io/en/latest/using-library.html).
#'
#' @export
#'
#' @examples
#' library(jupytextR)
#'
#' ## Create toy RMarkdown file
#' rmd_data <- "Hi **Markdown**!
#'
#' ```{r}
#' print(\"Hi R Markdown!\")
#' ```
#' "
#' rmd_file <- tempfile(fileext = ".Rmd")
#' writeLines(rmd_data, rmd_file)
#'
#' ## Convert Rmd file to a jupyter notebook
#' jupytext(rmd_file, to = "ipynb")
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
        notebook <- store$nb
        py_jupytext$write(notebook, output)

        invisible(NULL)
    }, output = output, persist = TRUE)
}

.with_ext <- function(filename, ext) {
    file_path_sans_ext <- tools::file_path_sans_ext(filename)
    paste0(file_path_sans_ext, ".", ext)
}
