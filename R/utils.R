#' Read ipynb files using jupytext's read() method
#'
#' Calls the `jupytext.read` method from the
#' [`jupytext` API](https://jupytext.readthedocs.io/en/latest/using-library.html).
#' The ipynb data is loaded in memory as an R list, converted from the underlying JSON data of the
#' notebook.
#'
#' @param input File path to the input file to be read.
#'
#' @return An R list containing the notebook data.
#'
#' @keywords internal
read_ipynb <- function(input) {
  proc <- local_basiliskEnv(jupytext_env)
  basiliskRun(proc, function(input) {
    ## Import jupytext with auto-convert enabled
    jupytext <- reticulate::import("jupytext", convert = TRUE)
    jupytext$read(input)
  }, input = input)
}


# `local_` helpers for temporarily setting basilisk options -----------------------------------

local_basiliskEnv <- function(env, envir = parent.frame()) {
  proc <- basiliskStart(jupytext_env)
  withr::defer(basiliskStop(proc), envir = envir)
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
