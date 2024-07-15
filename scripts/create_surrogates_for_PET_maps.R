

##| 5HTR2A --------------------------------------------------------
##|

fs.overlay <- c(pet.5HT$`5HT2A`$lh,
                pet.5HT$`5HT2A`$rh)
fs.overlay[fsavg6$medial.wall.verts$both] <- NA

sa.5HT2A <- fs_create_surrogates(
  fs.overlay = fs.overlay,
  hemi = "both",
  knn = c(10000L, 10000L),
  n.surr = 1000L,
  n.cores = 10L,
  kernel = "gaussian"
)
#fs_plot(sa[sample(1:10,1),], "both")
save(sa.5HT2A, file = "./output/5HT2A_Variograms/lh.rh.5HT2A.knn10000.sa1000.rda")

##| 5HTR4 --------------------------------------------------------
##|

fs.overlay <- c(pet.5HT$`5HT4`$lh,
                pet.5HT$`5HT4`$rh)
fs.overlay[fsavg6$medial.wall.verts$both] <- NA

sa.5HT4 <- fs_create_surrogates(
  fs.overlay = fs.overlay,
  hemi = "both",
  knn = c(20000L, 20000L),
  n.surr = 1000L,
  n.cores = 10L,
  kernel = "gaussian"
)
#fs_plot(sa[sample(1:10,1),], "both")
save(sa.5HT4, file = "./output/5HT4_Variograms/lh.rh.5HT4.knn20000.sa1000.rda")

##| BZ --------------------------------------------------------
##|

fs.overlay <- c(pet.GABAABZ$lh,
                pet.GABAABZ$rh)
fs.overlay[fsavg6$medial.wall.verts$both] <- NA

sa.BZ <- fs_create_surrogates(
  fs.overlay = fs.overlay,
  hemi = "both",
  knn = c(20000L, 20000L),
  n.surr = 1000L,
  n.cores = 10L,
  kernel = "gaussian"
)
#fs_plot(sa[sample(1:10,1),], "both")
save(sa.BZ, file = "./output/5HT4_Variograms/lh.rh.BZ.knn20000.sa1000.rda")

##| 5HTR1A --------------------------------------------------------
##|

fs.overlay <- c(pet.5HT$`5HT1A`$lh,
                pet.5HT$`5HT1A`$rh)
fs.overlay[fsavg6$medial.wall.verts$both] <- NA

sa.5HT1A <- fs_create_surrogates(
  fs.overlay = fs.overlay,
  hemi = "both",
  knn = c(30000L, 30000L),
  n.surr = 1000L,
  n.cores = 10L,
  kernel = "gaussian"
)
#fs_plot(sa[sample(1:10,1),], "both")
save(sa.5HT1A, file = "./output/5HT1A_Variograms/lh.rh.5HT1A.knn10000.sa1000.rda")
