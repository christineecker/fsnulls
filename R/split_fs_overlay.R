
#' split_fs_overlay
#'
#' Splits FreeSurfer overlay into two hemispheres.
#'
#' @param fs.overlay DESCRIPTION.
#'
#' @export
#'
#' @return List with $lh and $rh subdata
#' @examples
#' # ADD_EXAMPLES_HERE
split_fs_overlay <- function(fs.overlay){

  n <- length(fs.overlay)

  fs.overlay.lhrh <- list("lh" = fs.overlay[1:(n/2)],
                          "rh" = fs.overlay[((n/2)+1):n])

  return(fs.overlay.lhrh)
}
