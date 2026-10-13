cask "kandong" do
  version "0.2.0"
  sha256 "1cc94ce52ab8c87d9e04b7ae7fa52d88549250f46eeccfe057c9d688000d0a34"

  url "https://github.com/Tien-Cheng/kandong/releases/download/v#{version}/Kandong-#{version}.zip"
  name "Kandong"
  name "看懂"
  desc "Menu bar lookup for learning Chinese: pinyin, word breakdown and translation"
  homepage "https://github.com/Tien-Cheng/kandong"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :golden_gate

  app "Kandong.app"

  uninstall quit: "com.tiencheng.kandong"

  # ~/.config/kandong (Context, Terms, Vocabulary) is the user's own data and is left alone.
  zap trash: [
    "~/Library/Application Support/Kandong",
    "~/Library/Preferences/com.tiencheng.kandong.plist",
  ]

  caveats <<~EOS
    Kandong isn't notarized by Apple, so macOS blocks its first launch.
    Open it once, then go to System Settings → Privacy & Security and click "Open Anyway".

    Translations use Apple Intelligence (turn it on in System Settings); Codex and LM Studio also work.
  EOS
end
