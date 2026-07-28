cask "four-eight" do
  version "0.1.0"
  sha256 "cac30453644d485bb31e155625255e7495b3271115f434261b4af27fbd11760c"

  url "https://github.com/waylake/four-eight/releases/download/v#{version}/FourEight.zip"
  name "FourEight"
  desc "Four Pillars of Destiny reading, computed and interpreted on device"
  homepage "https://github.com/waylake/four-eight"

  # 문자열 비교 형태(">= :sequoia")는 Homebrew 6에서 deprecated다.
  depends_on macos: :sequoia

  # 앱이 Sparkle로 스스로 갱신하므로 brew가 버전을 앞지르려 하지 않게 한다.
  auto_updates true

  app "FourEight.app"

  postflight do
    # Homebrew는 내려받은 앱에 격리 속성을 붙인다. 이 앱은 Apple 공증을
    # 받지 않았으므로 격리된 채로는 macOS 15+에서 시스템 설정을 거쳐야만
    # 열린다. 격리만 정확히 제거한다 -- xattr -cr은 provenance 등 다른
    # 속성까지 지우므로 쓰지 않는다.
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/FourEight.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/FourEight",
    "~/Library/Caches/com.waylake.FourEight",
    "~/Library/Preferences/com.waylake.FourEight.plist",
    "~/Library/HTTPStorages/com.waylake.FourEight",
    "~/Library/Containers/com.waylake.FourEight",
  ]
end
