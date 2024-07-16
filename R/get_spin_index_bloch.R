
#' get_spin_index_bloch
#'
#' Wrapper for neuromaps alexander_bloch function to create spin vertices.
#'
#' @param data DESCRIPTION.
#' @param atlas DESCRIPTION.
#' @param density DESCRIPTION.
#' @param n_perm DESCRIPTION.
#'
#' @export
#'
#' @return Returns n.spins x n.verts matrix of spin indices for both hemispheres
#' @examples
#' # ADD_EXAMPLES_HERE
get_spin_index_bloch <- function(data = "None",
                                 atlas = "fsaverage",
                                 density = "41k",
                                 n.spins = 10L)
{
  nulls <- import("neuromaps.nulls")
  spins <- nulls$alexander_bloch(data = cat(data), atlas = atlas, density = density, n_perm = n.spins)
  spins <- spins + 1 # Note. add 1 as python index starts with zero

  return(t(spins))
}
