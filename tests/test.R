
fs.overlay <- c(pet.5HT$`5HT2A`$lh,
                pet.5HT$`5HT2A`$rh)
fs.overlay[fsavg6$medial.wall.verts$both] <- NA

sa.5HT2A <- fs_create_surrogates(
  fs.overlay = fs.overlay,
  hemi = "both",
  knn = c(1000L, 1500L),
  n.surr = 10L,
  n.cores = 10L,
  kernel = "gaussian"
)
#fs_plot(sa[sample(1:10,1),], "both")

write.dir <- "./output/5HT2A_Variograms/"
dir.create(write.dir)
save(sa.5HT2A, file = paste0(write.dir, "lh.rh.5HT2A.knn10000.sa1000.rda"))

fs_plot(sa.5HT2A[1,], "both")
