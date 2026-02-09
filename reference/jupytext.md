# Convert Jupyter Notebooks to (R)Markdown, Julia, Python or R scripts and vice-versa

`juptext()` provides a convenient R wrapper for the Python [`jupytext`
API](https://jupytext.readthedocs.io/en/latest/using-library.html)
allowing the user to convert between any of the [supported
formats](https://jupytext.readthedocs.io/en/latest/formats.html) from
within R.

## Usage

``` r
jupytext(input, to, output = .with_ext(input, to), quiet = FALSE)
```

## Arguments

- input:

  File path to the input file.

- to:

  The format to convert to, should be a file extension for any of the
  [Supported
  Languages](https://jupytext.readthedocs.io/en/latest/languages.html).
  Ignored if `output` is specified

- output:

  The full path to where the converted file should be written. The
  format is derived from the file extension of `output`. Takes
  precedence over `to`. By default, the output file path is set by
  taking the `input` file path and replacing the file extension with
  `to`.

- quiet:

  Logical, whether to show an informative message about which file is
  getting converted.

## Value

The file path to the output file, invisibly. This function is mainly
called for its side effects.

## Details

Internally, this function calls the Python `jupytext.read` on the input
file and then writes it to the desired format using `jupytext.write`,
using the [`jupytext`
API](https://jupytext.readthedocs.io/en/latest/using-library.html).

## Examples

```` r
library(jupytextR)

## Create toy RMarkdown file
rmd_data <- "Hi **Markdown**!

```{r}
print(\"Hi R Markdown!\")
```
"
rmd_file <- tempfile(fileext = ".Rmd")
writeLines(rmd_data, rmd_file)

## Convert Rmd file to a jupyter notebook
jupytext(rmd_file, to = "ipynb")
#> Installing pyenv ...
#> Done! pyenv has been installed to '/home/runner/.local/share/r-reticulate/pyenv/bin/pyenv'.
#> Using Python: /home/runner/.pyenv/versions/3.10.19/bin/python3.10
#> Creating virtual environment '/home/runner/.cache/R/basilisk/1.22.0/jupytextR/0.1.1/env' ... 
#> + /home/runner/.pyenv/versions/3.10.19/bin/python3.10 -m venv /home/runner/.cache/R/basilisk/1.22.0/jupytextR/0.1.1/env
#> Done!
#> Installing packages: pip, wheel, setuptools
#> + /home/runner/.cache/R/basilisk/1.22.0/jupytextR/0.1.1/env/bin/python -m pip install --upgrade pip wheel setuptools
#> Installing packages: 'jupytext==1.14.6', 'nbformat==5.9.0', 'toml==0.10.2', 'PyYAML==6.0', 'markdown-it-py==2.2.0', 'mdit-py-plugins==0.4.0'
#> + /home/runner/.cache/R/basilisk/1.22.0/jupytextR/0.1.1/env/bin/python -m pip install --upgrade --no-user 'jupytext==1.14.6' 'nbformat==5.9.0' 'toml==0.10.2' 'PyYAML==6.0' 'markdown-it-py==2.2.0' 'mdit-py-plugins==0.4.0'
#> Virtual environment '/home/runner/.cache/R/basilisk/1.22.0/jupytextR/0.1.1/env' successfully created.
#> Converting /tmp/RtmpSyucHw/file1c234c98ddc.Rmd to /tmp/RtmpSyucHw/file1c234c98ddc.ipynb
````
