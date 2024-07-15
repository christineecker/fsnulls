import os
import time
from brainsmash.utils.dataio import load
from brainsmash.workbench.geo import cortex
from brainsmash.mapgen.eval import sampled_fit

def get_variogram_fit_py(data_dir, fsdata_dir, hemi, kernel, knn, ns, pv, resample, nsurr, njobs):
 start = time.time()
 ns = int(ns)
 knn = int(knn)
 pv = int(pv)
 nsurr = int(nsurr)
 njobs = int(njobs)
 brain_map_file = load(os.path.join(data_dir, "fs.tmp.gii"))
 if hemi == "lh":
   distmat = "distmat_lh.npy"
   index = "index_lh.npy"
 elif hemi == "rh":
   distmat = "distmat_rh.npy"
   index = "index_rh.npy"
 else:
   print(" ")
 kwargs = {'ns': ns,
          'knn': knn,
          'nh': 25,
          'deltas': [0.3, 0.5, 0.7, 0.9],
          'pv': pv,
          'resample' : resample,
          'kernel' : kernel,
          'n_jobs' : njobs,
          'seed' : 123
          }
 print("Python: getting Variogram fit for " + str(hemi) + " and knn = " + str(knn) + " based on " + str(nsurr) + " surrogates")
 fit = sampled_fit(brain_map_file, os.path.join(fsdata_dir, distmat), os.path.join(fsdata_dir, index), return_data = True, nsurr=nsurr, **kwargs)
 end = time.time()
 runtime = round(end - start, 2)
 print(f"running time: {runtime} secs")
 return fit
