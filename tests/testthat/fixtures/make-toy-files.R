## Write Jupyter notebook test fixture
nb_data <- toy_ipynb_data()
nb_file <- test_path("fixtures", "toy.ipynb")
jsonlite::write_json(nb_data, nb_file, auto_unbox = TRUE, pretty = TRUE)

## Write Markdown test fixture
rmd_data <- "
Hi **Markdown**!

```{r}
print(\"Hi R Markdown!\")
```
"
rmd_file <- test_path("fixtures", "toy.Rmd")
writeLines(rmd_data, rmd_file)
