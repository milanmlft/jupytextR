# jupytextR

<!-- badges: start -->

[![R-CMD-check](https://github.com/milanmlft/jupytextR/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/milanmlft/jupytextR/actions/workflows/R-CMD-check.yaml)
[![Codecov test coverage](https://codecov.io/gh/milanmlft/jupytextR/branch/main/graph/badge.svg)](https://app.codecov.io/gh/milanmlft/jupytextR?branch=main)
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)

<!-- badges: end -->

The goal of the _jupytextR_ package is to provide an R wrapper for the
[jupytext](https://github.com/mwouts/jupytext) Python library.

## Installation

You can install the development version of jupytextR from [GitHub](https://github.com/) with:

```r
# install.packages("pak")
pak::pak("milanmlft/jupytextR")
```

## Example

This is a basic example which shows you how to solve a common problem:

```r
library(jupytextR)

## Converting from Rmd to ipynb
jupytext("path/to/file.Rmd", to = "ipynb")

## Converting from ipynb to Rmd
jupytext("path/to/file.ipynb", to = "Rmd")
```
