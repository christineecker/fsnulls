## code to prepare `pet.5HT` dataset goes here

data.dir <- "./inst/extdata/PET_atlas_data/"

lh.5HT1A <- freesurferformats::read.fs.morph(paste0(data.dir, "lh.5HT1A.beliveau.fsaverage6.mgh"))
rh.5HT1A <- freesurferformats::read.fs.morph(paste0(data.dir, "rh.5HT1A.beliveau.fsaverage6.mgh"))

lh.5HT1B <- freesurferformats::read.fs.morph(paste0(data.dir, "lh.5HT1B.beliveau.fsaverage6.mgh"))
rh.5HT1B <- freesurferformats::read.fs.morph(paste0(data.dir, "rh.5HT1B.beliveau.fsaverage6.mgh"))

lh.5HT2A <- freesurferformats::read.fs.morph(paste0(data.dir, "lh.5HT2A.beliveau.fsaverage6.mgh"))
rh.5HT2A <- freesurferformats::read.fs.morph(paste0(data.dir, "rh.5HT2A.beliveau.fsaverage6.mgh"))

lh.5HT4 <- freesurferformats::read.fs.morph(paste0(data.dir, "lh.5HT4.beliveau.fsaverage6.mgh"))
rh.5HT4 <- freesurferformats::read.fs.morph(paste0(data.dir, "rh.5HT4.beliveau.fsaverage6.mgh"))

lh.5HTT <- freesurferformats::read.fs.morph(paste0(data.dir, "lh.5HTT.beliveau.fsaverage6.mgh"))
rh.5HTT <- freesurferformats::read.fs.morph(paste0(data.dir, "rh.5HTT.beliveau.fsaverage6.mgh"))

pet.5HT <- list(
  "5HT1A" = list("lh" = lh.5HT1A,
                 "rh" = rh.5HT1A),
  "5HT1B" = list("lh" = lh.5HT1B,
                 "rh" = rh.5HT1B),
  "5HT2A" = list("lh" = lh.5HT2A,
                 "rh" = rh.5HT2A),
  "5HT4" = list("lh" = lh.5HT4,
                "rh" = rh.5HT4),
  "5HTT" = list("lh" = lh.5HTT,
                "rh" = rh.5HTT)
)

usethis::use_data(pet.5HT, overwrite = TRUE)
