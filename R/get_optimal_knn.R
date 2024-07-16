
#' get_optimal_knn
#'
#' Returns optimal knn across Variogram fits on the basis of normalized root mean squared error
#'
#' @note Uses `get_variogram_fit.R` and `plot_variogram_fit.R`
#'
#' @param fs.overlay DESCRIPTION.
#' @param hemi Either "lh" or "rh"
#' @param knn.tested DESCRIPTION.
#' @param n.surr DESCRIPTION.
#' @param n.jobs DESCRIPTION.
#' @param write.dir DESCRIPTION.
#' @param kernel Either "gaussian" or "exponential".
#' @param ns DESCRIPTION.
#' @param pv DESCRIPTION.
#' @param resample DESCRIPTION.
#'
#' @export
#'
#' @import ggplot2
#'
#' @return RETURN_DESCRIPTION
#' @examples
#' fs.overlay <- c(fsdata::pet.5HT$`5HT1A`$lh)
#' knn.optimal <- get_optimal_knn(fs.overlay, knn.tested = c(500, 600), write.dir = "~/Desktop/Variograms")
#' knn.optimal <- get_optimal_knn(fs.overlay, knn.tested = c(500, 600))
#'
get_optimal_knn <- function(fs.overlay,
                            hemi,
                            knn.tested,
                            n.surr,
                            n.jobs,
                            write.dir = NULL,
                            kernel = "gaussian",
                            ns = 500,
                            pv = 70,
                            resample = TRUE
                            ) {

  ################################ Fit Variograms ################################

  if (!dir.exists(write.dir)) {
    dir.create(write.dir, recursive = TRUE)
    print(paste("Directory created:", write.dir))
  }

  fit <- list()
  for (i in 1:length(knn.tested)) {
    fit[[i]] <-
      get_variogram_fit(
        fs.overlay = fs.overlay,
        hemi = hemi,
        n.surr = n.surr,
        knn.tested = knn.tested[i],
        n.jobs = n.jobs
      )
    save(fit, file = paste0(write.dir, "knn", knn.tested[i], ".variogram.fits.rda"))
    if (i > 1 && fit[[i]]$NRMSE > fit[[i - 1]]$NRMSE)
      break
  }
  knn.tested.new <- knn.tested[1:length(fit)]
  names(fit) <- paste0("knn", knn.tested.new)

  ############################ Create Variogram Plots ############################

  if (is.null(write.dir) == FALSE) {
    fsdata::printf("\nCreating Variogram plots ...")
    for (i in 1:length(knn.tested.new)){
      title <- paste0("knn = ", knn.tested.new[i], ", NRMSE = ", round(fit[[i]]$NRMSE, digits = 2))
      variogram.plot <- plot_variogram_fit(fit[[i]], title)
      print(variogram.plot)
      ggplot2::ggsave(
        paste0(write.dir, "knn", knn.tested.new[i], ".pdf"),
        variogram.plot,
        dpi = 300,
        width = 5,
        height = 4,
        units = "cm",
        device = cairo_pdf
      )
    }
  }

  ############################# Identify optimal knn #############################

  NRMSE <- sapply(fit, function(x) {x$NRMSE})
  knn.optimal <- knn.tested.new[which(NRMSE == min(NRMSE))]

  if (is.null(write.dir) == FALSE) {
    df <- data.frame("NRMSE" = NRMSE, "knn" = knn.tested.new)
    variogram.fit.plot <- ggplot(data = df, aes(x = knn, y = NRMSE))
    variogram.fit.plot <- apply_theme_nature(variogram.fit.plot,
                                             base.size = 7,
                                             line.size = 0.1)
    variogram.fit.plot <- variogram.fit.plot +
      geom_line(color = "skyblue3",
                linewidth = 0.5,
                alpha = 0.75) +
      labs(title = "Variogram Fits")
    print(variogram.fit.plot)
    ggplot2::ggsave(
      paste0(write.dir, "Variogram_fits.pdf"),
      variogram.fit.plot,
      dpi = 300,
      width = 5,
      height = 4,
      units = "cm",
      device = cairo_pdf
    )
  }

  fsdata::printf("\nThe optimal knn for the %s hemisphere is: %d\n", hemi, knn.optimal)

  return(knn.optimal)
}

################################################################################
#                                                                              #
#                                   Testing                                    #
#                                                                              #
################################################################################

# fs.overlay <- c(fsdata::pet.5HT$`5HT1A`$lh)
# fs.overlay[fsdata::fsavg6$medial.wall.verts$lh] <- NA
# knn.optimal <-
#   get_optimal_knn(
#     fs.overlay,
#     hemi = "lh",
#     knn.tested = c(500, 1000),
#     n.surr = 20,
#     n.jobs = 10,
#     write.dir = "~/Desktop/Variograms"
#   )

