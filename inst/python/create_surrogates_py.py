import os
import time
from numpy import savetxt
from brainsmash.utils.dataio import load
from brainsmash.workbench.geo import cortex
from brainsmash.mapgen.sampled import Sampled

def create_surrogates_py(data_dir, fsdata_dir, hemi, knn, kernel, n_surr, n_jobs):
 start = time.time()
 kwargs = {'ns': 500,
          'nh': 25,
          'deltas': [0.3, 0.5, 0.7, 0.9],
          'pv': 70,
          'resample' : True,
          'kernel' : kernel,
          'n_jobs' : int(n_jobs),
          'seed' : 123,
          'knn' : int(knn)
          }
 
 brain_map_file = load(os.path.join(data_dir, "fs.tmp.gii"))
 
 if hemi == "lh":
   print("Python: Creating " + str(n_surr) + " surrogates for " + hemi + " using knn = " + str(knn))
   distmat = "distmat_lh.npy"
   index = "index_lh.npy"
 elif hemi == "rh":
   print("Python: Creating " + str(n_surr) + " surrogates for " + hemi + " using knn = " + str(knn))
   distmat = "distmat_rh.npy"
   index = "index_rh.npy"
 else:
   print("no hemisphere selected")

 sampled = Sampled(brain_map_file, os.path.join(fsdata_dir, distmat), os.path.join(fsdata_dir, index), **kwargs)
 surrogates = sampled(n=int(n_surr))
 surrogate_filename = os.path.join(data_dir, "surrogates.csv")
 savetxt(surrogate_filename, surrogates, delimiter=',')
 end = time.time()
 runtime = round(end - start, 2)
 print(f"running time: {runtime} secs")
 return None
