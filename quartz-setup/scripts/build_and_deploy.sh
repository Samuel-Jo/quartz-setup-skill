#!/bin/bash
"""쿼츠 블로그 빌드 및 GitHub Pages 배포 스크립트"""

set -e

QUARTZ_DIR="${QUARTZ_DIR:-~/quartz}"

echo "🚀 쿼츠 빌드 및 배포 시작..."

# 쿼츠 디렉토리로 이동
cd "$QUARTZ_DIR" || { echo "❌ 쿼츠 디렉토리를 찾을 수 없습니다"; exit 1; }

# 변경 사항 확인
if [ -z "$(git status --porcelain content)" ]; then
    echo "ℹ️  배포할 변경 사항이 없습니다."
    exit 0
fi

# Git 커밋
echo "📝 변경 사항 커밋..."
git add content/
read -p "커밋 메시지를 입력하세요: " message
git commit -m "$message" || { echo "⚠️  커밋할 내용이 없습니다"; exit 0; }

# GitHub에 푸시
echo "📤 GitHub에 푸시..."
git push

echo "✅ 배포 완료! GitHub Pages에서 1-3분 내에 반영됩니다."
