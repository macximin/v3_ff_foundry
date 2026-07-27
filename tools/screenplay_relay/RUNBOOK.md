# Screenplay Doctor

현재 구현은 **읽기 전용 검사기**다. 생성·승격·Drive 업로드는 하지 않는다.

```powershell
.\tools\screenplay_relay\Invoke-ScreenplayDoctor.ps1
.\tools\screenplay_relay\Invoke-ScreenplayDoctor.ps1 .\45_screenworks\<family>\variants\<screenwork>
.\tools\screenplay_relay\Invoke-ScreenplayDoctor.ps1 .\45_screenworks\<family>\variants\<screenwork> -Json
```

검사 범위:

- `45_screenworks` 바깥과 `40_works` target 거부
- family/variant 필수 골격과 schema version
- 원작 각색 exact revision SHA-256 또는 screen original 선언
- Fountain과 `.scenes.json`의 scene ID·순서 일치
- split/merge/omit ID 계약과 episode 시간 예산
- 봉인 BR0보다 앞선 BR1 차단
- producer/reviewer family 분리
- owner 승인 파일의 실제 SHA-256과 passing BR1
- artifact parent hash drift와 Planning State의 provisional/rebuildable 계약

검사기는 파일을 수정하지 않는다. 오류가 나면 해당 후보를 고친 뒤 같은 명령을 다시 실행한다.
