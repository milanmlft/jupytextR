local_basiliskEnv <- function(env, envir = parent.frame()) {
    proc <- basiliskStart(jupytext_env)
    withr::defer(basiliskStop(proc),  envir = envir)
    proc
}
