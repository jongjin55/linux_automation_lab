#!/bin/bash

TARGET_FILES=$(find logs -type f -name "*.log" -mtime +7)
COUNT$(echo "$TARGET_FILES" | wc -l)

echo "삭제 대상 파일 수: $COUNT"

if [ "$COUNT" -eq 0 ]; then
	echo "삭제할 파일이 없습니다"
	exit 0
fi

echo "삭제를 진행하시겠습니까? (y/n)"
read ANSWER

if [ "$ANSWER" =  "y" ]; then
	find logs -type f -name "*.log" -mtime +7 -delete
	echo "삭제 완료"
else
	echo "삭제 취소"
fi

