local_basiliskEnv <- function(env, envir = parent.frame()) {
    proc <- basiliskStart(jupytext_env)
    withr::defer(basiliskStop(proc),  envir = envir)
    proc
}

## Read ipynb files using jupytext's read() method
## ipynb files are loaded in memory as an R list
read_ipynb <- function(input) {
    proc <- local_basiliskEnv(jupytext_env)
    basiliskRun(proc, function(input) {
        ## Import jupytext with auto-convert enabled
        jupytext <- reticulate::import("jupytext", convert = TRUE)
        jupytext$read(input)
    }, input = input)
}
