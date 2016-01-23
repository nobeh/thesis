#!/bin/bash

#
# To use this script, make sure the 'build' script does not "clean".
# The '.aux' file is needed.
#

bibtool -v -x thesis.aux -s -d -i refs/refs-p0*.bib -o refs/mrefs.bib
