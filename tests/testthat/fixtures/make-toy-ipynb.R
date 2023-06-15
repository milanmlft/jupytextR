## Write Jupyter notebook test fixture
nb_data <- toy_ipynb_data()
nb_file <- test_path("fixtures", "toy.ipynb")
jsonlite::write_json(nb_data, nb_file, auto_unbox = TRUE, pretty = TRUE)
