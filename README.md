
# fsnulls

<!-- badges: start -->
<!-- badges: end -->

The goal of fsnulls is to ...

## Package creation and maintenance

```r
usethis::create_package("~/Dropbox/myRpackages/fsnulls")
usethis::use_readme_md() # Note. needs to be .md NOT .Rmd
```

Initiate `datalad` repository 

```shell
cd ~/Dropbox/myRpackages/fsnulls
datalad create -c text2git -d . --force
```
Note. `-c text2git` does not move .txt files to annex

Initial commit:

```shell
datalad save -m "package structure created"
```

Document package and load functions:

```r
devtools::document()
devtools::load_all()
```

## Installation

The package relies on `python` and the python toolboxes `BrainSMASH` and `neuromaps`. These need to be installed prior to the `fsnulls` package. Also, you have to initiate python in R using the `reticulate` package, and based on your python installation path, e.g.,

```r
python.path <- "/opt/anaconda3/bin/python"
reticulate::use_python(python.path)
```

## Notes

## 17.07.2024

- it is not necessary to unlock files prior to installing the package. This is taken care of by `datalad`

## 15.07.2024

```shell
datalad run --explicit \
-m 'run test script' \
-i './inst/extdata/**' \
-o './output/PET_surrogates/*' \
'Rscript scripts/create_surrogates_for_PET_maps.R'  
```
