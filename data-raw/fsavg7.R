## code to prepare `fsavg7` dataset goes here

## fsaverage6 ------------------------------------------

fsavg7 <- list()
fsavg7 <- list(
  "orig" = list(
    "lh" = fsbrain::subject.surface('./inst/extdata', 'fsaverage', 'orig', 'lh'),
    "rh" = fsbrain::subject.surface('./inst/extdata', 'fsaverage', 'orig', 'rh')
  ),
  "pial" = list(
    "lh" = fsbrain::subject.surface('./inst/extdata', 'fsaverage', 'pial', 'lh'),
    "rh" = fsbrain::subject.surface('./inst/extdata', 'fsaverage', 'pial', 'rh')
  ),
  "white" = list(
    "lh" = fsbrain::subject.surface('./inst/extdata', 'fsaverage', 'white', 'lh'),
    "rh" = fsbrain::subject.surface('./inst/extdata', 'fsaverage', 'white', 'rh')
  ),
  "nverts" = 163842,
  "medial.wall.verts" = list(
    "lh" = freesurferformats::read.fs.label('inst/extdata/fsaverage/label/lh.Medial_wall.label'),
    "rh" = freesurferformats::read.fs.label('inst/extdata/fsaverage/label/rh.Medial_wall.label'),
    "both" = vector()
  ),
  "cortex.verts" = list(
    "lh" = vector(),
    "rh" = vector(),
    "both" = vector()
  )
)

## identify medial wall vertices
fsavg7$medial.wall.verts$both <- c(fsavg7$medial.wall.verts$lh, fsavg7$medial.wall.verts$rh + fsavg7$nverts)

## identify cortex vertices
fsavg7$cortex.verts$lh <- seq(1:fsavg7$nverts)[-fsavg7$medial.wall.verts$lh]
fsavg7$cortex.verts$rh <- seq(1:fsavg7$nverts)[-fsavg7$medial.wall.verts$rh]
fsavg7$cortex.verts$both <- seq(1:(2*fsavg7$nverts))[-fsavg7$medial.wall.verts$both]

usethis::use_data(fsavg7, overwrite = TRUE)
