cask "kandong" do
  version "0.3.0"
  sha256 "69d0f1010b416fae23761ca45935d80d1c82cbb2c85b0d0fd4915b288222d1a6"

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
