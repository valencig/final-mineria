#!/bin/sh
cd /model
conda activate py37
supervisord -c /etc/supervisord.conf  > log/model.log 2>&1 