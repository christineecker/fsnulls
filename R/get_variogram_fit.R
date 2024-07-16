
#' get_variogram_fit.R
#'
#' Estimates model fit for a single knn
#'
#' @note Uses `get_variogram_fit_py` in `/inst/python/`
#' @note Requires BrainSMASH directory with precomputed Geodesic Distance Matrix
#'
#' @param fs.overlay DESCRIPTION.
#' @param hemi DESCRIPTION.
#' @param n.surr Number of models to test
#' @param knn.tested Integer of knn to be tested
#' @param n.jobs Number of cores.
#' @param kernel DESCRIPTION.
#' @param ns Default value 500
#' @param pv Default value 70
#' @param resample Either true of false; default = T
#'
#' @export
#'
#' @return RETURN_DESCRIPTION
#' @examples
#' fit <- fsdecode::get_variogram_fit(data::pet.5HT$`5HT1A`$lh, hemi = "lh", n.surr = 10, knn.tested = 1000L, n.jobs = 15)
#'
get_variogram_fit <-
  function(fs.overlay,
           hemi,
           n.surr,
           knn.tested,
           n.jobs,
           kernel = "gaussian",
           ns = 500,
           pv = 70,
           resample = TRUE)
{

    ## Set directories and source python script ------------------------------------------

    # directory for files required by BrainSMASH (e.g. distmat_lh.npy & index_lh.npy)
    #brainsmash.dir <- "./inst/extdata/BrainSMASH/"
    brainsmash.dir <- system.file("extdata/BrainSMASH/", package = "fsnulls")

    ## Source python script ------------------------------------------

    python.dir <- system.file("python/", package = "fsnulls")
    py.script <- paste0(python.dir, "/get_variogram_fit_py.py")
    reticulate::source_python(py.script)

    ## Write overlay to file ------------------------------------------

    tmp.data.dir <- tempdir()
    tmp.filename <- paste0(tmp.data.dir, "/fs.tmp.gii")
    freesurferformats::write.fs.morph.gii(tmp.filename, fs.overlay)

    ############################## get Variogram fit ###############################

    fit <- get_variogram_fit_py(tmp.data.dir, brainsmash.dir, hemi, kernel, knn.tested, ns, pv, resample, n.surr, n.jobs )
    names(fit) <- c("observed", "distance", "predicted")
    fit$NRMSE <- sqrt(mean((fit$observed - colMeans(fit$predicted))^2, na.rm = T)) / (max(fit$observed) - min(fit$observed))

    ## remove temporary file ------------------------------------------

    file.remove(paste0(tmp.data.dir, "/fs.tmp.gii"))

    ## return fit ------------------------------------------

    return(fit)

  }

################################################################################
#                                                                              #
#                                   Testing                                    #
#                                                                              #
################################################################################

# fs.overlay <- c(fsdata::pet.5HT$`5HT1A`$lh)
# fs.overlay[fsdata::fsavg6$medial.wall.verts$lh] <- NA
# fit <- get_variogram_fit(fs.overlay, hemi = "lh", n.surr = 50, n.jobs = 15, knn.tested = 1000L)
