
##| 5HT1A
##| -----------------------------------------------------

fs.overlay <- c(fsdata::pet.5HT$`5HT1A`$lh)
fs.overlay[fsdata::fsavg6$medial.wall.verts$lh] <- NA

knn.optimal <-
  get_optimal_knn(
    fs.overlay,
    hemi = "lh",
    knn.tested = c(5000, 10000, 20000, 30000, 40000),
    n.surr = 100,
    n.jobs = 10,
    write.dir = "./output/5HT1A_Variograms/lh/"
  )

# Python: getting Variogram fit for lh and knn = 5000 based on 100 surrogates
# running time: 544.26 secs
# Python: getting Variogram fit for lh and knn = 10000 based on 100 surrogates
# running time: 1453.78 secs
# Python: getting Variogram fit for lh and knn = 20000 based on 100 surrogates
# running time: 2898.57 secs
# Python: getting Variogram fit for lh and knn = 30000 based on 100 surrogates
# running time: 4262.71 secs
# Python: getting Variogram fit for lh and knn = 40000 based on 100 surrogates
# running time: 5796.66 secs
# The optimal knn for the lh hemisphere is: 30000

##| 5HT2A
##| -----------------------------------------------------

fs.overlay <- c(fsdata::pet.5HT$`5HT2A`$lh)
fs.overlay[fsdata::fsavg6$medial.wall.verts$lh] <- NA
knn.optimal <-
  get_optimal_knn(
    fs.overlay,
    hemi = "lh",
    knn.tested = c(5000, 10000, 20000, 30000, 40000),
    n.surr = 100,
    n.jobs = 10,
    write.dir = "./output/5HT2A_Variograms/lh/"
  )

# [1] "Directory created: ./output/5HT2A_Variograms/lh"
# Python: getting Variogram fit for lh and knn = 5000 based on 100 surrogates
# running time: 542.01 secs
# Python: getting Variogram fit for lh and knn = 10000 based on 100 surrogates
# running time: 1334.11 secs
# Python: getting Variogram fit for lh and knn = 20000 based on 100 surrogates
# running time: 2702.52 secs
# The optimal knn for the lh hemisphere is: 10000

##| 5HT4
##| -----------------------------------------------------

fs.overlay <- c(fsdata::pet.5HT$`5HT4`$lh)
fs.overlay[fsdata::fsavg6$medial.wall.verts$lh] <- NA
knn.optimal <-
  get_optimal_knn(
    fs.overlay,
    hemi = "lh",
    knn.tested = c(5000, 10000, 20000, 30000, 40000),
    n.surr = 100,
    n.jobs = 10,
    write.dir = "./output/5HT4_Variograms/lh/"
  )

# [1] "Directory created: ./output/5HT4_Variograms/lh"
# Python: getting Variogram fit for lh and knn = 5000 based on 100 surrogates
# running time: 472.4 secs
# Python: getting Variogram fit for lh and knn = 10000 based on 100 surrogates
# running time: 1330.84 secs
# Python: getting Variogram fit for lh and knn = 20000 based on 100 surrogates
# running time: 2694.03 secs
# Python: getting Variogram fit for lh and knn = 30000 based on 100 surrogates
# running time: 4152.76 secs
# The optimal knn for the lh hemisphere is: 20000

##| BZ
##| -----------------------------------------------------

fs.overlay <- c(fsdata::pet.GABAABZ$lh)
fs.overlay[fsdata::fsavg6$medial.wall.verts$lh] <- NA

knn.optimal <-
  get_optimal_knn(
    fs.overlay,
    hemi = "lh",
    knn.tested = c(5000, 10000, 20000, 30000, 40000),
    n.surr = 100,
    n.jobs = 10,
    write.dir = "./output/BZ_Variograms/lh/"
  )

# [1] "Directory created: ./output/BZ_Variograms/lh"
# Python: getting Variogram fit for lh and knn = 5000 based on 100 surrogates
# running time: 481.83 secs
# Python: getting Variogram fit for lh and knn = 10000 based on 100 surrogates
# running time: 1353.59 secs
# Python: getting Variogram fit for lh and knn = 20000 based on 100 surrogates
# running time: 2755.51 secs
# Python: getting Variogram fit for lh and knn = 30000 based on 100 surrogates
# The optimal knn for the lh hemisphere is: 20000
# running time: 4164.41 secs
# Creating Variogram plots ...


