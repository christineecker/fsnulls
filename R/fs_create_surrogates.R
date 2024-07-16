
#' fs_create_surrogates
#'
#' Creates surrogates for let and right hemispheres
#'
#' @note Uses `./inst/python/create_surrogates_py.py`
#'
#' @param fs.overlay Vertex-overlay (41K or fsaverage6) with NAs in medial wall label.
#' @param hemi Either 'lh', 'rh', or 'both'
#' @param knn Vector of knn for left and right hemishere, e.g., c(1000L, 1000L)
#' @param n.surr Number of surrogates to create
#' @param n.cores DESCRIPTION.
#' @param kernel Either "gaussian" (default) or "exp" (expontential)
#'
#' @export
#'
#' @return RETURN_DESCRIPTION
#' @examples
#' # ADD_EXAMPLES_HERE
fs_create_surrogates <- function(fs.overlay,
                                 hemi,
                                 knn,
                                 n.surr,
                                 n.cores = 10L,
                                 kernel = "gaussian")
{
  ##| specify directories and scripts ------------------------------------------

  # directory for files required by BrainSMASH (e.g. distmat_lh.npy & index_lh.npy)
  #brainsmash.dir <- "./inst/extdata/BrainSMASH/"
  brainsmash.dir <- system.file("extdata/BrainSMASH/", package = "fsnulls")

  # directory for storing FreeSurfer overlay file
  tmp.data.dir <- tempdir()
  tmp.filename <- paste0(tmp.data.dir, "/fs.tmp.gii")

  ## source python script ------------------------------------------

  python.dir <- system.file("python/", package = "fsnulls")
  py.script <- paste0(python.dir, "/create_surrogates_py.py")
  reticulate::source_python(py.script)

  ##| Create surrogates ------------------------------------------

  if (hemi == "both") {

    ##| split hemispheres
    ##|
    fs.overlay <- split_fs_overlay(fs.overlay)

    ##| left Hemisphere
    ##|
    freesurferformats::write.fs.morph.gii(tmp.filename, fs.overlay$lh)
    hemi <- "lh"
    create_surrogates_py(tmp.data.dir,
                         brainsmash.dir,
                         hemi,
                         knn[1],
                         kernel,
                         n.surr,
                         n.cores)
    sa.lh <- as.matrix(data.table::fread(paste0(tmp.data.dir, "/surrogates.csv")))
    unlink(tmp.filename)


    ##| Right Hemisphere
    ##|
    hemi <- "rh"
    freesurferformats::write.fs.morph.gii(tmp.filename, fs.overlay$rh)
    create_surrogates_py(tmp.data.dir,
                         brainsmash.dir,
                         hemi,
                         knn[2],
                         kernel,
                         n.surr,
                         n.cores)
    sa.rh <- as.matrix(data.table::fread(paste0(tmp.data.dir, "/surrogates.csv")))
    unlink(tmp.filename)

    ##| Smooth data
    ##|
    options("mc.cores" = parallel::detectCores()-2)
    lh.mesh.adj <- haze::mesh.adj(fsavg6$orig$lh, k = 1L)
    rh.mesh.adj <- haze::mesh.adj(fsavg6$orig$rh, k = 1L)
    sa.fwhm1.lh <- haze::pervertexdata.smoothnn.adj(lh.mesh.adj, sa.lh, num_iter = 1L)
    sa.fwhm1.rh <- haze::pervertexdata.smoothnn.adj(rh.mesh.adj, sa.rh, num_iter = 1L)

    sa.fwhm1 <- cbind(sa.fwhm1.lh, sa.fwhm1.rh)
    attr(sa.fwhm1, "dimnames") <- NULL

  } else {

    ##| Create surrogates
    ##|
    freesurferformats::write.fs.morph.gii(tmp.filename, fs.overlay)
    create_surrogates_py(tmp.data.dir,
                         brainsmash.dir,
                         hemi,
                         knn[1],
                         kernel,
                         n.surr,
                         n.cores)
    sa <- as.matrix(data.table::fread(paste0(tmp.data.dir, "/surrogates.csv")))

    ##| Smooth data
    ##|
    options("mc.cores" = n.cores)
    if (hemi == "lh") {
      mesh.adj <- haze::mesh.adj(fsavg6$orig$lh, k = 1L)
    } else {
      mesh.adj <- haze::mesh.adj(fsavg6$orig$rh, k = 1L)
    }
    sa.fwhm1 <- haze::pervertexdata.smoothnn.adj(mesh.adj, sa, num_iter = 1L)
    attr(sa.fwhm1, "dimnames") <- NULL

  }

  file.remove(paste0(tmp.data.dir, "/surrogates.csv"))

  return(sa.fwhm1)
}

################################################################################
#                                                                              #
#                                   Testing                                    #
#                                                                              #
################################################################################

# fs.overlay <- c(fsdata::pet.5HT$`5HT1A`$lh)
# fs.overlay[fsdata::fsavg6$medial.wall.verts$lh] <- NA
# sa <- fs_create_surrogates(fs.overlay,
#                            "lh",
#                            c(1000L),
#                            10L,
#                            n.cores = 10L,
#                            kernel = "gaussian")
