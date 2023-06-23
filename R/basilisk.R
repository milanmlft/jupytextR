.jupytext_dependencies <- c(
    "python=3.10", "jupytext==1.14.6",
    "nbformat==5.9.0", "toml==0.10.2",
    "PyYAML==6.0", "markdown-it-py==2.2.0",
    "mdit-py-plugins==0.4.0"
)

#' @importFrom basilisk BasiliskEnvironment
jupytext_env <- BasiliskEnvironment(
    envname = "env",
    pkgname = "jupytext",
    packages = .jupytext_dependencies
)
