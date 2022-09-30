#!/usr/env/bin/python3

#
# Convert windows path into unix path
# for WSL
#
# Usage python3 winpath.py "path_to_convert"
#

import sys

def sanitize_path(path):
    return '/mnt/' + path[0].lower() + '{}'.format(path.replace("\\", "/").split(":")[1])

if __name__ == "__main__":
    print(sanitize_path(sys.argv[1]))
