#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# Authors:     PB
# Maintainers: PB
# Copyright:   2017, HRDAG, GPL v2 or later
# ============================================
# dotfiles/scripts/projpath.py
# inserted with :r !projpath.py %
# could be integrated into a snippet?

import os.path
import sys

original_startpath = os.path.realpath(sys.argv[1])
startpath = os.path.abspath(original_startpath)
subdirs = os.listdir(startpath)
while True:
    startpath = os.path.dirname(startpath)
    if startpath == '/':
        raise OSError("no git dir found in {}.".format(original_startpath))
    if '.git' in subdirs:
        break
    subdirs = next(os.walk(startpath))[1]
print(startpath)
