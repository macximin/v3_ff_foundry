---
schema_version: firefly_wgp_supervisor_attachment_receipt_v1
work_slug: afterlife_restaurant
pipeline_target_range: B001-B015
status: corrected_source_attached_not_sent
observed_at: 2026-07-28T11:09:00Z
wgp_chat_url: https://chatgpt.com/c/6a656f75-91d0-83ee-9fbb-0b5ffbb3488c
wgp_chat_title: "저승식당 초반 목적성 논의"
source_packet_path: 40_works/afterlife_restaurant/07_dispatch/b001_b015_wgp_arc_pipeline_source_20260728.md
source_packet_sha256: 247dad22cc32650afa8543f75391ebc28fde4b5406ecc60276676857ea753394
composer_display_filename: b001_b015_wgp_arc_pipeline_source_20260728(1).md
---

# Supervisor attachment receipt

- Chrome Beta의 정확한 저승식당 채팅 URL과 제목을 확인했다.
- `파일 등 추가` 메뉴의 `컴퓨터에서 업로드하세요` 항목이 여는 browser file
  chooser에 1차 감리 보정 뒤 source packet의 정확한 절대 경로를 전달했다.
- 전송 전 composer에서
  `b001_b015_wgp_arc_pipeline_source_20260728(1).md` 이름의 group이 정확히
  하나 보이는 것을 확인했다. `(1)`은 같은 채팅의 과거 동명 첨부 때문에
  ChatGPT가 표시명에 붙인 충돌 suffix다. 로컬 source 경로와 내용 SHA는 위
  값으로 고정된다. 과거 메시지의 동명 첨부는 이 개수에 포함하지 않았다.
- 메시지 본문 입력, 전송, WGP 응답 생성은 수행하지 않았다.
- 다음 Hermes 실행은 SHA
  `247dad22cc32650afa8543f75391ebc28fde4b5406ecc60276676857ea753394`
  와 이 칩을 확인하고, 중복 첨부 없이 Phase 1 재감리 본문과 함께 한 번만
  전송한다.
