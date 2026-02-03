class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.18.2-beta.15"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.18.2-beta.15/vibe-darwin-arm64"
      sha256 "aef300f601c975afc010a57e1d03914b4c4961548349b3e96f688bbf41b9e8bc"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.18.2-beta.15/vibe-darwin-x64"
      sha256 "f81479afa5c1cd89dddf847f3860b45a806fbd1ba6f6002b15911bc7cfa4f2b8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.18.2-beta.15/vibe-linux-arm64"
      sha256 "e7796e154b63b7b1275dfc892de5259b5ced8ef1f6f57635f598faa5e45d5a5c"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.18.2-beta.15/vibe-linux-x64"
      sha256 "d29066f38ad01122bd89a8c47b42c78a2de729f16a6d462e16421b85d4545926"
    end
  end

  def install
    binary_name = "vibe-darwin-arm64" if OS.mac? && Hardware::CPU.arm?
    binary_name = "vibe-darwin-x64" if OS.mac? && Hardware::CPU.intel?
    binary_name = "vibe-linux-arm64" if OS.linux? && Hardware::CPU.arm?
    binary_name = "vibe-linux-x64" if OS.linux? && Hardware::CPU.intel?

    bin.install binary_name => "vibe-beta"
  end

  def caveats
    <<~EOS
      ⚠️  This is a BETA version installed from the develop branch.
      It may contain unstable features. For the stable release, use:
        brew install kexi/tap/vibe

      Add this to your .zshrc:
        vibe-beta() { eval "$(command vibe-beta "$@")" }
    EOS
  end

  test do
    system "#{bin}/vibe-beta", "--help"
  end
end
