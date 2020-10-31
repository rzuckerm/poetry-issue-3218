#!/bin/bash
set -x
mkdir -p "${HOME}"

cd mytest || exit 1

poetry env use 2.7
poetry run python2.7 -c '
import sysconfig
import pprint
pprint.pprint(sysconfig.get_paths())
'
poetry install -vvv
