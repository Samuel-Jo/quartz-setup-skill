---
name: quartz-setup
description: Quartz 블로그를 GitHub Pages로 발행하는 실전 스킬. 한국어 글 작성, 이미지 처리(로컬/외부/썸네일), CSS/폰트 깨짐 수정, SEO frontmatter, 빌드·검증·배포까지 한 번에 수행할 때 사용.
---

# Quartz 발행 워크플로우 (실전)

Quartz v4 블로그를 안정적으로 발행한다. 특히 **이미지 누락**, **한글 썸네일/폰트 깨짐**, **SEO 메타 누락**을 방지한다.

## 표준 경로

- 프로젝트 루트: `~/quartz`
- 글 디렉토리: `~/quartz/content`
- 이미지 디렉토리: `~/quartz/content/images`
- 설정 파일: `~/quartz/quartz.config.ts`
- 사용자 CSS: `~/quartz/quartz/styles/custom.scss`

## 1) 글 작성 규칙 (필수)

새 글은 `content/*.md`에 저장하고 frontmatter를 반드시 포함한다.

```markdown
---
title: "제목"
date: 2026-03-02
tags:
  - ai
  - quartz
description: "메타 설명"
---
```

### 파일명 규칙

- 영문 slug 권장: `ai-agent-trends-2026.md`
- 한글 파일명은 가능하지만 URL 인코딩 이슈가 있어 비권장

## 2) SEO 기본 체크

- `title`: 60자 내외
- `description`: 120~155자
- 본문 첫 단락에 핵심 키워드 포함
- H2/H3 구조화
- 내부 링크 1개 이상

## 3) 이미지 처리 규칙 (중요)

### 권장 방식

1. 이미지 파일을 `content/images/`에 저장
2. 본문에서는 상대경로 사용

```markdown
![설명](./images/my-chart.png)
```

### 외부 이미지 사용 시

- CDN/원본 이미지 직접 링크 가능
- 다만 원본 삭제/차단 리스크 있음 → 핵심 이미지는 로컬 보관 권장

### 썸네일/OG 이미지

- Quartz `CustomOgImages` 사용 시 텍스트 렌더 폰트 영향을 받음
- 한글 깨짐 방지를 위해 폰트 설정을 반드시 적용

## 4) CSS/폰트(한글 깨짐) 대응

`quartz.config.ts`의 typography를 한글 지원 폰트로 설정한다.

```ts
typography: {
  header: "Noto Sans KR",
  body: "Noto Sans KR",
  code: "IBM Plex Mono",
}
```

필요 시 `quartz/styles/custom.scss`에 fallback 지정:

```scss
:root {
  --headerFont: "Noto Sans KR", "Apple SD Gothic Neo", "Malgun Gothic", sans-serif;
  --bodyFont: "Noto Sans KR", "Apple SD Gothic Neo", "Malgun Gothic", sans-serif;
}
```

## 5) 빌드/검증/배포

```bash
cd ~/quartz
npx quartz build
git status
git add content/ quartz.config.ts quartz/styles/custom.scss
git commit -m "feat: 새 글 발행"
git push
```

## 6) 배포 후 검증 체크리스트

- [ ] 글 URL 정상 접속
- [ ] 본문 이미지 로딩 정상
- [ ] 썸네일/OG 한글 깨짐 없음
- [ ] 제목/설명 메타 정상
- [ ] 모바일에서 폰트/줄바꿈 확인

## 7) 자주 발생하는 문제

### Q1. 썸네일 한글이 깨진다
- 원인: 폰트 미지원
- 해결: `Noto Sans KR`로 typography 교체 + fallback CSS 추가

### Q2. 이미지가 안 보인다
- 원인: 경로 오류 또는 외부 링크 차단
- 해결: `content/images`로 이동 후 상대경로 재지정

### Q3. 푸시했는데 바로 안 보인다
- 원인: GitHub Pages 배포 지연
- 해결: 1~3분 대기 후 새로고침, Actions 상태 확인

## scripts

- `scripts/create_post.py`: 새 포스트 템플릿 생성
- `scripts/preview.sh`: 로컬 미리보기
- `scripts/build_and_deploy.sh`: 커밋/푸시 보조

필요 시 스크립트보다 위 워크플로우를 우선한다(경로/환경 차이 대응).
