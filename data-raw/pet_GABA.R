## code to prepare `pet.GABAABZ` dataset goes here

data.dir <- "./inst/extdata/PET_atlas_data/"

pet.GABAABZ <- list("lh" = freesurferformats::read.fs.morph(paste0(data.dir, "lh.GABAABZ.norgaard.fsaverage6.mgh")),
                    "rh" = freesurferformats::read.fs.morph(paste0(data.dir, "rh.GABAABZ.norgaard.fsaverage6.mgh")))

pet.GABAABZ$lh[data::medial.wall.fsavg6$lh] <- NA
pet.GABAABZ$rh[data::medial.wall.fsavg6$rh] <- NA

usethis::use_data(pet.GABAABZ, overwrite = TRUE)
