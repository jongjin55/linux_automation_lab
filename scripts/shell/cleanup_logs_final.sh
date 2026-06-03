#!/bin/bash

# 로그 디렉토리 ( 삭제 대상)
TARGET_DIR="/c/Users/dmer1/Documents/study/linux/linux_automation_lab/logs"

# 스크립트 로그 저장 위치
SCRIPT_LOG_DIR="/c/Users/dmer1/Documents/study/linux/linux_automation_lab/schell/scripts_logs"

# 로그 파일 생성
LOG_FILE="$SCRIPT_LOG_DIR/cleanup_$(date +%Y%m%d).log"

# 로그 디렉토리 없으면 생성
mkdir -p  "$SCRIPT_LOG_DIR"

echo  "==== $(date) cleanup start ====" >> "$LOG_FILE"

# 삭제 대상 확인
FILES=$(find "$TARGET_DIR" -type f -name "*.log" -mtime +7)

# 개수 확인
COUNT=$(echo "$FILES" | grep -c .)

echo "삭제 대상 파일 개수 : $COUNT" >> "$LOG_FILE"

# 삭제 대상 출력
echo "$FILE" >> "$LOG_FILE"


# 파일이 있을 경우만 삭제
if [ "$COUNT" -gt 0 ];  then
    find "$TARGET_DIR" -type f -name "*.log" -mtime +7 -print -delete >> "$LOG_FILE" 2>&1
    echo "삭제완료" >> "$LOG_FILE"
else
    echo "삭제할 파일 없음" >> "$LOG_FILE"
fi

echo "==== $(date) cleanup end ====" >> "$LOG_FILE"
