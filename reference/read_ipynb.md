# Read ipynb files using jupytext's read() method

Calls the `jupytext.read` method from the [`jupytext`
API](https://jupytext.readthedocs.io/en/latest/using-library.html). The
ipynb data is loaded in memory as an R list, converted from the
underlying JSON data of the notebook.

## Usage

``` r
read_ipynb(input)
```

## Arguments

- input:

  File path to the input file to be read.

## Value

An R list containing the notebook data.
