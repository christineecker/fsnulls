
# fsnulls

<!-- badges: start -->
<!-- badges: end -->

This repository contains metadata and functions to create spatial null models for FreeSurfer surface data. Many of these functions are wrappers for functions provided by the `BrainSMASH` and `neuromaps` toolboxes.

## Installation

The package relies on a working installation of `python`, we well as the python toolboxes [BrainSMASH](https://brainsmash.readthedocs.io/en/latest/) and [neuromaps](https://netneurolab.github.io/neuromaps/index.html). These need to be installed prior to the `fsnulls` package. Also, you have to initiate python in R using the `reticulate` package.

These can be specified in the `.Rprofile` file, e.g., 

```{r}
if (benchmarkme::get_cpu()$model_name == "Apple M1 Max") {
  Sys.setenv(RETICULATE_PYTHON = "/Users/sphache/miniconda3/bin/python")
} else {
  Sys.setenv(RETICULATE_PYTHON = "/opt/anaconda3/bin/python")
}

library(reticulate)
reticulate::py_config()
```

or

```r
python.path <- "/opt/anaconda3/bin/python"
reticulate::use_python(python.path)
```

## Downloading the repository

Given the large amount of metadata that is contained within the package, it uses `git annex` to store the data on a remove repository other than github. You therefore also need to install (datalad)[https://www.datalad.org], which can be used to clone the repository and to download the data. 

To clone the repository, use

```{bash}
datalad clone https://github.com/christineecker/fsnulls.git
```

To download the data, use

```{bash}
datalad get data/
datalad get inst/extdata
# etc.
```

