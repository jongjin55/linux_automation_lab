#!/bin/bash

LOG_FILE="../../logs/cleanuup_$(date +%Y%m%d).log"

echo "==== 실행시간 : $(date) ====" >> "$LOG_FILE"

find ../../logs -type f -name "*.log" -mtime +7 -print -delete >> "$LOG_FILE"

echo "====  작업 종료 ====" >> "$LOG_FILE"
