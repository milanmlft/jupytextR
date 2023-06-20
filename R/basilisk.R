.jupytext_dependencies <- c(
    "attrs==23.1.0", "fastjsonschema==2.17.1", "importlib-metadata==6.7.0",
    "importlib-resources==5.12.0", "jsonschema==4.17.3", "jupyter_core==5.3.1",
    "jupytext==1.14.6", "markdown-it-py==2.2.0", "mdit-py-plugins==0.4.0",
    "mdurl==0.1.0", "nbformat==5.9.0", "pip==23.1.2", "pkgutil_resolve_name==1.3.10",
    "platformdirs==3.6.0", "pyrsistent==0.19.3", "PyYAML==6.0", "setuptools==67.7.2",
    "toml==0.10.2", "traitlets==5.9.0", "typing_extensions==4.6.3",
    "wheel==0.40.0", "zipp==3.15.0"
)

#' @importFrom basilisk BasiliskEnvironment
jupytext_env <- BasiliskEnvironment(
    envname = "env",
    pkgname = "jupytext",
    packages = .jupytext_dependencies
)
