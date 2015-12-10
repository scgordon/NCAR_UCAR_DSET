#!/bin/bash
/mnt/data/bedi/scripts/generateSS.py `find /mnt/data/bedi/collections/NASA -name "*.json" | grep CSW` &&
/mnt/data/bedi/scripts/generateSS.py `find /mnt/data/bedi/collections/NASA -name "*.json" | grep DCITE` &&
/mnt/data/bedi/scripts/generateSS.py `find /mnt/data/bedi/collections/NASA -name "*.json" | grep ACDD` &&
/mnt/data/bedi/scripts/generateSS.py `find /mnt/data/bedi/collections/NASA -name "*.json" | grep UMM`