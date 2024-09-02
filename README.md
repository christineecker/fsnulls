
# fsnulls

<!-- badges: start -->
<!-- badges: end -->

This repository contains metadata and functions to create spatial null models for FreeSurfer surface data. Many of these functions are wrappers for the `BrainSMASH` and `neuromaps` toolboxes.

## Installation

The package relies on `python` and the python toolboxes [BrainSMASH](https://brainsmash.readthedocs.io/en/latest/) and [neuromaps](https://netneurolab.github.io/neuromaps/index.html). These need to be installed prior to the `fsnulls` package. Also, you have to initiate python in R using the `reticulate` package, and based on your particular python installation.

These can be specified in the `.Rprofile` file, e.g., 

```{r}
if (benchmarkme::get_cpu()$model_name == "Apple M1 Max") {
  Sys.setenv(RETICULATE_PYTHON = "/Users/sphache/miniconda3/bin/python")
} else {
  Sys.setenv(RETICULATE_PYTHON = "/opt/anaconda3/bin/python")
}

library(reticulate)
reticulate::py_config()
````

```r
python.path <- "/opt/anaconda3/bin/python"
reticulate::use_python(python.path)
```
