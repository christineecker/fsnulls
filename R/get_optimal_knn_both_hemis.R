
#' get_optimal_knn_both_hemis
#'
#' Gets optimal knn for both hemispheres
#'
#' @param fs.overlay DESCRIPTION.
#' @param hemi Either "lh", "rh", or "both"
#' @param knn.tested Vector with knn values to be tested
#' @param n.surr DESCRIPTION.
#' @param n.jobs DESCRIPTION.
#' @param write.dir DESCRIPTION.
#' @param kernel DESCRIPTION.
#' @param ns DESCRIPTION.
#' @param pv DESCRIPTION.
#' @param resample DESCRIPTION.
#'
#' @export
#' @return Optimal knn
#' @examples
#' # ADD_EXAMPLES_HERE
get_optimal_knn_both_hemis <- function(fs.overlay,
                                       hemi,
                                       knn.tested = c(1000L, 2000L),
                                       n.surr = 100L,
                                       n.jobs = 10L,
                                       write.dir = NULL,
                                       kernel = "gaussian",
                                       ns = 500L,
                                       pv = 70L,
                                       resample = TRUE)
{

  ##| Fit Variograms
  ##| --------------------------------------------------------

  fit <- list("lh" = NULL, "rh" = NULL)
  if (hemi == "both") {

    ##| split hemispheres
    ##|
    fs.overlay <- split_fs_overlay(fs.overlay)

    ##| left hemisphere
    ##|
    for (i in 1:length(knn.tested)) {
      fit$lh[[i]] <-
        get_variogram_fit(
          fs.overlay = fs.overlay$lh,
          hemi = "lh",
          n.surr = n.surr,
          knn.tested = knn.tested[i],
          n.jobs = n.jobs
        )
      if (i > 1 && fit$lh[[i]]$NRMSE > fit$lh[[i - 1]]$NRMSE)
        break
    }

    ##| right hemisphere
    ##|
    for (i in 1:length(knn.tested)) {
      fit$rh[[i]] <-
        get_variogram_fit(
          fs.overlay = fs.overlay$rh,
          hemi = "rh",
          n.surr = n.surr,
          knn.tested = knn.tested[i],
          n.jobs = n.jobs
        )
      if (i > 1 && fit$rh[[i]]$NRMSE > fit$rh[[i - 1]]$NRMSE)
        break
    }

    ##| find optimal knn
    ##|
    knn.index <- sapply(sa, function(hemi) {
      NRMSE <- sapply(hemi, function(x) {x$NRMSE})
      index <- which(NRMSE == min(NRMSE))
    })
    knn.optimal <- sapply(knn.index, function(x) {knn.tested[x]})

  } else {

    ##| either hemisphere
    ##|
    for (i in 1:length(knn.tested)) {
      fit[[i]] <-
        get_variogram_fit(
          fs.overlay = fs.overlay,
          hemi = hemi,
          n.surr = n.surr,
          knn.tested = knn.tested[i],
          n.jobs = n.jobs
        )
      if (i > 1 && fit[[i]]$NRMSE > fit[[i - 1]]$NRMSE)
        break
    }

    ##| find optimal knn
    ##|
    NRMSE <- sapply(fit, function(x) {x$NRMSE})
    knn.optimal <- knn.tested.new[which(NRMSE == min(NRMSE))]
  }

  return(knn.optimal)
}

################################################################################
#                                                                              #
#                                   Testing                                    #
#                                                                              #
################################################################################

# fs.overlay <- c(fsdata::pet.5HT$`5HT1A`$lh, fsdata::pet.5HT$`5HT1A`$rh)
# fs.overlay[fsdata::fsavg6$medial.wall.verts$both] <- NA
# knn.optimal <- get_optimal_knn_both_hemis(fs.overlay, "both", c(500L, 1000L), 10L)
# knn.optimal
