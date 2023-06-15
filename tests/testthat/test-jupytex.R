toy_nb_file <- test_path("fixtures", "toy.ipynb")

test_that("Reading jupyter notebooks works", {
    res <- .read(input = toy_nb_file)

    expect_type(res, "environment")
    expect_s3_class(res, "nbformat.notebooknode.NotebookNode")

    expect_equal(get_cell_source(res, 1), "Hi **Markdown**!")
    expect_equal(get_cell_source(res, 2), "print(\"Hi R Markdown!\")")
})

test_that("Writing jupyter notebooks works", {
    nb_obj <- .read(input = toy_nb_file)
    out_file <- tempfile(fileext = ".ipynb")
    .write(nb_obj, out_file)

    expect_true(file.exists(out_file))
})
