test_that("Converting from ipynb to Rmd works", {
    ipynb_file <- local_fixture("toy.ipynb")

    expect_message(
        res <- jupytext(input = ipynb_file, to = "Rmd", quiet = FALSE)
    )

    expect_true(file.exists(res))
})

test_that("Converting from R Markdown to ipynb works", {
    rmd_file <- local_fixture("toy2.Rmd")

    res <- jupytext(input = rmd_file, to = "ipynb", quiet = TRUE)
    expect_true(file.exists(res))

    ipynb_file <- read_ipynb(res)
    expect_type(ipynb_file, "environment")

    expect_equal(get_cell_source(ipynb_file, 1), "Hi **Markdown**!")
    expect_equal(get_cell_source(ipynb_file, 2), "print(\"Hi R Markdown!\")")
})

test_that("basiliskRun() calls behave correctly", {
    local_setBasiliskFork(FALSE)
    local_setBasiliskShared(FALSE)

    ipynb_file <- local_fixture("toy.ipynb")

    res <- jupytext(input = ipynb_file, to = "Rmd", quiet = TRUE)
    expect_true(file.exists(res))
})
