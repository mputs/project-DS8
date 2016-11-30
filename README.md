# project-DS8

data available at [jpl.nasa.gov] (http://oco.jpl.nasa.gov/science/OCO2DataCenter/)

It seems to be a good solution if we would import HDF5 into parquet. For the first project, however, it seems to be better when we just convert to csv. this can be done by the following python code:
```python
import numpy as np
import h5py
np.savetxt(sys.stdout, h5py.File('foo.h5')['dataname'], '%g', ',')
```
