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

# `local_` helpers for temporarily setting basilisk options -----------------------------------

#' @importFrom basilisk basiliskStart basiliskStop
local_basiliskEnv <- function(env, envir = parent.frame()) {
    proc <- basiliskStart(jupytext_env)
    withr::defer(basiliskStop(proc),  envir = envir)
    proc
}

#' @importFrom basilisk getBasiliskFork setBasiliskFork
local_setBasiliskFork <- function(value, envir = parent.frame()) {
    old <- getBasiliskFork()
    withr::defer(setBasiliskFork(old), envir = envir)
    setBasiliskFork(value = value)
}

#' @importFrom basilisk getBasiliskShared setBasiliskShared
local_setBasiliskShared <- function(value, envir = parent.frame()) {
    old <- getBasiliskShared()
    withr::defer(setBasiliskShared(old), envir = envir)
    setBasiliskShared(value = value)
}
