cask "reel" do
  version "1.3.2"
  sha256 "d35abd3e609a7cdb27ec605225908d1153e04d2f4fc4e6ccbf9ff5bba082f7f6"

  url "https://github.com/waylake/reel/releases/download/v#{version}/Reel.app.zip"
  name "Reel"
  desc "Native menu bar video downloader, powered by yt-dlp"
  homepage "https://reel.waylake.com/"

  depends_on macos: :sonoma

  # 앱이 Sparkle로 스스로 갱신한다. brew가 버전을 앞지르지 않게 한다.
  auto_updates true

  app "Reel.app"

  postflight do
    # Homebrew는 내려받은 앱에 격리 속성을 붙인다. Reel은 아직 Apple 공증을
    # 받지 않았으므로 격리된 채로는 첫 실행이 막힌다. 격리 속성만 정확히 지운다.
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Reel.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Reel",
    "~/Library/Caches/com.waylake.reel",
    "~/Library/Preferences/com.waylake.reel.plist",
    "~/Library/HTTPStorages/com.waylake.reel",
  ]
end
