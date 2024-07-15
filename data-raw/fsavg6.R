## code to prepare `fsavg6` dataset goes here

## fsaverage6 ------------------------------------------

fsavg6 <- list()
fsavg6 <- list(
  "orig" = list(
    "lh" = fsbrain::subject.surface('./inst/extdata', 'fsaverage6', 'orig', 'lh'),
    "rh" = fsbrain::subject.surface('./inst/extdata', 'fsaverage6', 'orig', 'rh')
  ),
  "pial" = list(
    "lh" = fsbrain::subject.surface('./inst/extdata', 'fsaverage6', 'pial', 'lh'),
    "rh" = fsbrain::subject.surface('./inst/extdata', 'fsaverage6', 'pial', 'rh')
  ),
  "white" = list(
    "lh" = fsbrain::subject.surface('./inst/extdata', 'fsaverage6', 'white', 'lh'),
    "rh" = fsbrain::subject.surface('./inst/extdata', 'fsaverage6', 'white', 'rh')
  ),
  "nverts" = 40962,
  "medial.wall.verts" = list(
    "lh" = freesurferformats::read.fs.label('inst/extdata/fsaverage6/label/lh.Medial_wall.label'),
    "rh" = freesurferformats::read.fs.label('inst/extdata/fsaverage6/label/rh.Medial_wall.label'),
    "both" = vector()
  ),
  "cortex.verts" = list(
    "lh" = vector(),
    "rh" = vector(),
    "both" = vector()
  )
)

## identify medial wall vertices
fsavg6$medial.wall.verts$both <- c(fsavg6$medial.wall.verts$lh, fsavg6$medial.wall.verts$rh + fsavg6$nverts)

## identify cortex vertices
fsavg6$cortex.verts$lh <- seq(1:fsavg6$nverts)[-fsavg6$medial.wall.verts$lh]
fsavg6$cortex.verts$rh <- seq(1:fsavg6$nverts)[-fsavg6$medial.wall.verts$rh]
fsavg6$cortex.verts$both <- seq(1:(2*fsavg6$nverts))[-fsavg6$medial.wall.verts$both]

usethis::use_data(fsavg6, overwrite = TRUE)
