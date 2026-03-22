#!/bin/bash

LOG_DIR="../logs"

find $LOG_DIR -type f -name "*.log" -mtime +7 -exec rm {} \;

echo "7일 지난 로그 삭제 완료"



