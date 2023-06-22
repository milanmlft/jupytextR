test_that("Converting from ipynb to Rmd works", {
    tempdir <- withr::local_tempdir()
    restore_fixtures(tempdir)
    ipynb_file <- file.path(tempdir, "toy.ipynb")

    res <- jupytext(input = ipynb_file, to = "Rmd", quiet = TRUE)
    expect_equal(res, file.path(tempdir, "toy.Rmd"))
    expect_true(file.exists(res))
})

test_that("Converting from R Markdown to ipynb works", {
    tempdir <- withr::local_tempdir()
    restore_fixtures(tempdir)
    rmd_file <- file.path(tempdir, "toy2.Rmd")

    expect_message(
        res <- jupytext(input = rmd_file, to = "ipynb", quiet = FALSE),
        paste("Converting", rmd_file, "to", .with_ext(rmd_file, "ipynb"))
    )
    expect_equal(res, file.path(tempdir, "toy2.ipynb"))
    expect_true(file.exists(res))

    res <- read_ipynb(res)
    expect_type(res, "list")

    expect_equal(get_cell_source(res, 1), "Hi **Markdown**!")
    expect_equal(get_cell_source(res, 2), "print(\"Hi R Markdown!\")")
})

