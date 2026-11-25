cask "kandong" do
  version "0.7.0"
  sha256 "e663cb6aaf3678b414ac2c8ece48bdfca153e32f0ddc088a76db97bc3a2746d4"

  url "https://github.com/Tien-Cheng/kandong/releases/download/v#{version}/Kandong-#{version}.zip"
  name "Kandong"
  name "看懂"
  desc "Menu bar lookup for learning Chinese: pinyin, word breakdown and translation"
  homepage "https://github.com/Tien-Cheng/kandong"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :tahoe

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

    Translations use Apple Intelligence (turn it on in System Settings); ChatGPT and LM Studio also work.
  EOS
end
