## Construct toy Jupyter notebook from JSON data
toy_ipynb_data <- function() {
  list(
    cells = structure(list(
      attachments = structure(
        list(),
        names = character(0), class = "data.frame", row.names = c(NA, -2L)
      ),
      cell_type = c("markdown", "code"),
      metadata = structure(list(), names = character(0), class = "data.frame", row.names = c(NA, -2L)),
      source = list("Hi **Markdown**!", "print(\"Hi R Markdown!\")"),
      execution_count = c(NA, NA), outputs = list(NULL, list())
    ), class = "data.frame", row.names = 1:2),
    metadata = list(kernelspec = list(
      display_name = "base",
      language = "python", name = "python3"
    ), language_info = list(
      codemirror_mode = list(name = "ipython", version = 3L),
      file_extension = ".py", mimetype = "text/x-python", name = "python",
      nbconvert_exporter = "python", pygments_lexer = "ipython3",
      version = "3.10.9"
    ), orig_nbformat = 4L), nbformat = 4L,
    nbformat_minor = 2L
  )
}

## Write Jupyter notebook test fixture
nb_data <- toy_ipynb_data()
nb_file <- test_path("fixtures", "toy.ipynb")
jsonlite::write_json(nb_data, nb_file, auto_unbox = TRUE, pretty = TRUE)

## Write Markdown test fixture
rmd_data <- "Hi **Markdown**!

```{r}
print(\"Hi R Markdown!\")
```
"
rmd_file <- test_path("fixtures", "toy2.Rmd")
writeLines(rmd_data, rmd_file)
