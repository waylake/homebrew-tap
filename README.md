# waylake/homebrew-tap

waylake의 macOS 앱을 위한 Homebrew tap.

```bash
brew tap waylake/tap
```

## Casks

| Cask | 설명 |
|---|---|
| `four-eight` | [FourEight](https://github.com/waylake/four-eight) — 사주 명식 계산과 온디바이스 해석 |

## 왜 공식 homebrew-cask가 아닌가

여기 담긴 앱들은 Apple Developer Program에 가입하지 않은 상태로 배포되므로 공증(notarization)을 받지 않았습니다. 공식 `homebrew-cask`는 audit에서 Gatekeeper 통과를 강제하므로 등재할 수 없습니다.

각 cask는 설치 후 `postflight`에서 격리 속성을 제거합니다. Homebrew는 내려받은 앱에 격리 속성을 붙이고, 공증되지 않은 앱은 격리된 채로는 macOS 15부터 시스템 설정을 거쳐야만 열리기 때문입니다.

**이는 사용자가 Gatekeeper 대신 이 저장소를 신뢰한다는 뜻입니다.** 그래서 `sha256`을 `:no_check`로 두지 않습니다. 릴리스 자산이 바뀌면 설치가 실패합니다.

내용을 직접 확인하고 설치하시길 권합니다.

```bash
brew cat waylake/tap/four-eight
```
