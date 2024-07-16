
#' plot_variogram_fit
#'
#' Creates variogram plot of observed and fitted data
#'
#' @note Uses `apply_theme_nature function`
#'
#' @param fit DESCRIPTION.
#' @param title DESCRIPTION.
#'
#' @export
#'
#' @return RETURN_DESCRIPTION
#' @examples
#' # ADD_EXAMPLES_HERE
plot_variogram_fit <- function(fit, title, base.size = 7, line.size = 0.1, font = "Calibri Light") {

  ############################## create data.table ###############################

  #sae <- sum(abs(fit[[1]] - colMeans(fit[[3]])))
  sd <- apply(fit[[3]], 2, sd)
  df <- data.frame("observed" = fit[[1]],
                   "distance" = fit[[2]],
                   "predicted" = colMeans(fit[[3]]),
                   "ymin" = colMeans(fit[[3]]) - sd,
                   "ymax" = colMeans(fit[[3]]) + sd)

  ################################# create plot ##################################

  p <- ggplot2::ggplot(df)
  p <- apply_theme_nature(p, base.size, line.size, font)
  p <- p +
    geom_point(aes(x = distance, y = observed),
               color = "grey30",
               size = 0.1) +
    geom_line(aes(x = distance, y = predicted),
              color = "#1c69af",
              alpha = 0.75) +
    xlab("Spatial separation distance") +
    ylab("Variance") +
    geom_ribbon(
      aes(
        x = distance,
        y = predicted,
        ymax = ymax,
        ymin = ymin
      ),
      alpha = 0.15,
      fill = "#1c69af"
    )
    #labs(title = title)

  return(p)
}

################################################################################
#                                                                              #
#                                   Testing                                    #
#                                                                              #
################################################################################