##| 5HT1A
##| -----------------------------------------------------

fs.overlay <- c(fsdata::pet.5HT$`5HT1A`$rh)
fs.overlay[fsdata::fsavg6$medial.wall.verts$rh] <- NA

knn.optimal <-
  get_optimal_knn(
    fs.overlay,
    hemi = "rh",
    knn.tested = c(5000, 10000, 20000, 30000, 40000),
    n.surr = 100,
    n.jobs = 10,
    write.dir = "./output/5HT1A_Variograms/rh/"
  )

# [1] "Directory created: ./output/5HT1A_Variograms/rh/"
# Python: getting Variogram fit for rh and knn = 5000 based on 100 surrogates
# running time: 506.96 secs
# Python: getting Variogram fit for rh and knn = 10000 based on 100 surrogates
# running time: 1411.97 secs
# Python: getting Variogram fit for rh and knn = 20000 based on 100 surrogates
# running time: 2841.88 secs
# Python: getting Variogram fit for rh and knn = 30000 based on 100 surrogates
# running time: 4290.18 secs
# Python: getting Variogram fit for rh and knn = 40000 based on 100 surrogates
# The optimal knn for the rh hemisphere is: 30000

##| 5HT2A
##| -----------------------------------------------------

fs.overlay <- c(fsdata::pet.5HT$`5HT2A`$rh)
fs.overlay[fsdata::fsavg6$medial.wall.verts$rh] <- NA
knn.optimal <-
  get_optimal_knn(
    fs.overlay,
    hemi = "rh",
    knn.tested = c(5000, 10000, 20000, 30000, 40000),
    n.surr = 100,
    n.jobs = 10,
    write.dir = "./output/5HT2A_Variograms/rh/"
  )

# [1] "Directory created: ./output/5HT2A_Variograms/rh/"
# running time: 5926.72 secs
# Python: getting Variogram fit for rh and knn = 5000 based on 100 surrogates
# running time: 480.97 secs
# Python: getting Variogram fit for rh and knn = 10000 based on 100 surrogates
# running time: 1321.72 secs
# Python: getting Variogram fit for rh and knn = 20000 based on 100 surrogates
# The optimal knn for the rh hemisphere is: 10000

##| 5HT4
##| -----------------------------------------------------

fs.overlay <- c(fsdata::pet.5HT$`5HT4`$rh)
fs.overlay[fsdata::fsavg6$medial.wall.verts$rh] <- NA
knn.optimal <-
  get_optimal_knn(
    fs.overlay,
    hemi = "rh",
    knn.tested = c(5000, 10000, 20000, 30000, 40000),
    n.surr = 100,
    n.jobs = 10,
    write.dir = "./output/5HT4_Variograms/rh/"
  )

# [1] "Directory created: ./output/5HT4_Variograms/rh/"
# running time: 2682.79 secs
# Python: getting Variogram fit for rh and knn = 5000 based on 100 surrogates
# running time: 481.53 secs
# Python: getting Variogram fit for rh and knn = 10000 based on 100 surrogates
# running time: 1321.05 secs
# Python: getting Variogram fit for rh and knn = 20000 based on 100 surrogates
# running time: 2683.69 secs
# Python: getting Variogram fit for rh and knn = 30000 based on 100 surrogates
# The optimal knn for the rh hemisphere is: 20000

##| BZ
##| -----------------------------------------------------

fs.overlay <- c(fsdata::pet.GABAABZ$rh)
fs.overlay[fsdata::fsavg6$medial.wall.verts$rh] <- NA

knn.optimal <-
  get_optimal_knn(
    fs.overlay,
    hemi = "rh",
    knn.tested = c(5000, 10000, 20000, 30000, 40000),
    n.surr = 100,
    n.jobs = 10,
    write.dir = "./output/BZ_Variograms/rh/"
  )

# [1] "Directory created: ./output/BZ_Variograms/rh/"
# running time: 4102.76 secs
# Python: getting Variogram fit for rh and knn = 5000 based on 100 surrogates
# running time: 490.92 secs
# Python: getting Variogram fit for rh and knn = 10000 based on 100 surrogates
# running time: 1334.67 secs
# Python: getting Variogram fit for rh and knn = 20000 based on 100 surrogates
# running time: 2692.34 secs
# Python: getting Variogram fit for rh and knn = 30000 based on 100 surrogates
# The optimal knn for the rh hemisphere is: 20000
# running time: 4082.29 secs
