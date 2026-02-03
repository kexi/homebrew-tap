class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.18.4-beta.19"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.18.4-beta.19/vibe-darwin-arm64"
      sha256 "10bed797e063d5ebd9e49e85b2fad54c22d629fbfd6d87662fbb6f24537530e6"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.18.4-beta.19/vibe-darwin-x64"
      sha256 "bbfe37f2d789f522b67d06d141aff9e782ea92bd2fc13090e6499dc6735ef7ea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.18.4-beta.19/vibe-linux-arm64"
      sha256 "f40d8c97388b381db61db489c6a3348356e0fcbb559481c087adb26c7e9ae73f"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.18.4-beta.19/vibe-linux-x64"
      sha256 "9d52bd10817182abf52a8d3a0487008aed6cd3497a8bc39547d25b206c7364f5"
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
