
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

Document package

```shell
devtools::document()
```
