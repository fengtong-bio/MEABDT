#!/usr/bin/python
from __future__ import unicode_literals
from Bio import SeqIO
# -*- coding: utf-8 -*-

#####Import Module#####
import collections
import sys
import os
import math
import time
import glob
import re
import logging
import random

##################
def rename_gene(input,output):
    with open(input,"r") as f1, open(output,"w") as f2:
        for seq_record in SeqIO.parse(f1, "fasta"):
            f2.write('>%s\n%s\n' % (str(seq_record.id),str(seq_record.seq)))
try:
    rename_gene(sys.argv[1],sys.argv[2])
except IndexError:
    sys.stderr.write("Usage:\npython3 %s [input.txt] [output.txt] \n" % (__file__[__file__.rfind(os.sep) + 1:]))
    sys.exit(0)
