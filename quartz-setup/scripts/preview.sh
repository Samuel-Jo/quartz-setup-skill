#!/bin/bash
"""쿼츠 로컬 미리보기 서버 실행 스크립트"""

set -e

QUARTZ_DIR="${QUARTZ_DIR:-~/quartz}"

echo "👁️  쿼츠 로컬 미리보기 서버 시작..."

cd "$QUARTZ_DIR" || { echo "❌ 쿼츠 디렉토리를 찾을 수 없습니다"; exit 1; }

# 쿼츠 빌드 및 서버 실행
echo "🔨 빌드 중..."
npm run docs

# Ctrl+C로 종료 시 정리
trap "echo \"\\n🛑 미리보기 서버 종료\"" EXIT
