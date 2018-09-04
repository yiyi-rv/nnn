#!/bin/bash
set -x

json_out=`pwd`/errors.json
report_out=`pwd`/report

apt install -y libncursesw5-dev libreadline6-dev pkg-config
CC=kcc LD=kcc CFLAGS="-fissue-report=$json_out" make -j`nproc`
timeout 5s ./nnn

rv-html-report $json_out -o $report_out
rv-upload-report $report_out
