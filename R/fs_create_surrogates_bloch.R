
#' fs_create_spins_bloch
#'
#' Creates n.spins x n.verts matrix of rotated data
#'
#' @param fs.overlay FreeSurfer overlay for both hemispheres
#' @param n.spins DESCRIPTION.
#'
#' @export
#'
#' @return n.spins x n.verts matrix of rotated data
#' @examples
#' # ADD_EXAMPLES_HERE
fs_create_spins_bloch <- function(fs.overlay,
                                  n.spins)
{
  ##| get spin index --------------------------------------------------------
  ##|
  spin.index <- spin.index <- get_spin_index_bloch(
    data = "None",
    atlas = "fsaverage",
    density = "41k",
    n.spins = n.spins
  )

  ##| create spin overlays --------------------------------------------------------
  ##|
  spins <- list()
  spins <- lapply(1:n.spins, function(i) { fs.overlay[spin.index[i,]] }) %>%
    do.call(rbind, .)

  return(spins)
}

################################################################################
#                                                                              #
#                                   Testing                                    #
#                                                                              #
################################################################################

# fs.overlay <- c(pet.5HT$`5HT1A`$lh, pet.5HT$`5HT1A`$rh)
# spins <- fs_create_spins_bloch(fs.overlay, 10L)
# fs_plot(spins[1,])
