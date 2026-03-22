#!/bin/bash

LOG_FILE="/home/moon/문서/study/linux_study/linux_automation_lab/
logs/cleanup_$(date +%Y%m%d).log

echo "===== 실행시간 : $(date) ====" >> "$LOG_FILE"

TARGET_FILES=$(find logs -type f -name "*.log" -mtime +7)
COUNT=$(echo "$TARGET_FILES" | grep -c .)

echo "삭제 대상 파일 수 " $COUNT" | tee -a "$LOG_FILE"

if ["$COUNT" -eq 0]; then
	echo "삭제할 파일이 없습니다." | tee -a "$LOG_FILE"
	exit 0
fi

echo "삭제를 진행하시겠습니까? (y/n) : "
read ANSWER

if [ $"ANSWER" = "y" ]; then
	find logs -type f -name "*.log" -mtime +7 -print -delete | tee -a "$LOG_FILE"
	echo "삭제 완료" | tee -a "$LOG_FILE"
else
	echo "삭제 취소"| tee -a "$LOG_FILE"
fi

echo "===== 작업 종료 ====" >> "$LOG_FILE"

 
