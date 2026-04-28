# quartz-setup skill

Quartz 블로그(GitHub Pages) 발행용 OpenClaw Skill입니다.

이 스킬은 **한국어 글 작성 + 이미지 처리 + SEO + 빌드/배포 검증**을 한 번에 다루도록 설계되었습니다.

## 포함 파일
- `quartz-setup.skill` : 배포용 패키지
- `quartz-setup/` : 원본 스킬 폴더
  - `SKILL.md` : 워크플로우 본문
  - `scripts/create_post.py` : 포스트 템플릿 생성
  - `scripts/preview.sh` : 로컬 미리보기
  - `scripts/build_and_deploy.sh` : 커밋/푸시 보조

## 주요 기능
- 한국어 콘텐츠 작성 워크플로우
- 이미지 처리(로컬/외부/OG)
- CSS/폰트(한글 깨짐) 대응
- SEO frontmatter 규칙
- 빌드/검증/배포 체크리스트

## 권장 프로젝트 구조
- Quartz 루트: `~/quartz`
- 글 디렉토리: `~/quartz/content`
- 이미지 디렉토리: `~/quartz/content/images`
- 설정 파일: `~/quartz/quartz.config.ts`
- 사용자 CSS: `~/quartz/quartz/styles/custom.scss`

## 빠른 사용 흐름
1. `content/*.md`에 frontmatter 포함 글 작성
2. 이미지를 `content/images/`에 저장하고 상대경로로 삽입
3. 한글 폰트 설정(Noto Sans KR + fallback) 확인
4. `npx quartz build`로 빌드
5. `git add/commit/push` 후 GitHub Pages 배포 확인

## 설치/적용 (OpenClaw)
- 스킬 폴더를 OpenClaw skills 경로에 배치
- 에이전트가 Quartz 관련 요청 시 `quartz-setup` 워크플로우를 따름

## 자주 발생하는 문제
- 썸네일 한글 깨짐: 폰트 미지원 → `Noto Sans KR` 및 fallback 적용
- 이미지 미노출: 경로 오류/외부 링크 차단 → 로컬 이미지 사용 권장
- 배포 지연: GitHub Pages 반영 대기(보통 1~3분)

---
필요하면 이 저장소에 Quartz 템플릿 생성 자동화 스크립트까지 추가해 확장할 수 있습니다.
