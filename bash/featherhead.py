#!/opt/anaconda/bin/python3
# -*- coding: utf-8 -*-
#
# Authors:     GB
# Maintainers: GB
# License:     2018, Gus Brocchini, GPL v2 or later
# ===========================================
# featherhead.py

import sys
import pandas as pd

feather = pd.read_feather(sys.argv[1])
try:
    feather = feather.iloc[:int(sys.argv[2])]
except IndexError:
    feather = feather.iloc[:10]
to_print = feather.to_csv(sep='|', index=False)
print(to_print)

# done.
